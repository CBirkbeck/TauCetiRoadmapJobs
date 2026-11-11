<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13151#issuecomment-6785599076 -->
Red team round 1 pass a (codex) of a6b9eb2

Verdict: needs_changes

1. **F01** (P1) Characteristic-p Galois cohomology has two owners

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:905–917`, `packages/LocalFieldsRamificationPartII/Suggested.lean:105–108`. Claim: this roadmap owns and proves the characteristic-p absolute-Galois cohomological-dimension theorem.

   **Witness:** `TauCetiRoadmap/ProfiniteCohomologyPartII/README.md:227–231` assigns exactly this theorem, including additive separable-closure acyclicity, to ProfiniteCohomology through `gap:char-p-galois-h2-vanishing`; its matching plan entry specifies Layer 9. ProfiniteCohomology is already on main.

   **Exact repair:** Replace the ownership claim and §3.1 proof target with: “Supplied by ProfiniteCohomology, Layer 9, through gap:char-p-galois-h2-vanishing: for a prime p and every field F of characteristic p, cd_p(G_F) ≤ 1, via Artin–Schreier and the vanishing of H^q(G_F,Fˢ) for q ≥ 1.” Register the same precise contract in this package's README and top-level gaps list, and remove `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` from Suggested.lean. Keep §3.1 as the import location, update §3.6 and the scope/docstring ownership lists accordingly. This reports conflicting ownership, not the absence of a declared supplier result. For F = F₂, the imported bound is still 1 ≤ 1; for a separably closed characteristic-2 field it is 0 ≤ 1. No later supplier is introduced.

2. **F02** (P2) The noncomplete Krasner bridge is missing from the acceptance test

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:1085–1089`; `packages/LocalFieldsRamificationPartII/Suggested.lean:19–41`. Claim: the roadmap proves Krasner's property for normal algebraic extensions of henselian rank-one normed fields, without completeness. Neither the theorem nor a reason for its omission appears in Suggested.lean.

   **Witness:** `Mathlib/Analysis/Normed/Field/Krasner.lean:56–58` defines the native conclusion `IsKrasner`; lines 70–73 require `CompleteSpace` for the available theorem. Native `Valuation`, `HenselianLocalRing`, `Normal`, and normed-field carriers suffice to state the missing bridge.

   **Exact repair:** Add the following headline, with a mathematical docstring, a README name, and a Layer 4 section comment in README order:

   ```lean
   theorem isKrasner_of_henselian
       (K L : Type*) [NontriviallyNormedField K] [NormedField L]
       [IsUltrametricDist K] [NormedAlgebra K L] [Normal K L]
       (vK : Valuation K ℝ≥0) (hvK : ∀ x : K, vK x = ‖x‖₊)
       [HenselianLocalRing vK.valuationSubring] : IsKrasner K L := by
     sorry
   ```

   This retains the noncomplete case K = the p-adic henselization of Q, with L a finite normal extension and its extended norm; it does not silently substitute Q_p or assume the conclusion. In the complete case K = Q_p it agrees with the pinned theorem. The proposed signature is a read-only interface prescription, not a claimed elaboration run.

3. **F03** (P2) One gap bundles two independent supplier obligations

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:252`; `packages/LocalFieldsRamificationPartII/design/plan.json` gap `source-side-fpqc-descent`. Claim: a single needs sentence asks both for finite-presentation descent and for pointwise étaleness descent.

   **Witness:** `ega4` lines 2750–2758 and 2795–2798 are different results, with different variables and hypotheses. The plan and README agree on the slug; the defect is the compound contract, not an undeclared or missing supplier.

   **Exact repair:** Retain `gap:source-side-fpqc-descent` for: “For f : X → Y faithfully flat and locally of finite presentation and g : Y → Z with g ∘ f of finite presentation, g is of finite presentation if f is quasi-compact or g is quasi-separated.” Add `gap:source-side-etale-descent`, with the same supplier SchemeAndStackFoundations, Layer 1 §1.1, for: “For X → S and Y → S locally of finite presentation, an S-morphism g : X → Y flat at x, and X → S étale at x, Y → S is étale at g(x).” Put both entries in README and the plan's gaps list and reference both in §2.1. For identity maps on Spec F₂ both conclusions hold; the second retains local finite presentation of both structure maps and flatness at the specified point.

4. **F04** (P3) Finite-height descent cites the wrong disjointness theorem

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:1413–1417`. Claim: the displayed Mathlib purely-inseparable/separable disjointness citation supplies the regular-base-change step.

   **Witness:** For K₀ = Q and K = Q(t), K/K₀ is relatively algebraically closed but not purely inseparable. The applicable pinned declaration is `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`, `TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean:138–140`.

   **Exact repair:** Replace that Mathlib citation in §6.3's Needs with “Tau Ceti `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`, `TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean` (a relatively algebraically closed base and a separable extension, in a common overfield with compatible scalar towers).” Add the same exact contract to the Tau Ceti supplier list. Keep the perfection argument to supply separability. The test Q(√2)/Q after base change to Q(t) still has degree 2, as the corrected theorem asserts; the old theorem's purely inseparable hypothesis is false.

5. **F05** (P3) Two examples make false universal claims

   **Locations and claims:** `packages/LocalFieldsRamificationPartII/README.md:431–432` says finite fields fail closedness for every nonempty P; `:1420–1421` says omitting one coefficient necessarily loses descent.

   **Witness:** P = {1} gives only degree 1 and every finite field is P-closed. For L/K = K/K and primitive polynomial X, omitting its zero coefficient changes no generated subfield.

   **Exact repair:** At 431–432 write “for every P containing a prime”. Replace 1420–1421 by: “For p = 1, K = Q(t) with the trivial valuation and L = K(√t), choose K₀ = Q(t), L₀ = L: the multiplication tensor map has degree 2. No finite constant extension E/Q satisfies E ⊗_Q Q(t) ≅ L, since L contains no new elements algebraic over Q; omitting the essential coefficient t and taking only Q cannot give this descent.” The first correction excludes P = {1}; the second distinguishes an essential transcendental coefficient from zero and prime-field coefficients.

