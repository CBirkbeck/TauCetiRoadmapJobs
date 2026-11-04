<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1658#issuecomment-6399012105 -->
Review (codex) of 43e3e43

Verdict: needs_changes

1. **F01** (P1) Five original gap records still have no supplier

   **Location:** `packages/SheafTheoreticSmithTheory/design/plan.json:4028`, also lines 4047, 4072, 4085 and 4093; `packages/SheafTheoreticSmithTheory/README.md:34`. The original records have `id`, `title`, `detail`, `neededBy`, but no `supplier` or `section`.

   **Claim:** The package has reconciled the outstanding obligations with its ownership and exact supplier contracts.

   **Witness:** G1–G5 remain top-level gaps without suppliers; the README's only gap slugs are `witt-adic-uniform-operations`, `grassmannian-arbitrary-geometric-field`, and `finite-highest-weight-ideals`. None matches an original G1–G5 identifier.

   This is a ledger/ownership defect under the explicit rule that a gap with supplier `none` is P1. It is not a claim that the README ignores the mathematics: it now assigns much of G1–G5 to genuine local targets. In particular, §1.1 owns the constructible-to-ind quotient comparison, §§3.1/4.4/4.7/5.7 own much of G2, §4.5 owns the exotic/Soergel engine, §7.6 owns G4, and §§6.8/7.4 own G5.

   **Exact repair:** Reconcile those five intake records with these explicit owners. Record G3, G4 and G5 as local obligations discharged by the named targets, and split G1/G2 into those local obligations and the precisely named external contracts already stated. Residual external gaps must have a named earlier supplier, section and the same slug in the plan and README. Since the accepted plan is otherwise frozen, send the correction of its original gap classifications through the design/intake owner; do not silently rewrite other design fields or invent a self-supplier edge. Recheck that the five original obligations each have exactly one owner and that no residual gap is reported with supplier `none`. The three newly declared contracts do not by themselves update five differently identified records.

2. **F02** (P1) General admissible quotients are attributed to a narrower supplier

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:69`, “invariant affine quotients and their gluing under admissibility”; §0.2 at lines 134–148.

   **Claim:** SchemeAndStackFoundations §§1.17, 1.21 and 1.23 provide general admissible-action scheme quotients and the free-action finite étale torsor criterion used here.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2644` excludes general torsor constructions; its theorem at line 2657 assumes Y→S projective over Noetherian S. The pinned affine quotient module explicitly asserts neither flatness nor finite presentation.

   The main-branch §1.17 contains quotient predicates and projective gluing. Section 1.21 supplies quotient stacks, not the claimed general quotient scheme; §1.23's affine/coarse statements do not supply this general gluing/torsor theorem. Native `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66` and `:73` prove finiteness of affine invariant quotients, with finite-type hypotheses, but not the missing torsor criterion.

   **Exact repair:** Keep the general admissible, separated, locally finite type scope. Import the native affine invariant results and declare a precise named supplier gap with SchemeAndStackFoundations for gluing those quotients under invariant affine neighbourhoods, including the finite étale torsor conclusion on the free locus. Put the identical slug and hypotheses in the plan's gaps and README contracts, then cite that contract in §0.2. Do not narrow to projective schemes. Test the repaired contract on x↦ζx on A¹: the free complement G_m maps by x↦xᵖ, a finite étale map of rank p; for p=3 its derivative is 3x², a unit. G_m→Spec F is not projective. On the trivial action the free complement is empty. Access to the indexed SchemeAndStackFoundationsPartII board head failed, so I make no claim that no alternative owner exists there.

3. **F03** (P2) The coefficient datum excludes the promised prime 2 theory

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:107`, “A coefficient datum consists of an odd prime p”; compare lines 22, 976 and 1451.

   **Claim:** The datum underlying Layers 0–2 covers the all-prime Smith theory promised in Conventions, while oddness is imposed only where normalization requires it.

   **Witness:** For p=2, k[C₂]=k[u]/u² and N=u. Tate pairs for trivial k, trivial O and regular k[C₂] are respectively (k,k), (k,0), (0,0). The datum excludes all three.

   **Exact repair:** Change §0.1 to a prime p without oddness. State oddness explicitly on the normalized cyclic parity/Satake statements and their routes, including §§5.3–5.4 and 6.4; keep goodness at the parity-perversity/comparison boundary. Add the p=2 computation above to §0.1. Retain §5.1's countercheck: a dimension-one stratum has source/fixed dimensions 2 and 1, so dimension pariversities disagree. This keeps the general Smith library while accurately limiting that normalization. Lean already admits p=2 and needs no narrowing.

4. **F04** (P2) Integral tilting classification exceeds the cited field theorem

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:637` and `:643`; the definition uses `Tilt_Λ` for finite free rational representations, and the API asserts the unique indecomposable T(λ). The conventions allow Λ=O.

   **Claim:** The stated classification and closure API, including its O version, follows from JMW16 Theorem 1.1 and the LP3.0/finite-highest-weight-ideals input by defining the intersection of two filtration predicates.

   **Witness:** JMW16 lines 12–27 is over a field of characteristic p; Feng24 lines 993–996 uses Rep_k. `TauCetiRoadmap/LanglandsParameterStacks/README.md:730` and the declared finite-ideal contract are field statements, not integral lifting theorems.

   The definition of integral tilting is meaningful; the cited field classification does not establish its integral existence, uniqueness, direct-summand closure and reduction behavior. The proof route only defines a full subcategory. These inputs are also used when §4.6 invokes product tilting classification over O.

   **Exact repair:** Retain O=W(k). Explicitly supply the integral tilting-lifting theorem before using this API: for the finite saturated highest-weight ideal categories over this complete DVR, reduction gives free Hom base change and lifts the indecomposable tiltings/classification over k, with the requisite integral standard/costandard Ext and idempotent-lifting hypotheses. Give a legal integral locator and an actual lifting route, or add this precise extension as a named LanglandsParameterStacks supplier contract with a matching plan gap. Keep the field theorem cited for the field part. Do not derive this prerequisite from §4.5, which already consumes §3.3. Boundary tests: for the trivial group, End_O(O)=O and its reduction is k; for SL₂ at p=3, the lift of T(3) has rank 6 and reduces to the 6-dimensional tilting, while Δ(3) has rank 4 and is not a substitute. This is a source/input scope finding, not a counterexample to the expected integral theorem.