6. **F06** (P3) Current consumers cite GF identifiers that the package never resolves

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:290–310` and the layer headings. Claim: the delivered section identifiers provide the interfaces consumed by the open siblings.

   **Witness:** `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:94` cites GF.0–GF.6 and GF.5/unramified-composition; `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:83–84` cites §GF.1, §GF.4 and §GF.5. This README contains no GF identifiers or mapping.

   **Exact repair:** Add a mathematical identifier correspondence, headed “Former GF identifiers and current sections”: GF.k → Layer k for 0 ≤ k ≤ 6, and explicit rows GF.0/prime-supported-degree → §0.1; GF.0/maximal-p-extension → §0.4; GF.1/normalization-and-prolongations → §1.1; GF.2/unramified-etale-criterion → §2.1; GF.2/unramified-extension → §2.3; GF.2/tame-extension → §2.4; GF.2/tower-laws → §2.8; GF.5/unramified-composition → §5.4; GF.5/abhyankar-and-rank → §5.3. Also map GF.0/p-extensions → §0.2, GF.0/separably-p-closed → §0.3, GF.2/perfection-tame-tower → §2.10; map GF.1/henselization as a valued field → §1.3, GF.4/rank-one Krasner approximation → §4.1 and GF.4/rank-one decompletion → §4.2. For the explicit GF.5/unramified-composition witness the destination then contains exactly the promised two-stage criterion. This is an interface mismatch with supplied current heads, not a claim that the dependency gate reported a dropped id.

7. **F07** (P3) Some purported Checks only repeat proof requirements

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:1008` (“Each identity requires injectivity”) and `:1403` (“Height 1 is exactly §4.5”). These neither instantiate the construction nor distinguish a correct result from an incorrect one.

   **Witness:** A surjective multiplication map of dimension 9 onto dimension 6 satisfies the first sentence's description of what is required just as a bijective map does; the second sentence supplies no field, valuation or computed value.

   **Exact repair:** Replace 1008 by “At the finite stage K = Q₃, E = Q₃(√3) and M/K unramified quadratic, e(E/K) = 2, f(M/K) = 2, E ∩ M = K, and multiplication E ⊗_K M → EM has source and target dimension 4 and zero kernel.” Replace 1403 by “For K = C₂, height is 1, the residue exponent is 2, every finite extension has degree 1, and Kᵗ = Kᵃ = K; for Q₂ at the same height, X² − 2 supplies degree 2 and e = 2, so the closedness hypothesis and tameness both fail.” These give actual values and a negative control.