5. **F05** (P3) The cited periodicity API does not use the specified generator

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:49`, “provide the all-degree module comparisons with the specified generator”; also §1.2's Needs at line 298.

   **Claim:** `Rep.FiniteCyclicGroup.periodicIso` preserves the selected σ convention used for the sheaf periodicity class and the constant-term square.

   **Witness:** `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:346` chooses a generator using `hgen.choose`. The explicit-generator declaration is `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` at line 302.

   **Exact repair:** Cite and use `periodicIsoOfGenerator` with g=σ and its generating proof; retain `tateCohomologyIsoEven`/`Odd` with the same g. Use its compatibility identities at lines 322 and 332 to specify the comparison. Test generator inversion for C₃: it multiplies the normalized class in H²(C₃;F₃) by 2, while Tate group dimensions remain unchanged. Thus the existing dimension Checks cannot establish that an arbitrary-generator isomorphism is the chosen one. This corrects a supplier citation, not the two-periodicity theorem.

6. **F06** (P3) F₉ does not test the direction of Frobenius linearization

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:1075` and `:1079`, and §8.3 at lines 1508–1512. “Fr(α)=−α, Fr⁻¹(α)=−α.”

   **Claim:** These scalar Checks discriminate the source inverse-Frobenius convention from source Frobenius.

   **Witness:** In F₉, Fr²=id; both D∘Fr and D∘Fr⁻¹ send α back to α when D(a)=a³. The wrong-direction construction passes the Check.

   **Exact repair:** Keep the correct formulas and add the following control consistently in §§5.6, 5.8 and 8.3. In F₂₇⊂k take β³−β−1=0. The polynomial has no root in F₃; Frβ=β+1, Fr⁻¹β=β⁹=β−1. For D(a)=a³, D(Fr⁻¹β)=β, whereas D(Frβ)=β−1≠β. I independently computed these products modulo β³−β−1. The existing F₉ examples can remain, but cannot be the only direction witness.

7. **F07** (P3) The projective-dimension definition has the section's tag

   **Location:** `packages/SheafTheoreticSmithTheory/README.md:234`, “Tag 0A5M (Definition 15.70.1)”.

   **Claim:** 0A5M is the tag of the cited definition.

   **Witness:** Stacks, More on Algebra, lines 8128–8135: 0A5M labels §70, while Definition 70.1 is tagged 0A5N.

   **Exact repair:** Cite Tag 0A5N for Definition 15.70.1; retain 0A5M only if explicitly citing the whole section. Rechecking the definition gives the intended bounded projective representative. In the two-term complex A→u A, the representative has projective amplitude [0,1], although both cohomology modules are nonprojective. No mathematical change is needed.

Seven findings: two P1, two P2 and three P3; four blocking findings. This is a repairable package, not a rejected scope. I reviewed all 65 numbered targets and their APIs, Checks, proof routes and dependencies, the two Lean headlines, all six elaborated signatures, metadata, the source manifest and the gap records. No earlier package review was supplied. The mathematical computations below are tests of statements and conventions, not claims to have proved the proposed library.

## Verified sound

The read-only inputs were preserved. No source passage was copied into this report or package, no source manifest entry was rewritten, and no additional source was needed. I found no computational algorithm, sorry-valued data, `set_option`, weakened Lean stand-in, duplicate fully qualified Lean name, or evidence that this package replans an existing roadmap. Its difficult étale transports and naturality statements are explicitly targets; they must not be mistaken for consequences already proved by the cited topological sources.

**Source sample.** All 15 requested locations were readable. No author-marked unverified locator was found. The manifest's nine works were checked using the cached legal extracts, including the four Stacks chapter extracts. JMW14, JMW16 and LL21 use the preprint numbering declared in the manifest, not journal pagination. The following records separate source support from new extension obligations.

| Seeded target | Text actually inspected | Result at the stated hypotheses |
|---|---|---|
| 0.2 Admissible actions | Feng24 §3.2, pp.14–15, lines 650–683 | Admissibility and free quotient are present. Scheme-theoretic equalizers are appropriate. Supplier coverage is insufficient: R02. |
| 0.5 Flat/perfect complexes | Feng24 Definition 3.1/Lemma 3.2, pp.13–14, lines 595–623; Stacks, Cohomology on Sites, lines 5207–5223 and 5300–5314 | Finite Tor amplitude is a property of complexes; the README correctly separates local and common bounds and geometric from coefficient equivariance. |
| 1.2 Two-periodicity | Feng24 Example 3.4, p.14, lines 641–648; complete resolution/display (3.5), p.17, lines 759–783 | Correct for k/O with the stated tensor bound. The README correctly avoids claiming the acyclic sequence contracts. R05 fixes the pinned generator citation. |
| 1.5 Trivial-action formulas | Feng24 Lemma 3.14, p.18, lines 788–807; (4.1), p.20, lines 882–885 | Vector-space complex formula and integral free-unit formula agree with the differentials 0,p. No global formality inference. |
| 2.2 Compact support, locally finite type | Feng24 Lemma 3.9/proof/Remark 3.10, p.16, lines 709–718; Proposition 3.12, p.17, lines 742–757 | Colimit over finite-type opens and bounded dimension are present. README explicitly separates ind output from constructible output and records uniform adic inputs. |
| 2.9 Smith and compact support | Feng24 Proposition 3.12, p.17, lines 742–757; §3.4.5, p.19 | The ! comparison is not restricted to proper maps. Free-complement localization is the right route; uniform Witt extension remains conditional. |
| 3.3 Tilting category | JMW16 §1.1/Theorem 1.1, p.1, lines 12–27; Feng24 §4.5, p.23, lines 993–1018 | Rational field-valued tilting and its classification supported. Neither citation supplies the O classification: R04. |
| 4.6 External products | Feng24 Theorem 4.8, p.23, lines 997–1011; proof of Lemma 4.14, p.24, lines 1066–1080 | Product decomposition motivates the route. README replaces the source's filtration shortcut by external products and finite sums; integral inputs must be supplied as in R04. |
| 4.7 Graded Hom/composition | LL21 Proposition 4.6.1, pp.14–15, lines 641–678; Proposition 5.5.2, p.22, lines 985–1013; §5.6.6, p.25, lines 1120–1145; Feng24 (4.2), p.22, lines 950–977 | Direct sum of even-shift Hom groups and grading projection are supported in LL's setting. The README explicitly owns compatible étale transport and composition. |
| 4.9 Tate-parity uniqueness | LL21 Theorem 5.5.6, p.23, lines 1034–1068; Proposition 5.6.3/Theorem 5.6.4, p.24, around line 1072; Feng24 Propositions 4.3/4.5, pp.21–22, lines 906–950 | Dense restriction and local endomorphism argument supported under finite-stratification/local-system assumptions. Positive nilpotent Hom is permitted. |
| 4.10 Ordinary reduction | JMW14 (2.13)/Proposition 2.39, p.17, lines 785–818; Feng24 Lemma 4.16, p.26, lines 1126–1137 | JMW supports ordinary parity reduction. Feng's stronger equivariant statement fails; README explicitly rejects it using the augmentation ideal. |
| 5.1 Fixed Grassmannian | Feng24 Lemma 4.11, p.24, lines 1036–1038 | Product rotation gives the diagonal. The README strengthens the verification to arbitrary test rings, including nilpotents, using supplied ordinary models rather than perfection. |
| 6.4 Normalized CT | Feng24 Appendix A.1, pp.56–57, lines 2523–2570; (A.2), p.58, lines 2590–2644 | Six-operation square and normalization comparison supported; shift difference is (p−1)⟨2ρ,ν⟩. The chosen periodicity, not parity equality alone, is required. |
| 8.2 Character extension | Feng24 Lemma 5.15/(5.20), p.42, lines 1869–1885; TV16 §3.4/(3.4.1), pp.11–12, lines 512–532 | Containment of all norms/transfers, annihilation and perfect target support the statement. Linear independence proves uniqueness; the imperfect-field control is valid. |
| 8.3 Frobenius twist | Feng24 Construction 5.17, p.43, lines 1896–1908; TV16 §2.1, p.5, lines 207–210 | The tensor balancing relation, inverse scalar action in the same-vector model, and source inverse-Frobenius linearization agree. Formula sound; convention test needs R06. |

Additional source controls opened: MR18 Theorem 1.1, p.3, lines 90–123, and Corollary 1.6, p.6, lines 263–277, supply the good-prime exotic engine rather than a characteristic-zero Springer substitute. MV07 Theorem 14.1, p.40, lines 1647–1684, supplies the arbitrary-geometric-field model with its coefficient restrictions, not all W(k)/LL comparison coherences. Braden03 Theorem 1, p.2, lines 28–54, retains normality and weak equivariance. Stacks Algebra, lines 11331–11372, supplies arbitrary-rank flat freeness for nilpotent maximal ideal, so finite Nakayama is not being smuggled into §0.4.

**Computed adversarial table.** All 65 target sections were examined; the table below retains the seeded targets, headline results and every target touched by a finding. Further elementary local tests of other targets were retained in the review worklist. Unless specified, p=3, k=F̄₃, O=W(k), A=k[C₃]=k[u]/u³, u=σ−1. Tate pairs list even then odd. A successful instance checks that instance, not the as-yet-unformalized general proof.