8. **F08** (P1) The graded finite-presentation theorem is an unowned proof input

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:574–585`, especially “so it is finitely presented by Stacks, Lemma 15.26.4”. The Prüfer-domain proof invokes the graded theorem as available, but neither targets it nor names a supplier.

   **Witness:** `stacks-more-algebra` lines 2879–2885 require a finite-type graded algebra with finite degree-zero part and an injection into finitely many prime localizations. The named pinned flat/torsion-free theorem supplies none of this finite-presentation conclusion.

   **Exact repair:** Before the two ungraded conclusions in §1.5, add a named prose target: “Graded finite presentation: let R be a commutative ring admitting an injective map R → ∏ⱼ Rₚⱼ for a finite family of primes, S a nonnegatively graded finite-type R-algebra with S₀ finite as an R-module, and N a graded S-module. If S is R-flat, S is finitely presented over R; if N is finite over S and R-flat, N is finitely presented over S (Stacks tag 053D).” Also explicitly own the homogenization/dehomogenization step already used in the route: “For a finite-type R-algebra B and a finite B-module M, construct S generated in degree one with S₀ = R, f of degree one, and finite graded N, together with B ≅ S_(f) and M ≅ N_(f); finite presentations descend under these degree-zero localizations (proof of Stacks tag 053E).” Cite these targets in the Prüfer argument. No second owner of this general graded theorem was located in the pins or roadmap search; the earlier ClassicalAdicEtaleCohomology use of 053E concerns a special integral lattice, not this graded theorem. For R a field, S = R[T], N = S and f = T, the dehomogenizations are B = M = R and both relation modules are zero. For a nondiscrete valuation ring R and N = S/𝔪S, the R-flatness hypothesis fails, correctly excluding the non-finitely-presented module.

9. **F09** (P2) The finite-presentation milestone is absent from Suggested.lean

   **Location:** `packages/LocalFieldsRamificationPartII/README.md:561–572`; `packages/LocalFieldsRamificationPartII/Suggested.lean:19–41`. The general flat finite-type algebra/module finite-presentation milestone is explicitly owned, used by the étale criterion, and neither stated nor listed as unstatable.

   **Witness:** Native `Algebra.FinitePresentation` is in `Mathlib/RingTheory/FinitePresentation.lean:44`; `Module.FinitePresentation` is in `Mathlib/Algebra/Module/FinitePresentation.lean:68`. The Prüfer hypothesis is already expressed at `Mathlib/RingTheory/Flat/TorsionFree.lean:125–128`; no new carrier is necessary.

   **Exact repair:** Add the two general signatures below in a Layer 1 block, with docstrings and README names. They subsume the valuation-ring special cases and retain the module's own flatness hypothesis. These are deep finite-presentation conclusions, not flatness/finite-presentation API padding.

   ```lean
   theorem algebraFinitePresentation_of_flat_of_prufer
       (A B : Type*) [CommRing A] [IsDomain A] [CommRing B] [Algebra A B]
       [Algebra.FiniteType A B] [Module.Flat A B]
       (hA : ∀ (P : Ideal A), [P.IsMaximal] →
         ValuationRing (Localization P.primeCompl)) :
       Algebra.FinitePresentation A B := by
     sorry

   theorem moduleFinitePresentation_of_flat_of_prufer
       (A B M : Type*) [CommRing A] [IsDomain A] [CommRing B] [Algebra A B]
       [Algebra.FiniteType A B] [AddCommGroup M] [Module A M] [Module B M]
       [IsScalarTower A B M] [Module.Finite B M] [Module.Flat A M]
       (hA : ∀ (P : Ideal A), [P.IsMaximal] →
         ValuationRing (Localization P.primeCompl)) :
       Module.FinitePresentation B M := by
     sorry
   ```

   For a field A and B = A[X], M = B, both conclusions hold with zero relations. For a nondiscrete valuation ring A and B = A, M = A/𝔪, the second hypothesis `Module.Flat A M` fails and prevents the false finite-presentation conclusion. For M = 0 it returns a finitely presented zero module. These interface prescriptions have not been elaborated during this read-only pass.

## Verified sound

Read all 1,558 README lines and all 187 Suggested.lean lines, including **14 declarations (7 definitions, 7 theorems)**. There are **42 numbered target sections**; their defining statements, displayed conclusions, API assertions and Checks are covered in the tables below. The README has no separately bold-labelled theorem targets: its bold mathematical material is the conventions, and those are included. There are **144 Checks bullets**, including the defective bullets recorded above; the table records their mathematical content and additional controls. The source ledger below verifies **61 distinct locators** in **8 readable works**; the two settled inaccessible works remain uncertified. **11 cross-roadmap section contracts in 5 suppliers** were checked (SchemeAndStackFoundations §§0.12, 0.13; ClassicalAdicEtaleCohomology §§5.1, 5.3; LocalFieldsRamification Layers 2–4; ProfiniteCohomology Layer 11; ProfiniteProPGroups Layers 2, 5, 6), plus the declared descent contract and the three relevant consumer heads. The supplied old-name mapping preserves the two ProfiniteCohomology names; they are not missing declarations.

No counterexample was found to any of the seven Lean theorem statements as typed. This is a mathematical/read-only signature audit, not a new Lean run. The supplied elaborated signatures were compared with every explicit binder: no standing `variable` blocks exist and no necessary section hypothesis was lost. Totally disconnected topological groups are Hausdorff here: this is not an omitted-separation finding. No theorem is one-tactic padding; the seven real definitions serve the retained theorem statements. The source-level generality of the Abhyankar family is not replaced by a finite-index family or a rank-one valuation.

The changed-file stat is confined to the package: README, Suggested.lean, sources.toml, and two existing repair reports (5 files; 649 insertions, 241 deletions). This pass writes only its report and scratch notes. The acceptance file uses one `import Mathlib` and two existing, used Tau Ceti imports; no sorry'd data, `set_option`, `lemma`, fake `Prop` carrier, algorithm, or process/PR narrative was found in that file or the roadmap prose. Every own Lean declaration name occurs in the README. The source arrangement is not used as the stated build rationale: in particular the two branches above Layer 2 have independent dependency arguments.

Dependency check, verbatim:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The local forward reference §2.1 → §2.3 is specifically to the definition, and §2.3 does not depend on §2.1; it creates no proof cycle. The section theorem's pro-p-kernel case is genuinely stronger than the pin's pro-p-source case. Reading `Projective.lean` and the finite-level lift identifies the needed new step: the image of H ∩ ker(f), rather than all of E/U, is a p-group. R01 concerns ownership, not this splitting argument.

Headline inventory: full tameness (§6.4), separable tameness (§6.5), henselian KPR (§3.6), height-one KPR (§4.4), valued henselization/tensor decomposition (§§1.3–1.4), decompletion (§4.2), composition criteria (§§5.4–5.6), Abhyankar and height (§5.3), characteristic-p cohomological dimension (§3.1), profinite sections (§3.2), the noncomplete Krasner bridge (§4.1), and flat finite-type algebra/module finite presentation (§1.5). The first, second, third, Abhyankar/height and the two profinite theorems are in Lean. The docstring names the unrepresented tower, tensor/decompletion and composition statements and their missing valued-field carriers. R02 identifies a deep bridge whose native conclusion and hypotheses already exist. R09 identifies the statable finite-presentation milestone. R01 removes a duplicate ownership claim, not a boundary-case theorem.

### Declaration and context table

All names below lie in `TauCetiRoadmap.LocalFieldsRamificationPartII`. Universes remain polymorphic: K, L, the value groups, and the two index types may occupy different universes where the signatures permit them. No zero ring can instantiate `Field`; no noncompact group can instantiate the compactness binders of the section theorem.

| Declaration; layer; complete relevant context | Instances and computed values | Result; change |
|---|---|---|
| IsPNumber; 0; P : Set N, n : N | P=∅: n=0 gives false positivity, n=1 gives true and no prime divisors, n=2 gives false; P={2,3}, n=6 gives true; P={3}, n=6 false, n=9 true; P={1}, only n=1 | Correct definition; R05 corrects prose treating nonempty as containing a prime |
| IsPClosed; 0; Field K, finite-dimensional E ≤ Kᵃ, degree P-number | F₂, P={3}: F₈ has degree 3 and E≠bottom, false; algebraically closed K: all finite E=bottom, true; P=∅ or {1}: degree=1, true | Full inseparable quantifier present |
| IsSeparablyPClosed; 0; Field K, preceding finite E plus IsSeparable K E | F₂, P={2}: F₄ degree2 separable, false; F₂(t)ˢ: all finite separable E have degree1, true; adjoining t^(1/2) there has degree2 but fails separability | Distinguishes separable/full closedness |
| IsTameGaloisExtension; 2; Field K, valuation V, L ≤ Kᵃ; finite dimension AND Galois AND every A over V | unramified degree2 over Q₂: inertia order1, gcd(1,2)=1, true; Q₂(i): inertia order2, gcd(2,2)=2, false; Q₃(ζ₃): inertia2, gcd(2,3)=1, true; degree3 nonnormal cubic fails Galois conjunct | Nat.card is finite on the tested finite-Galois groups; no decomposition/inertia confusion |
| IsSeparablyTameField; 2; Field K, V; every finite Galois L | trivial valuation on F₂(t): inertia1 in every finite Galois L, gcd(1,2)=1; Q₂: Q₂(i) gives gcd2; separably closed field: only degree1 Galois L | True, false, true |
| IsTameField; 2; Field K, V; PerfectField K AND preceding predicate | trivial F₂(t): false AND true=false; trivial F₂: true AND true=true; Q₂: true AND false=false | Perfection genuinely necessary |
| galoisTamePart; 2; Field K, V; supremum of tame finite-Galois subfields | separably closed imperfect K: supremum=K, Kᵃ≠K; residual exponent1: supremum=Kᵃ; henselian Q₂: contains unramified quadratic, excludes Q₂(i); nonhenselian S₃ example: degree3 decomposition fixed field is in Kᵗ but not this supremum | Correct henselian restriction of KPR |
| cohomologicalDimensionAt_absoluteGaloisGroup_le_one; 3; prime p, Field F, CharP F p | F₂: 1≤1; F₂ˢ: 0≤1; Q₂: CharP 2 is false, cd₂=2 excluded | True signature; ownership R01 |
| exists_continuous_section_of_isProP_ker; 3; prime p; E,G groups, topological groups, compact, totally disconnected; continuous surjective f, pro-p kernel, cd_p G≤1 | E=G=1: s=1, f(s(1))=1; E=C₃×Z₂→C₃, p=2: kernel Z₂, cd₂ C₃=0, s(g)=(g,0); C₄→C₂ at p=2: every lift of generator has order4, section impossible, cd₂ C₂=∞ excludes it; S₃→C₂ at p=3:kernel C₃,cd₃ C₂=0,s(generator)=(12),f∘s=id | Correct; full pro-p-source library lemma does not cover second instance |
| sup_galoisTamePart_eq_top_of_henselian; 3; Field K, V, HenselianLocalRing V; E linearly disjoint, maximal among such E | trivial F₂: tame part=F₂ᵃ, E=F₂, sup=top; separably closed imperfect K: tame part=K, maximal E=Kᵃ, sup=top; residue0: tame part=Kᵃ, E=K; Q₃(∛2,ζ₃)/Q₃:S₃, wild cubic and tame quadratic give tensor/compositum degrees6/6 | Henselian binder retained; no conclusion hidden in maximality |
| algebraicIndependent_of_valuation_independent; 5; fields K,L, Algebra K L; both ordered groups with zero; vK.HasExtension vL; arbitrary ι,κ; hx integral finite-support monomials, hy residue AI | F₂⊂F₂(t), t-adic x=t, y empty: values n for t^n lie in base value group0 iff n=0; AI(t)=true. Gauss/trivial valuation, x empty,y=t: residue t transcendental, AI(t)=true. Empty both: empty monomial=1, only n=0, empty AI=true. x=0: n=single1 gives value0=v(0), hx fails | All instances match; zero and negative-exponent junk cannot satisfy hx |
| ringKrullDim_le_ringKrullDim_comap_add; 5; fields K,L, Algebra K L; W, natural n, cardinal trdeg K L=n | identity DVR:1≤1+0; field/trivial:0≤0+0; F₂(t)/F₂ t-adic:1≤0+1; Q(t)/Q composite:2≤1+1; infinite base height:∞≤∞+n=∞ | No Nat subtraction or zero-ring dimension issue |
| isTameField_of_isPClosed; 6; Field K,V; primes equal to residue exponent | algebraically closed char2: h=true, perfect=true, inertia1, result=true; trivial Q, p=1: support=∅, h=true, result=true; Q₂: X²−2 degree2, h=false, tame=false | Matches arbitrary-height source |
| isSeparablyTameField_of_isSeparablyPClosed; 6; arbitrary P⊆N, Field K,V, separable P-closedness and p∈P | F₂(t)ˢ, P={2}: hypothesis true, inertia1, conclusion true but perfection false; Q₂,P=∅: closedness true, 2∈∅ false; P={1}, trivial Q: 1∈P true, inertia1 and conclusion true | Arbitrary natural sets intentional; no perfection conclusion |

### README statements, conventions and Checks: computed ledger

The instances in a row test the assertions named in its first column, including both sides of its equivalences. “Unchanged” means no mathematical counterexample in those instances, not a proof by testing. TU below means unramified; PW means purely wild; extension degrees are ordinary finite degrees unless indicated otherwise.

| Statement / locator | Instances tried and computed values on both sides | Result; change |
|---|---|---|
| Conventions: valuation subring, equivalence, value sign (96–103) | Q₂: multiplicative norm(2)=1/2≤1, additive v(2)=1≥0; norm(1/2)=2>1, v(1/2)=−1<0. Square the norm: same subring Z₂, values 1/4 and4 | Sign and subring equivalence agree; unchanged |
| Conventions: exponent (104–107) | κ=F₂,F₃,Q gives p=2,3,1; p=1 gives support∅, gcd(m,1)=1 even m=0, P-numbers only1 | No Sylow at1; unchanged |
| Conventions: fixed closures and henselian (108–114) | trivial F₂(t): Kh=K, Ks≠Ka since t^(1/2)∉Ks; Q at7 has two prolongations to Q(√2), but identity Q/Q has one | Ambient Ks and relative henselianity distinguished |
| Conventions: height (115–118) | field Spec={0}, height0; Z₂ Spec={0,m}, height1; composite Q₂((t)) has 3 primes, height2; value group Q of an algebraic closure rank1 but nondiscrete | Definitions agree; exhibiting two primes without proving exhaustiveness would not alone bound height |
| Conventions: splitting/maximality (119–121) | biquadratic Q(√2,√3): tensor/compositum degrees4/4; two S₃ cubics:9/6, intersection degree1 | Linear disjointness indispensable |
| Conventions: tame/total, Frobenius (122–128) | F₂(u^(1/2))((t))/F₂(u)((t)): e1,f2, total=true, tame=false; Q₂ unramified cubic: Frob exponent2 on F₈ versus inverse exponent4 | Purely inseparable residue allowed for total; arithmetic direction fixed |
| §0.1 definition | ∅ at0,1,2 → false,true,false; {2,3} at6 → true; {3} at6,9 → false,true | Three supplied Checks discriminate positivity/support |
| §0.1 multiplicativity | a=2,b=3,P={2,3}:6,true and true; P={3}:6 false, first factor false; a=0 is excluded | iff agrees |
| §0.1 monotonicity, singleton and ignoring nonprimes | {3}⊆{2,3}:9 accepted by both; {3}-number 27=3³, 1=3⁰; {1,3,9} and {3} accept the same9 and reject6 | Unchanged |
| §0.2 definition and finite-degree characterization | Q(cuberoot2): degree3, subdegrees1,3; normal closure degree6. {3}: first true, closure false | Galois-closure shortcut excluded |
| §0.2 tower and subextension laws | S₃ splitting field over a cubic over Q: successive degrees2,3, total6. P={3}: total=false, conjunction=false; P={2,3}: true,true | Both directions agree |
| §0.2 directed unions/isomorphisms | union F_(2^(3^r)): finite stages degrees3^r; all supported on3; Frobenius conjugate stage has same degree. Two nonnested S₃ cubics have compositum degree6 | Directedness cannot be replaced by arbitrary compositum |
| §0.3 definitions and closure independence | F₂→F₈ degree3 persists in any algebraic closure; separable closure of F₂(t) has no finite separable degrees>1 but t^(1/2) degree2 | Both predicates differ as asserted |
| §0.3 subset implication and characteristic zero | P=∅,Q={2},K=Q: Q-closed false but P-closed true; over Q every finite extension is separable, so both {2}-closed predicates false | Direction correct |
| §0.3 perfection comparison | K=F₂(t)ˢ: separably {2}-closed=true, perfection algebraically closed so {2}-closed=true; F₂(t): AS degree2 survives perfection so both false | No loss of separable degree |
| §0.4 maximal extensions | P=∅: maximum K, degree1; all primes: maximum Ka; maximal {3}-extension containing cuberoot2 cannot contain its degree6 normal closure | Maximal need not normal |
| §0.4 perfection and separable variant | K=F₂(t): X²−t gives degree2, not {2}-closed; K=F₂(t)ˢ: separably closed but missing t^(1/2) | Perfection applies to full closedness only |
| §0.5 splitting definition and multiplication iff | M/M/K with E=K: tensor dimension over M=1; biquadratic example: source,target dimensions4,4, kernel0; S₃ cubics:9,6, kernel dimension3 | Prescribed maps and injectivity essential |
| §0.5 transport | √2↦−√2, √3↦√3 on biquadratic field: product ab maps to σ(a)σ(b), source and target still dimension4 | Transport correct |
| §1.1 normalization/bijection | trivial V=K: B=L, max ideals1, prolongations1. Q(√2) at7: two F₇ residues, total residue dimension2≤degree2; at3: one F₉ residue, dimension2≤2 | Semilocal, not necessarily local |
| §1.1 Prüfer localizations | A=Z[√2]_(7), x=(3−√2)/(3+√2): prime values(+1,−1), inverse(−1,+1); neither lies in A; each prime localization contains one | Prime hypothesis correct; arbitrary localization excluded |
| §1.1 no finite-module promise | K=C((t^Γ)), Γ=Z[1/3], L=K(√t):degree2,e2. Values in 1/2+Γ have infimum0 among positive values but no minimum; finitely many integral generators have a positive minimum in that coset | Finite extension does not give a finite integral-closure module |
| §1.2 étale local rings/henselizations | A=field: Ah=A, Ash=Aˢ, Γ=0 throughout; Z_(p): Ah algebraic elements in Z_p, Γ=Z, countable≠uncountable Z_p; adjoining √p changes embedded Γ from Z to (1/2)Z | Étale hypothesis separates e1 from e2 |
| §1.3 valued henselization and universal map | trivial K: Kh=K, maps unique; complete rank1 K=Q₂: Kh=K, e=f=1; K=Q at2: Kh countable dense in Q₂, e=f=1, not complete | Neither completeness nor a new ring henselization assumed |
| §1.3 functoriality and uniqueness iff | identity sends each element to itself, composites agree on V then on Frac(Vh); Q(√2)/Q at7 has two prolongations, Q not henselian; henselian Q₂ every finite L has one | Both directions consistent |
| §1.4 tensor decomposition | Q(√2) at7: tensor Kh×Kh, total dimension2, 2 factors; henselian base: one factor L; F₂(t^(1/2))/F₂(t): degree2 inseparable, one factor Lh, no nilpotent factor | Counting distinct valuations, not isomorphism classes, correct |
| §1.5 flat finite-type algebra (R08–R09) | field A: finite-type algebra finitely presented; valuation A with non-fg m: B=A/m cyclic finite type, not flat, not fp; A[x]/(ax), 0≠a nonunit: fp=true, flat=false | No false converse |
| §1.5 module theorem | B=A, M=A/m: B flat, M torsion and non-fp; M=B=A: rank1 free and fp; M=0: rank0, flat and fp | Flatness attached to M, not B |
| §1.5 Prüfer extension/locality | A=Z: localizations DVR, finite-type flat B is fp. Boolean product A=∏F₂, I=⊕F₂: I not fg, B=A/I flat non-fp, every B_m=0 orF₂ fp; A not domain | Boolean counterexample correctly outside Prüfer domain |
| §2.1 étale criterion and strict variant | identity V→V etale=true; Q₂(√2): e2, TU=false, essentially etale=false; F₂((t)) identity residueF₂ not sepclosed, strict TU=true | Strict means residue equality |
| §2.1 finite height | Z_(7), split quadratic local ring is obtained from finite etale algebra by one denominator; finite prime set allows selection; no claim of actual etaleness for arbitrary infinite-height localization | Finite-height qualifier retained |
| §2.2 fields/subgroups/fixed fields | henselian K: D=G, Fix(D)=K=Kh. Trivial F₂(t): D=G,I=W=1, Fix_Ks(1)=Ks, Fix_Ka(1)=Ka≠Ks | Fixed-field ambient correct |
| §2.2 tame quotient/conjugation | strictly henselian DVR: Γ=Z, tame quotient ∏_(ℓ≠p)Z_ℓ(1); p1: W=1,Kt=Ks; S₃ example: D of order2 has three conjugates | No quotient by nonnormal D or W asserted |
| §2.3 definitions and residue classification | F_(2^r)((t))/F₂((t)): degree r,e1,f=r, TU=true, strict iff r=1; Q_p(p^(1/ℓ)):eℓ>1,TU=false; Kh/K:e=f1,strict=true | All four Checks and both iff statements agree |
| §2.4 tame/degree criterion | Q₃(3^(1/2)):degree2,e2,f1,tame=true; Q₃(3^(1/3)):degree3,e3,false; immediate AS defect:degreep,e=f1, ef1≠p,false | Defect condition essential |
| §2.4 base change and henselization | base-changing tame radical by itself gives identity degree1 (not originalℓ), still tame; Q(√2) at7 henselizes to identity degree1 while original degree2 | Degree not claimed invariant |
| §2.4 finite Galois predicate and supremum | Q₂ unramified quadratic:I1,D2,gcd(1,2)=1; Q₂(i):I2,gcd2; Q₃(ζ₃):I2,gcd1; p1:every finite Galois field included, supremumKs | Correct comparisons |
| §2.4 nonhenselian contrast | X³−X−2: discriminant−104, v₂=3; cubic root mod2 lifts, remaining ramified quadratic gives D=I=W=C₂ in S₃. Cubic Fix(D)⊂Kh; its normal closure has wild inertia2 | galoisTamePart excludes this cubic while Kt contains it |
| §2.5 henselian extension/disjointness iff | Q/Q identity unique but base not henselian; Q(√2)/Q at7:2 prolongations,tensor2 factors,not disjoint; purely inseparable degree2 versus separable Kh:tensor field of degree2 | Absolute and relative henselianity distinguished |
| §2.6 total/PW criteria | F₂(u^(1/2))((t)):e1,f2 inseparable,total=true,PW=true; AS a²−a=t⁻¹:v(a)=−1/2,e2,degree2,PW=true; Q₃√3:e2,PW=false; nontrivial unramified quadratic:f2 separable,total=false | e=f1 shortcut rejected; residue0 PW degree1 only |
| §2.7 field predicates/equivalences | trivial F₂(t):separably tame=true,tame=false; algebraically closed:both true; Q₂:Q₂(i) gives inertia2, both false except perfection=true; residue0:inertia orders coprime to1 and K perfect | No henselian hypothesis smuggled into definition |
| §2.7 algebraic permanence | trivially valued F₂ and F₄: both perfect, both tame; K algebraically closed has only identity algebraic extension; algebraic extension of a residue0 field again has residue0 | Consistent with tower law |
| §2.8 six tower iff laws | identity tower gives six true values; Q₃⊂unramified quadratic M⊂M(√3): total L/K not TU (e2), TU conjunction false; tame conjunction true and total tame true | Nontrivial iff values agree |
| §2.8 compositum/union identities | Q(√2) at7 embeds via ±s into respective Kh, so LKh=Kh=Lh each time; union finite tame radicals has all finite stages in Kt; Q(√2)⊗Q₇=Q₇×Q₇ | Chosen prolongation and filteredness matter |
| §2.9 comparison/Frobenius | Q₂(2^(1/3)):e3,gcd(3,2)=1, tame both; Q₂ unramified degree3 generated by ζ₇:Frob ζ₇↦ζ₇², inverse ζ₇↦ζ₇⁴; defect example:e1 yet wild outside local-field setting | Positive exponent2 fixes sign convention |
| §2.10 perfection | F₂(t):Γ=Z→Z[1/2], residueF₂→F₂; cube-root tame degree3 remains3; AS degree2 becomes immediate defect over perfect hull but remains degree2 and wild | Tame equivalence is not “perfection kills wildness” |
| §3.1 characteristic-p cd | F₂:cd₂=1; separably closed char2:0; Q₂:cd₂=2 with false CharP2 | Statement sound; R01 ownership |
| §3.2 section theorem | Z₂ quotient:cd₂1; C₄→C₂:cd₂∞, generator cannot lift with order2; trivial kernel:continuous inverse; Zhat→∏_(ℓ≠2)Z_ℓ:kernelZ₂,cd₂0,section g↦(0,g) | No finite generation necessary |
| §3.3 maximal admissible extensions | S=∅:Ka; S={tame}:Kt; maximal PW Q₃-extension excludes √3 since degree2; conjugate complements may differ, no canonical choice | Zorn property compatible with nonnormality |
| §3.4 two complements | trivial valuation:Khu=Ks,Krt=K, tensor targetsKs; Q₃:unramified part Khu, compatible 3^(1/n),3∤n, give value group Z localized away from3 for Krt | Third Check replaced by R07 numerical tensor test |
| §3.5 field equivalences and group qualification | tame K:W1,Kw=K,Kt=Ka, four field clauses all true; residue0:Kw=K; Q at2/S₃:W image order2 nonnormal, quotient S₃/C₂ not a group, but C₂·C₃=S₃ and intersection1 | Correct nonnormal factorization form |
| §3.6 KPR and profinite route | Q₂ residueG_F₂=Zhat, SylowZ₂, cd₂1; I/W has pro-odd order, Sylow maps bijectively. Separably closed imperfect K:Kt=K,E=Ka; residue0:Kt=Ka,E=K | Tensor conclusion uses actual disjointness, not intersection |
| §4.1 norm/completion/Krasner | Q with p-adic norm embeds densely in Kh⊂Q_p; Kh countable,Q_p uncountable; henselian base unique prolongation, complete base Q_p covered by pinned theorem | Missing noncomplete acceptance signature R02 |
| §4.1 root thresholds and uniqueness | f=g=(X−1)(X+1) at2:kras1,threshold∞; atε1 values∞,1 give2 roots; atε2 only1 root. f=X,g=X−2:threshold1,distance1 exactly | Non-strict distance bound and strict uniqueness threshold correct |
| §4.1 negative-root normalization/degree zero | f=X²−1/16,g=f+2X:γ*=−2,coefficient value1,n2,threshold−3/2; root differences have valuations0 or−1, not≥1/2. f=g=1:n0,empty roots,no division | γ* term necessary; no 0/0 |
| §4.2 decompletion | L=Kh:E=K,degree1=1; Q at2,L=Kh√2:E=Q√2,degree2=2,unique prolongation; henselian K:E=L | Separability explicitly assumed; infinite descent uses compatible Zorn pairs |
| §4.3 maximal separable wildness iff | Q(t), t-adic,p1,E=Kh: RHS maximality true but henselian-extension clause false (√(1+t) gives2 prolongations), LHS false. Q(√2)/Q at7:Eʰ/Kh identity not maximal because X⁷−7 gives degree7 PW | Corrected negative-control example discriminates |
| §4.3 pure-wild reflection | Q at3,E=Q√3:unique prolongation,e2,not PW before/after henselization; Q(√2) at7:not PW before, identity after PW | Henselian extension qualifier necessary |
| §4.4 height-one splitting | residue0:Kt=Ks=Ka,Kw=K,tensorKa; imperfect char2:Kw contains all iterated square roots, so perfection⊂Kw; Q atp:Kw⊗Kh is field, dimensions preserved on finite subextensions | Unchanged |
| §4.5 height-one tameness | residue0 closedness support∅,tame=true; Q₂:X²−2 degree2,closedness=false; C₂:algebraically closed,height1,all degrees1,tame=true | Three Checks agree |
| §5.1 composition definition | Q₂((t)):v(t)=(1,0),v(2)=(0,1); 1/2 has coarse value0 but fine(0,−1), so in coarse ring and not composite; trivial residual valuation recovers original ring | Wrong coarse-only model excluded |
| §5.1 exact sequence/recovery/associativity | 0→Z→Z²lex→Z→0 with a↦(0,a),(b,a)↦b; kernel={(0,a)} convex; triple Laurent field values Z³lex under either bracketing | Directions, residue field and association agree |
| §5.2 finite chain/coarsening/exponents | Q₂((t)),d2: heights0,1,2; residual heights2,1,0; exponents1,1,2. F₂((t))((u)):exponents2,2,2. Trivial valuation:d0,one prime | d−i endpoints explicit; the two-prime Check is read as warning that exhaustiveness must be proved |
| §5.3 elementwise AI and numerical inequality | F₂(t)/F₂,t-adic:rr1,residue trdeg0,total trdeg1,1+0≤1; Gauss over trivial F₂:rr0,residue trdeg1,0+1≤1; x=0 gives n=1 value0 in base range, violates hx | Zero excluded by formula, not presumed |
| §5.3 height bound/algebraic invariance | Q(t) composite:2≤1+1 equality; algebraic extension of Q₂:height1=1+0; trivial algebraic extension:0=0; nontrivial height2 on Q(t) cannot have restriction height0 since2≤0+1 false | Correct prime-field contribution |
| §5.4 composition iff | Q₂((t)) with constant unramified quadratic:coarse e1,coarse residue degree2,residual e1,f2,all TU. s²=t:coarse e2,TU false. F₄((t))/F₂((t)) endpoints:both steps degree2,TU true | No automatic identity endpoint |
| §5.4 inseparable endpoint | F₂(u^(1/2))((t))/F₂(u)((t)),i=d:coarse residue inseparable degree2 and residual trivial-valued inseparable degree2,both non-TU; LHS non-TU | Two directions and inseparability distinguished |
| §5.5 tame composition iff | Q₂((s))/Q₂((t)),s²=t:coarse tame=true,residual identity tame=true,Γquotient C₂ has2-torsion=true,whole tame=false. Equal char2 coarse tame quotients have odd order; p1:torsion condition empty | Final residue prime, not coarse prime, used |
| §5.6 tame-field composition | Q₂((t)):coarse tame=true,residual Q₂ tame=false,ΓcoarseZ not2-divisible,whole false; algebraically closed:all true,groups divisible; F₂((t))((u)):coarse already not tame | Both residual and divisibility requirements retained |
| §6.1 p-roots/divisibility/residue closedness | algebraic closure of Q₂:Γ=Q,2Γ=Γ,residue F₂alg,finite residue extensions degree1; trivial coarsening has residueK; Q₂:v(2)=1∉2Z,root missing,not2-closed | Prime-root obstruction computed; mixed-characteristic intermediate residue uses final2 |
| §6.2 induction | algebraically closed trivial char2:height0,tame=true; C₂:height1,all degrees1; composite Q₂((t)):height2,Γ=Z²,2Γ≠Γ and degree2 root of2 violates hypothesis | No height2 inference from coarse residue characteristic0; R07 gives actual height1 Check |
| §6.3 finite-height descent | K=Qbar at2,L=K:K₀=K,trdeg0,height1,degree1 tensor1. K=Q(t) trivial,p1,L=K√t:K₀=Q(t),degree2; constants alone cannot descend it. K₀=Q,K=Q(t),E=Q√2:degree2 remains2 | Finite generation not promised; R04 corrects supplier and R05 corrects coefficient Check |
| §6.4 full theorem/P-form | algebraically closed valued field:finite degrees1,all inertia1; trivial Q or C((t)):residue0,p1,h=true,tame=true; Q₂ degree2 Eisenstein and F₂((t)) degree2 AS both violate h | No good-prime restriction; arbitrary P reduces to member prime |
| §6.5 separable export | F₂(t)ˢ:finite separable degree1,full extension t^(1/2) degree2 wild; P=∅:p∈P false even though separable closedness true; F_(2^r)((t)):AS degree2 shows hypothesis false | Does not assert full tameness or tameness outside P |

### Source-locator ledger

Counts below treat a theorem, numbered paragraph, remark or tag as one locator; repeated uses and parts of the same theorem do not add to the count. These are text comparisons, not independent certifications of entire papers. The source issues below are already corrected in the package's mathematical statements.

| Work; count | Locators read against cached text | Comparison |
|---|---|---|
| temkin17; 35 | §2.1.1: lines 249–271; §2.1.2: 272–274; §§2.2.2–2.2.7: 286–310; §2.3.1: 316–317; Lemma 2.3.2: 318–327; Lemma 2.3.4: 330–336; §2.3.5 and Remark 2.3.6: 337–343; §2.3.7: 344–352; Lemma 2.3.8: 353–383; §§2.3.9–2.3.12: 384–401; Lemma 2.4.2: 409–422; Lemma 2.4.4: 430–449; §2.4.6: 456–477; Remark 2.4.7: 478–483; Theorem 2.4.9: 487–488; §2.5.1: 502–504; Lemma 2.5.2: 505–524; Corollary 2.5.3: 527–535; Theorem 2.5.5: 538–546; Corollary 2.5.6: 547–550; §2.6.1: 555–564; §2.6.2: 567–573; Lemma 2.6.3: 574–611; Corollary 2.6.4: 612–620; Theorem 2.6.6: 623–638; Lemma 3.2.5: 796 | Printed pp. 103–112 and 116 agree. Separability, the chosen prolongation, final residue exponent, finite height and the henselian restriction on the group quotient are retained or explicitly repaired relative to the source. The arbitrary-natural-set formulation of P requires R05's nonempty-set correction. |
| kpr86; 3 | Theorems 2.1 and 2.2: lines 154–170; Corollary 2.5 and the proof of 2.2: 221–241; standing henselian hypothesis: 114–127 | Printed pp. 42–44 agree. The complement statement and proof use the henselian setting; the package does not export a nonhenselian semidirect quotient from them. OCR affects typography, not the identifiable theorem numbers and hypotheses. |
| temkin10; 1 | Proposition 2.2.2: lines 520–550 | Author pp. 11–12 agree; the composition-of-unramifiedness result includes the residual valuation step. These are explicitly author-copy page numbers, not published pagination. |
| kkv16; 2 | Lemma 2.1: lines 238–281; inequality (12): 356–362 | Author pp. 6–8 agree; the elementwise value-independent and residue-transcendental families imply algebraic independence. The valuation formula prevents cancellation, and the finite-transcendence-degree inequality follows. |
| cks23; 3 | Theorem 14: lines 610–614; Example 15: 619–625; Theorem 16 and proof: 640–730 | Author pp. 12–15 agree. The non-strict distance conclusion, strict uniqueness threshold, degree-zero exclusion and negative-root normalization agree with the corrected proof. The example with two roots at the boundary confirms uniqueness cannot use a non-strict threshold. |
| aid25; 5 | Proposition 3.3: lines 210–216; Proposition 3.6: 306–313; Theorem 3.7: 366–379; Proposition 4.1: 391–409; Theorem 4.4: 515–535 | arXiv v1 pp. 5–13 agree. The first correspondence applies to algebraic extensions; finiteness of the residue-product and semilocality use finite field degree. No finite-module normalization is asserted. |
| stacks-more-algebra; 8 | 0A04: lines 1668–1679; 0F0L: 1680–1688; 0537: 2382–2385; 053D: 2879–2894; 05GS: 2895–2902; 053E: 2906–2919; 0ASJ: 17762–17791; 0ASK: 17792–17806 | Henselization commutation/radical invariance; torsion quotient; graded and valuation-ring finite presentation; valuation rings under étale maps and henselization. The base-domain hypothesis in the proposed Prüfer argument meets 05GS(3). R08 concerns ownership of 053D and the homogenization step, not the validity of the cited source. |
| ega4; 4 | Lemma 17.7.5(iv): lines 2750–2787; Proposition 17.7.7: 2795–2812; Proposition 18.6.8: 5517–5531; Proposition 18.6.14: 5616–5646 | Printed pp. 73–75, 139 and 141–142 agree. The source-side descent hypotheses match the declared gap; integral base change and filtered-colimit henselization support the indicated uses. R03 separates two obligations without rejecting their mathematics. |

### Ownership and pin comparisons

The object searches covered normalization/prolongations, henselization, coarsenings, wild inertia, prime-supported extensions, Abhyankar/height, characteristic-p cohomological dimension, profinite section/lifting and graded finite presentation in main, the board packages and the indexed open heads. The seven theorem names returned no duplicate in the open/main Lean search; namespace uniqueness alone does not settle mathematical ownership, hence R01. Nearby arithmetic consumers ask for the general valued-field results; the completed LocalFieldsRamification roadmap owns the finite local-field comparison, and ClassicalAdicEtaleCohomology owns the strict-henselian/tame-character inputs. R06 resolves the consumers' identifiers without making them suppliers.

Selected pin witnesses that rule out apparent duplication or missing-hypothesis findings:

| Pinned declaration | Actual content and effect on this review |
|---|---|
| `IsGalois.normalBasis`, `Mathlib/FieldTheory/Galois/NormalBasis.lean:121`, and `normalBasis_apply:128` | Fields, algebra, finite dimensionality and Galois hypothesis are retained. Supplies the normal-basis ingredient of additive acyclicity, not the characteristic-p continuous cohomology theorem itself. |
| `IsKrasner.of_completeSpace_of_normal`, `Mathlib/Analysis/Normed/Field/Krasner.lean:73` | Requires completeness of the nontrivially normed ultrametric base; it does not subsume §4.1's henselian noncomplete theorem (R02). |
| `IntermediateField.LinearDisjoint.isField_of_isAlgebraic`, `Mathlib/FieldTheory/LinearDisjoint.lean:716` | Requires linear disjointness and at least one algebraic factor. It proves the tensor product is a field, not that two maximal complements generate the entire algebraic closure. |
| `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`, `TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean:138` | Relatively algebraically closed base and separable extension, with the scalar towers of its section; exactly the regular-base-change ingredient absent from the displayed Needs line (R04). |
| `TauCeti.exists_isProPSylow`, `TauCeti/Topology/Algebra/Group/Profinite/Sylow/Existence.lean:102`; `IsProPSylow.exists_map_conj_eq`, `TauCeti/Topology/Algebra/Group/Profinite/Sylow/Conjugacy.lean:42`; `IsProPSylow.eq_of_normal:48` | Compact topological groups, total disconnectedness and primality enter the theorems. `IsProPSylow` itself includes closedness, the pro-p condition and prime-to-p finite-quotient indices; no false finite-generation requirement. |
| `TauCeti.IsProPSylow.map_of_surjective`, `TauCeti/Topology/Algebra/Group/Profinite/Sylow/Functoriality.lean:52`; `IsProPSylow.cohomologicalDimensionAt_eq`, `TauCeti/Topology/Algebra/Group/Profinite/Sylow/CohomologicalDimension.lean:95` | Image theorem uses compact source and Hausdorff target; dimension equality uses the profinite context. These do not construct wild inertia: that arithmetic identification is separately owned by the cited supplier. |
| `TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions`, `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Projective.lean:150`; `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`, `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Lift.lean:35` | The compatibility theorem assumes pro-p source; the assembly theorem takes an actual compatible family. Neither supplies §3.2's pro-p-kernel compatibility by a one-lemma application. |
| `Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`, `Mathlib/RingTheory/Flat/TorsionFree.lean:125` | Domain plus valuation localizations at maximal ideals; concludes flatness iff torsion-free. Does not conclude finite presentation. `Module.Flat.projective_of_finitePresentation`, `Mathlib/RingTheory/Flat/EquationalCriterion.lean:287`, assumes finite presentation rather than proving the missing theorem (R08–R09). |

## Not verifiable

- `serre-cg`, I §3.4 Proposition 16 and II §2.2 Proposition 3/Corollary 1: settled uncertified/paywalled. No text was requested again. `kpr86` lines 221–241 corroborate their use, but do not certify the whole Serre statements or edition pagination.
- `rg71`, Corollaire 3.4.7: settled uncertified/paywalled. The broad theorem over arbitrary domains was not independently certified from that work. The package's required Prüfer case was compared with the readable Stacks argument, with its missing ownership recorded in R08.
- No Lean build or fresh `#check` elaboration was run, as required by the read-only restriction. The worker-supplied elaborated signatures cover all 14 existing declarations and were inspected; proposed repair signatures need the repair worker's elaboration. This report does not claim they were compiled.
- Source proofs beyond the cited passages, and open work outside the supplied/indexed heads, are not independently verified. Object searches and the cited sibling passages were checked; an absence search is not a proof that no differently formulated theorem exists anywhere.
- The declared source-side descent contract is not implemented by this package. Its missing implementation is accepted as a supplier contract, not reported as a defect. Only its compound form is R03. No newly inaccessible source was found, and no reference request was added.

## Source issues

- **Error** in temkin17 at §2.4.6(4), printed p. 108: the source says arbitrary valued fields have a quotient tame Galois group and a semidirect splitting; it should be restricted to henselian fields, or replaced by a subgroup-complement factorization without a normality assertion; affects a stated result.
- **Error** in temkin17 at Lemma 2.3.2, printed p. 104: the source says tensor factors are indexed by isomorphism classes of valued extensions with underlying field l; it should be indexed by distinct prolongations on the fixed field l, including conjugate prolongations; affects a stated result.
- **Misprint** in temkin17 at Lemma 2.3.4, printed p. 105: the source says every localization of the integrally closed algebra is a valuation ring; it should be every localization at a prime ideal; affects a stated result.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112: the source says the final residue prime equals the characteristic of the coarse residue field; it should be the final residue characteristic of that field with its residual valuation; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112: the source says the height-one case is Corollary 2.5.6(ii); it should be Corollary 2.5.6, which has no numbered part; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), author p. 14: the source says the chosen root difference has valuation strictly greater than the threshold; it should be greater than or equal to the threshold, as the theorem and contradiction prove; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a6b9eb258b07d8a3defc8b1b9eedf986b1ad4439", "job": "RT-LocalFieldsRamificationPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