| Target | Instances | Computed values on the two sides / negative control | Result and change |
|---|---|---|---|
| 0.1 | p=2,3; A₁,G₂ | Highest-root coefficients 1 versus (3,2): 3 good for A₁, bad for G₂. At p=2, N=u and T(k)=(k,k), T(O)=(k,0); datum excludes these valid Smith inputs. | R03: remove global oddness. |
| 0.2 | Rotated X³ on dual numbers; scalar A¹ action; trivial action | Fixed tuples=(a,a,a), including a=ε; scalar fixed equation (ζ−1)x=0 gives x=0. On G_m quotient x↦x³ has rank 3 and invertible derivative 3x². Trivial action gives U=∅. | Geometry passes; general quotient supply fails, R02. |
| 0.5 | C=[A --u→ A] in degrees 0,1 | H⁰(C)=(u²)≅k, H¹(C)=A/(u)≅k, neither flat; C⊗^L_A k=[k --0→ k], amplitude [0,1]. | Complex-perfect versus cohomology-flat distinction passes. |
| 0.6 | Same two-term C; skyscraper test | Stalkwise Tor interval [0,1] equals representative interval [0,1]; residue module alone has nonzero Tor in arbitrarily high degrees. | Common interval is necessary. |
| 1.1 | Point, regular A and trivial k | Quotient sends A↦0 and k↦nonzero; id cone=0. Tensor A⊗_k k is induced A and again killed. | Kernel has correct size; Witt/ind comparison remains an explicit obligation. |
| 1.2 | k,O,A at p=2,3; generator inversion | Tate pairs (k,k),(k,0),(0,0) recur after +2. On C₃, generator inversion multiplies the normalized H²(C₃;F₃) class by 2≠1. | Periodicity passes; use specified-generator API, R05. |
| 1.5 | C=k⊕k[1], trivial O^r, regular A | C has H⁰=k,H^(−1)=k, so each Tate parity k²; trivial O^r gives (k^r,0); A gives (0,0). | Formula passes; no global sheaf formality used. |
| 2.1 | A¹→pt and G_m↪A¹ | RΓ_c(A¹,k)=k(−1)[−2], top degree 2; nearby Rj_* has H⁰=k,H¹=k(−1), although relative dimension of j is 0. | Separate ambient Rj_* bound is essential. |
| 2.2 | Infinite points; disjoint affine spaces | RΓ_c(⊔_N pt,k)=⊕_N k, whereas product has non-finite-support vectors; ⊔_n A^n has nonzero H_c^(2n) for every n. | Uniform-dimension assertion passes. |
| 2.5 | Identity and scalar action on A^n | Identity comparison cone=0; i!k at origin is k(−n)[−2n], i*k=k; the periodic comparison identifies the shifts in the Tate quotient. | Finite ambient dimension retained. |
| 2.8 | Unit tensor, induced tensor, A¹ | 1⊗K=K; A⊗K induced and Tate-zero. Ordinary RΓ(A¹,k)=k, compact RΓ_c=k(−1)[−2]. | Six-operation distinction passes. |
| 2.9 | Free orbit; fixed plus free; scalar map | Both sides 0 on free orbit; both sides T(k) on k⊕A; identity comparison sends scalar 2 to 2. | Compact-support naturality tests pass. |
| 2.10 | Fixed point plus free orbit | T(RΓ_c)=T(k⊕A)=(k,k)=T(RΓ_c(fixed locus)); empty fixed locus gives (0,0). | Localization tests pass. |
| 3.1 | Torus, rank zero, standard dual SL₂ | Torus convolution weights 1+(−1)=0 equals tensor weight 0; rank-zero group gives unit O reducing to k; standard dual SL₂ has dimension 2 and weights ±1. | Scope extension is a target, not already supplied finite-extension Satake. |
| 3.3 | SL₂ at p=3; torus; trivial group over O | Δ(3) has factors L(1),L(3), dimensions 2+2; T(3) has dimension 4+2=6. For group 1, End_O(O)=O, reducing to End_k(k)=k, not an O-level field Hom. | Field part passes; integral classification needs extension, R04. |
| 3.4 | SL₂ standard tensor; torus-equivariant map | V⊗V=T(2)⊕T(0), dimensions 4=3+1. D=diag(1,2), U=[[1,1],[0,1]] give (DU)₁₂=1, (UD)₁₂=2. | Tensor/character claim sound; torus maps need not be group maps. |
| 3.5 | Torus and Δ(3) | Torus higher Ext=0; Δ(3) has tilting coresolution 0→Δ(3)→T(3)→Δ(1)→0, dimensions 0→4→6→2→0. | Bounded generation plausible on each finite ideal; no uniform length claimed. |
| 4.4 | P¹ and Artin–Schreier local system | Normalized P¹ object O[1]. In geometric characteristic 2, Lψ(x³) with coefficients char 3 has H¹ dimension 2, whereas constant A¹ coefficients have H¹=0. | Constant-local-system restriction is necessary and present. |
| 4.5 | GL₂ minuscule and bad prime G₂ | P¹ k[1] is perverse and corresponds to a 2-dimensional tilting. p=3 divides a G₂ highest-root coefficient; excluded only from good-prime engine. | MR engine/transport are explicit local targets. |
| 4.6 | r=0,1,2 minuscule products | Objects O[0],O_P¹[1],O_(P¹)²[2]; dense ranks all 1, versus E⊕E rank 2; transposing two odd-degree factors contributes −1. | Normalization/product checks pass. |
| 4.7 | E=O_P¹[1] and point | End_T(E)=k⊕kh with grading indices 0,1; h²=0=H⁴(P¹;k). At point only index 0, Hom=k. | Hom formula and graded composition pass. |
| 4.9 | Point and P¹ extension | End_T(O)=k; End_T(O_P¹[1])=k[h]/h² with radical kh, nonzero h but no nontrivial idempotent. Rank-two unit has idempotent diag(1,0). | Indecomposability criterion passes. |
| 4.10 | Ordinary Hom and augmentation ideal I | Hom_O(O,O)⊗k=k=Hom_k(k,k); I^C₃=0 but (I/pI)^C₃=k·u², dimension 1. | Ordinary reduction passes; source's full-equivariant claim fails. |
| 4.12 | Scalars and positive-index h | L(id)=id, L(2id)=2id, L(h)=0; h is nonzero in Tate Hom. | Projection-to-index-zero behavior passes. |
| 5.1 | Dual numbers, rank zero, dimension-one stratum | Fixed tuples (ε,ε,ε); rank-zero Grassmannian a point; dimensions 3 and 1 differ by 2, whereas 2 and 1 differ by 1. | Scheme statement all primes; normalized parity requires oddness. |
| 5.3 | Two basis vectors, odd constant word | 2³=8 words=2 constant+2 regular orbits of size 3; cycle sign (−1)²=1. Zero stalk gives zero words. | Induced-summand route passes at odd p. |
| 5.5 | f+g at p=3; scalar α | Eight tensor terms split as two pure terms plus two transfer orbits, killed in Tate quotient; scalar α maps to α³=−α. | Additive after quotient, Frobenius-semilinear before correction. |
| 5.6 | F₉ and F₂₇ | In F₉, Fr(α)=Fr⁻¹(α)=−α, both direction choices pass. For β³=β+1 in F₂₇, Fr⁻¹β=β−1; DFr⁻¹β=β, DFrβ=β−1. | R06: add order-three Frobenius control. |
| 5.7 | Prime-field and non-prime-field scalars | Fr(2)=2, Fr(α)=−α; specified form fixes integral basis objects and gives these Hom transformations. | A form is data, not canonical on every category. |
| 5.8 | Scalar correction and direct sum | BC^(p)(α)=−α, BC(α)=α; mixed rank-two tensor orbits vanish, leaving two pure summands. | k-linearity/biproduct checks pass. |
| 6.1 | Torus; nonmonodromic diagonal in A² | Torus CT=id. For weights (+1,−1), diagonal-supported k has one hyperbolic restriction k and the other k[−2] up to twist, so monodromicity cannot be dropped. | Monodromic hypothesis matters. |
| 6.3 | Two weights of P¹ generator | Plus weight: RΓ_c(A¹,Λ[1])=Λ(−1)[−1], shift +1 gives degree 0; minus weight: Λ[1], shift −1 gives degree 0. Tensor weight multiplicities 1,2,1. | Normalization sign passes. |
| 6.4 | p=3 diagonal weights ±1; torus; nonfixed tuple | Shift differences 3−1=2 and −3−(−1)=−2; torus difference 0; tuple (1,0,0) has empty fixed contribution. | Periodicity comparison passes once R05 pins generator. |
| 6.5 | h and scalar on minuscule generator | CT sends index-one h to Hom(k,k[2])=0 on each weight point; scalar 2 maps to 2. L has the same values. | CT/lifting grading checks pass. |
| 6.6 | Split torus, three weights | (2,−1,4) restricts along diagonal to weight 5; α restored to α after linearization, matrix entries treated identically. | Objects and maps both match. |
| 6.7 | Dual SL₂ standard triple tensor at p=3 | (x+x⁻¹)³ has integer coefficients 1,3,3,1; equals ch T(3)+ch T(1), total dimension 6+2=8. | Characters identify tilting objects, not natural components. |
| 6.8 | D=diag(1,2), positive-root U over F₃ | D commutes with diagonal torus, but (DU)₁₂=1≠2=(UD)₁₂. | Root-equivariance is a separate explicit target; source argument inadequate. |
| 6.9 | Torus and dual SL₂ | Weight triple (2,−1,4) gives weight 5 on both sides; standard triple restriction has dimension 8 and character coefficients 1,3,3,1 on both sides. | End theorem agrees on instances; full naturality is owned in 6.8. |
| 7.2 | Split sequence and SL₂ Weyl sequence | Torus sequence dimensions 1→2→1 splits; Smith norm leaves pure 1+1 contributions. SL₂ sequence dimensions 2→4→2 is exact on weight spaces. | Exactness tested via weights, not additive integral norm. |
| 7.4 | Trivial and cyclic descent | Trivial Γ gives BC; order-three descent requires uγ·γ(uγ)·γ²(uγ)=1. A merely semilinear map with cube scalar 2 fails 1. | Descent includes cocycle and full action. |
| 7.5 | Positive-index h on P¹ | F_T(h)=h≠0; I_k L(h)=0. On the object itself both functors give the reduced Tate unit. | Objectwise comparison correct; full Tate naturality false and excluded. |
| 7.6 | Norm-generated scalar; arbitrary Tate h | Integral scalar 2 has norm 2³≡2 mod3, so both comparison routes give 2. Arbitrary h gives h versus 0 and is not thereby a norm-image counterexample. | Restricted naturality remains a genuine local theorem. |
| 8.1 | Identity, product rotation, dual numbers, p=2, n=0,4 | σ=id: transfer=0,norm=a^p, δ=Frob. On B^p rotation transfer surjects onto diagonal, quotient=0. ε²=0 gives norm ε=0. p=2 cross-term=aσb+bσa=transfer(aσb). n=0 gives transfer 0,norm 1; n=4 with σ swapping x,y over F₂ gives Nm(x)+Nm(y)=0 but Nm(x+y)=x⁴+y⁴≠0. | Prime hypothesis, zero quotient and total definitions all correct. |
| 8.2 | Perfect target; imperfect negative control; product | With σ=id, extension value Fr⁻¹χ(a^p); for χ(x)=α this is Fr⁻¹(−α)=α. κ=F_p(t), S=F_p[x^p], χ(x^p)=t has no extension since t has no pth root. Product rotation has transfer(1,0,…)=1, so no unital transfer-annihilating character. | Existence and uniqueness hypotheses discriminate. |
| 8.3 | W=k; A=k[x]; F₂₇ | (aλ)^pμ=a^pλ^pμ on both sides of balancing. Linearized diagonal fixes scalars and sends x↦x^p, not x. β³=β+1: correct scalar β, wrong-direction scalar β−1. | Formula correct; R06 strengthens convention Check. |

The original-gap test is also computed: five original identifiers, zero `supplier` fields, zero matching original slugs in the README; the three new external gaps each have one named supplier and one matching README contract. This is the administrative witness for R01, separate from the mathematical tests.

**Ownership and resolved supplier citations.** I used `roadmaps list`, `roadmaps grep` by object, `roadmaps show` at the available heads, the main checkout, the pinned libraries and the supplied board index. Searches included invariant affine quotients/free geometric torsors, finite-Tor sheaves, stable quotients, rational Weyl/tilting modules, parity/Tate parity, normalized Satake, Smith restriction, spectral versus algebra Tate diagonals, transfer ideals and Frobenius scalar extension. Main-branch copies were used for existing roadmaps even where an open revision also exists. The direct supplier resolutions are below; line numbers refer to each roadmap's README, not to a generated listing.

| Supplier and repository-relative file | Resolved location and boundary |
|---|---|
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` | §0.1 at 429; E1.3 at 549; E1.4 at 580; E3.4 at 1229; E5:abstract around 1494–1569. Enhanced coefficients, common coherent diagrams and stable quotient imports exist. Its own named generic quotient supplier is respected. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` | F.1 around 458–505, F.2.4–F.3.0 around 593–646, F.2.7 around 760–777. Native constructible/Tor/compact-support inputs exist. F.10.4 around 1373–1412 treats free torsors on affine curves with finite coefficients; it is not the full bounded-dimensional k/W(k) Smith theorem. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §0.23a at 1508; §1.17 at 2624; §1.21 at 2951; §1.23 at 3021. Equalizers, topological invariance and quotient-stack inputs exist; general gluing/torsor supply overclaimed in R02. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md` | §7.5 at 1416, arbitrary-rank flat freeness over a local ring with nilpotent maximal ideal. This is the actual input for group-ring modules, not a finite-generation theorem. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` | §§0.1–0.2 at 105/145; §2.2 at 1463; §2.4 at 1783; §§3.1–3.2 at 2887/3094; curve Euler–Poincaré in §5.2 at 4914; §7.3 at 7342. The normalized adic coefficient ring is the integers of a finite Q_p-extension. The W(F̄_p) extension is correctly declared separately. |
| `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md` | §§1.1–1.3 at 543–615; §1.5 at 654; §§1.8–1.9 at 719/733; §1.14 at 856. Fusion signs and finite-extension integral Satake exist; arbitrary separably closed geometric-field geometry is a declared extension. |
| `TauCetiRoadmap/GeometricSatakeAndFusion/README.md` | GS0 equal-characteristic models at 784: ordinary finite Schubert models are compared before perfection, within the stated F_q((t))/perfect-test-algebra setup. The package uses its field-extension contract rather than treating perfect tests as all scheme tests. |
| `TauCetiRoadmap/ReductiveGroups/README.md` | Layers 1,4,9 and §§10A–10B, with 10A at 1733 and 10B at 1759: actual rational comodules, weight lattices, induced/Weyl modules, integral lattices and dual conventions. These are imported, not rebuilt. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | RG2.0a separable splitting around 1205; RG2.5.1–RG2.5.2 dual group around 6788, Galois action around 6889, dual isogenies/products around 7068. The splitting uses a separable closure and the Galois action on weights is inverse precomposition. |
| `TauCetiRoadmap/LanglandsParameterStacks/README.md` | LP3.0 at 729: field-valued highest-weight/good-filtration theory and tensor theorem. The finite-ideal contract adds precisely the required finite category input; it does not supply its integral analogue, R04. |
| `TauCetiRoadmap/AInfCohomology/README.md` | AI.7.2 spectral Tate diagonal at 3849. This is a transformation on spectra with monoidal coherence, distinct from the ordinary ring A^σ/Tr(A). The package correctly identifies this boundary in ownership. |

The three named new gaps are genuine extensions with stated coefficient/geometric/highest-weight domains, not findings merely because their suppliers have not implemented them. The Witt gap's operations are the compatibility package for one coefficient extension; the finite-ideal gap's Hom/Ext/resolution clauses specify one highest-weight category. Neither is an unrelated shopping list. They do not resolve the original ownerless records (R01) or the integral tilting scope (R04).

No same fully qualified declaration was found on main or at any open roadmap head for this namespace or either headline. The nearby spectral Tate work, Frobenius-on-tensor-product results and curve-level free-torsor perfection are different objects or strictly narrower inputs, not duplicate ownership of this package. Generic derived categories, scalar tensor products, Frobenius, invariant subrings and module Tate groups are cited rather than replaced. Board-package checks are limited as recorded below; no global nonexistence claim depends on an inaccessible head.

The cross-citation resolver's single lead was the literal `sources.toml` in References, treated as a name. It is a file reference, not a missing mathematical declaration. This does not excuse the independently verified supplier drift in R02. Every `*Needs:*` line was read. Local routes progress forward: the weight functors for §3.1 are built there, while Layer 6 adds Smith compatibility; §§6.8 and 7.6 are substantive targets, not consequences inferred from character equality or objectwise comparison.

**Dependency check.** I ran the prescribed movable dependency check on this README and the supplied order. Its complete output was:

```text
depcheck: 52 roadmaps, 591 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was edited. A clean graph does not establish that the supplier actually states the consumed result, which is why R02 remains blocking.

**Pinned declarations opened.** The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the respective library repository.

| Declaration | File and line; boundary verified |
|---|---|
| `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`: ordinary derived localization; no geometric equivariance or enhanced six operations. |
| `MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76`: finitely supported coefficients on a monoid; no geometric action. |
| `WittVector` and DVR | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:148`: the latter retains perfect field/characteristic hypotheses. |
| `WittVector.quotientPEquiv`, `WittVector.isAdicCompleteIdealSpanP` | `Mathlib/RingTheory/WittVector/Complete.lean:105` and `:116`: residue/completeness of the coefficient ring, not adic sheaf-limit comparisons. |
| `Module.free_of_flat_of_isLocalRing` | `Mathlib/RingTheory/LocalRing/Module.lean:299`: finite generation is an actual hypothesis. The arbitrary-rank case is correctly sent to the named supplier. |
| `tateCohomology`, `tateCohomologyFunctor` | `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:140`: finite-group representation over a commutative coefficient ring, output in modules, not a sheaf quotient. |
| `TauCeti.TateCohomology.H0IsoNormQuotient` | `TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151`: invariants modulo additive norm as a module; it does not construct the multiplicative norm-induced ring map in §8.1. |
| `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, `tateCohomologyIsoOdd` | `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:167` and `:200`: actual generator and generation proof are parameters. |
| `periodicIsoOfGenerator`, `periodicIso` | Same file at 302 and 346: specified versus chosen generator, R05. |
| `frobeniusEquiv` | `Mathlib/FieldTheory/Perfect.lean:121`: characteristic p and perfectness; no automatic choice of a prime-field form of an arbitrary algebra/category. |
| `linearIndependent_monoidHom` | `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean:502`: multiplicative source, commutative domain target; applicable to the distinct characters in §8.2 without assuming algebraic closure of κ. |
| `RingHom.eqLocus` | `Mathlib/Algebra/Ring/Subring/Basic.lean:867`: carrier at line 871 is equality of the two ring maps. For σ=id it is all of A; for a nontrivial cyclic permutation it is the diagonal subring. It does not impose σᵖ=1. |
| `Ideal.span`, `Ideal.Quotient.mk` | `Mathlib/RingTheory/Ideal/Span.lean:45`; `Mathlib/RingTheory/Ideal/Quotient/Defs.lean:83`: real ideal and unital quotient map, including the unit ideal/zero quotient. |
| `TauCeti.AffineInvariantQuotient.isFinite_projection`, `isFinite_projection_of_finiteType` | `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66` and `:73`: finite affine invariant quotient, not general gluing or free-action flatness. |

Object searches also distinguished ordinary Grassmannians, arithmetic Smith normal form, Lie highest-weight theory and finite-field Frobenius tensor formulas from the absent affine-Grassmannian sheaf, modular tilting and Smith functor carriers. No claim of complete absence is based merely on a declaration-name grep.

**Headline/Lean audit.** The README's deep outputs are: sheaf Tate periodicity (§1.2); relative Smith and compact-support localization (§§2.5, 2.9–2.10); modular Satake and coefficient/weight comparisons (§§3.1–3.2); tilting tensor closure, character determination and derived generation (§§3.4–3.5); parity–tilting (§4.5); integral graded Hom, ordinary reduction and lifting (§§4.7, 4.10, 4.12); additive Frobenius-semilinear norm and linear BC (§§5.5, 5.8); normalized CT and its comparisons (§§6.1, 6.3–6.5); natural diagonal restriction (§6.9, using §6.8); exactness, Galois descent and the norm-image integral comparison (§§7.2, 7.4, 7.6); algebra Tate diagonal and unique character extension (§§8.1–8.2). The uniform W(k) and étale transport comparisons are also named in the module docstring.

The two statable algebra headlines appear with exactly four elementary definitions and no substitute for the unavailable categorical theorems. The module docstring names all the unavailable headline groups and the missing carriers. The four definitions are needed to state the diagonal; `transferIdeal` is an actual ideal, not an unconstrained predicate. The native rings also allow the zero ring, as promised.

I ran the prescribed `lake env lean` elaboration from the content checkout on the original `packages/SheafTheoreticSmithTheory/Suggested.lean`. It exited 0; the only warnings were the two declarations using `sorry`, at lines 56 and 67. There are no TauCeti imports to build. A scratch copy with `#check @name` for all six declarations also exited 0 with only those same warnings. Comparison with the README found zero lost section binders: p primality, the equation `(p : A)=0`, σᵖ=1, perfectness/characteristic of κ, subring containment, all norm/transfer containments and transfer annihilation survive. No reviewed Lean signature was changed.

For each theorem I tried the single tactics `simp` (with the four definitions), `rfl`, and `infer_instance` on a scratch copy. Both goals remained open; no matching single library theorem was found in the object/declaration audit. Neither theorem is a definition restatement, boundary computation, README Check or arbitrary-data substitute. There is no padding to delete.

The README has the requested title, summary, ownership, conventions, supplier contracts, reading guide, nine layers each ending in Examples and Dependencies, consumers and references. All 23 explicit definition/API blocks have at least four Check bullets. Their substantive controls were evaluated; R06 is the remaining convention-discrimination defect. I compared shape with main-branch `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/LocalGaloisGroups/README.md`, and read the relevant ReductiveGroups sections. Metadata and source keys introduce no separate finding. No source/version entry was changed.

## Not verifiable

- No cited source text was inaccessible. There is no missing-reference request, and no manifest entry was added or changed.
- Ownership against fifteen indexed board heads could not be checked: ArithmeticLocallySymmetricSpacesPartII; CompletedCohomologyAndLocalGlobalCompatibilityPartII; CrystallineCohomologyPartII; EndoscopicTransferAndUnitaryTraceComparisonPartII; HigherHidaAndColemanTheory; LawrenceVenkateshMethod; OrdinaryAutomorphicFormsAndModularityLiftingPartII; PELModuliPartII; PadicHodgeTheoryPartII; PadicLocalLanglandsForGL2QpPartII; RealSurfacePeriodIndex; SchemeAndStackFoundationsPartII; ShimuraVarietiesPartII; VStackSheavesAndLisseCategoriesPartII; VectorBundlesAndIsocrystalsPartII. Reading `packages/<Name>/README.md` at each supplied head returned HTTP 404. The four readable heads—AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LogicAndDefinabilityInNumberTheory—were searched by the relevant objects and yielded no competing construction. I do not infer nonexistence from a 404.
- The source texts do not certify the package's new W(k)-adic limits, full étale LL transport, integral tilting extension, root-equivariant natural comparison or norm-image naturality. These are future theorem obligations, with the ownership/input defects specified above; passing finite tests or elaborating `sorry` does not settle them. This is a limit on what the review establishes, not a request for an inaccessible text.

## Source issues

- **Misprint** in Feng24 at Example 3.4, printed p.14, Feng24 line 643: the source says the displayed periodic exact complex is nullhomotopic; it should be called acyclic, without asserting an equivariant contracting homotopy; affects the proof.
- **Error** in Feng24 at Lemmas 3.6–3.7, printed p.15, Feng24 lines 679 and 685: the source says independent group-ring sheaves satisfy the free-geometric-action conclusions; it should be stated for geometrically equivariant sheaves with the induced quotient action; affects a stated result.
- **Misprint** in Feng24 at Corollary 3.11, printed p.16, Feng24 line 721: the source says the compact-support image lies in the flat category on Y; it should be the flat category on S; affects a stated result.
- **Error** in Feng24 at §4.1, printed p.19, Feng24 lines 849–855: the source says all finite free local systems on the positive-characteristic flag strata satisfy the JMW condition; it should be restricted to the constant or appropriate equivariant local systems; affects a stated result.
- **Misprint** in Feng24 at §4.2 after display (4.1), printed p.20, Feng24 line 886: the source says odd Ext nonvanishing enables the parity arguments; it should be odd Ext vanishing; affects the proof.
- **Gap** in Feng24 at §4.4, printed p.22, Feng24 lines 971–977: the source says self-negative-Hom vanishing suffices for the grading-projection functor; it should be stated with negative Hom vanishing between every pair of chosen generators; affects the proof.
- **Error** in Feng24 at Lemma 4.16, printed p.26, Feng24 lines 1126–1137: the source says reduction is full on the C_p-equivariant parity category; it should be restricted to ordinary parity maps or a separately justified smaller morphism domain; affects a stated result.
- **Error** in Feng24 at Lemma 4.24, printed pp.29–30, Feng24 lines 1290–1312: the source says the right comparison square commutes on the full Tate-parity morphism category; it should be restricted to a morphism domain with proved vanishing of positive-index contributions; affects a stated result.
- **Gap** in Feng24 at Appendix A.4, printed p.60, Feng24 lines 2701–2706: the source says faithful torus restriction and object detection reduce natural comparison to the torus; it should be supplemented by construction of full dual-group-equivariant comparison maps; affects the proof.
- **Misprint** in Feng24 at Lemma A.3 proof, printed p.61, Feng24 lines 2742–2744: the source says the chosen object belongs to the ind Tate category before choosing a maximal support stratum; it should be restricted to the theorem's constructible finite-support domain; affects the proof.
- **Misprint** in JMW16 at Theorem 1.4, printed p.2, JMW16 lines 72–76: the source says every indecomposable parity complex is an unshifted normalized E(λ); it should be stated for shifts E(λ)[n], or explicitly restricted to normalized complexes; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "43e3e43716c529f56d97a7ebb94533d76ed0035a", "job": "REV-PKG-SheafTheoreticSmithTheory", "model": "gpt-6-astra", "worker": "chris-13"} -->
