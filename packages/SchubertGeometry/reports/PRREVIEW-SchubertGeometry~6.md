# Review of SchubertGeometry (pull request #1224 at a4a7f5c)

**Verdict:** needs changes

:robot: Independent AI full review of the folder at a4a7f5c (203 changed lines since b6cf2e7). Three blocking findings and one P3. This verdict is a request for repairs before the next review, not an approval or a merge.

## R01 (P2) — The gate's dependency check reports an upward supplier: IndexTheory

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:1255`, “*Needs:* IndexTheory I8, with its holomorphic fixed-map trace and bundle-lift hypotheses”; line 1370, “IndexTheory I8;” in Layer 9's Dependencies; line 125 (supplier-contract bullet) and line 895.

**Claim:** S9.2 consumes the holomorphic Lefschetz fixed-point formula from IndexTheory I8.

**Witness:** The worker's gate at this head and my own run both print

    UPWARD: SchubertGeometry (on main) -> IndexTheory (#10) at README lines [1255, 1370]
    depcheck: 239 roadmaps, 2429 edges, 1 problem(s)

SchubertGeometry is on main, so it sits before every roadmap of the merge order; IndexTheory is line 11 of ORDER.txt (pull request #1077, head ce2d41a, where I8 is at `TauCetiRoadmap/IndexTheory/README.md:902`). The previous full review predicted exactly this line for the day IndexTheory entered the order; it has.

**Repair:** Remove IndexTheory from every supplier position (the `*Needs:*` item at line 1255, the Dependencies item at line 1370, the contract bullet at line 125, and the clause at line 895). Then either (a) state the holomorphic Lefschetz fixed-point formula as S9.2's own target, in exactly the generality the paragraph at line 1253 already displays (compact boundaryless complex manifold, isolated fixed points with det_ℂ(1−df_x)≠0, holomorphic φ:f*E→E, alternating trace Σ_x tr(φ_x)/det_ℂ(1−df_x)), with the locator Atiyah–Bott, *A Lefschetz fixed point formula for elliptic complexes II*, Ann. of Math. 88 (1968), Theorem 4.12, and record in Scope, on a line without the words “supplies” or “supplier”, that IndexTheory I8 is a later roadmap that builds the generic heat-kernel proof and must cite S9.2; or (b) delete the Lefschetz lane S9.2–S9.4 (and S9.1's and S9.7's uses of it) and state in Scope that the fixed-point character comparison is left to a SchubertGeometry Part II placed after IndexTheory. Retest: the depcheck command of the brief must print 0 problems, and S9.3's Check (z=2 on SL₂: 8/3 − 1/6 = 5/2) must still have a stated input.

## R02 (P2) — Seven Tau Ceti declarations and one file named in the supplier contracts do not exist at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:89–95` (“`CoxeterSystem.MinimalCosetRepCovBy` and `CoxeterSystem.MinimalCosetRepChain` (`Bruhat.lean`) … `CoxeterSystem.exists_minimalCosetRepChain` and `CoxeterSystem.MinimalCosetRepChain.length_last_add_length` (`ChainProperty.lean`)”) and lines 101–102 (“`TauCeti.weylCoxeterSystem` and `TauCeti.length_weylCoxeterSystem_eq`”); consumed at lines 404, 420, 675, 713, 756.

**Claim:** These are pinned declarations that S2.3, S2.4, S4.1, S4.3 and S4.5 consume directly.

**Witness:** The branch's `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (2026-10-05). At that revision `TauCeti/GroupTheory/Coxeter/` has no `ChainProperty.lean`, a recursive grep for `MinimalCosetRepCovBy`, `MinimalCosetRepChain`, `exists_minimalCosetRepChain` and `length_last_add_length` returns nothing, and `TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean` defines only `weylCoxeterHom` (its docstring at line 41 calls `weylCoxeterSystem` “the remaining target”). All seven names exist at main's pin `2fd255d997f47c0b5d834ee416c7015d55444ce5` (2026-11-04): `Bruhat.lean:588, :650`, `ChainProperty.lean:165, :178`, `Presentation.lean:167, :191`, with the hypotheses the README states (`[Finite ι] [CharZero R] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`, a `Base`, no spanning).

**Repair:** The contract must name declarations that exist at the pin the folder is built against. Bring the branch to main's manifest (a rebase onto main does it; this review edits no manifest), and then keep the names as written. Until that happens the five `*Needs:*` lines cannot be checked, and the acceptance test of R03 below cannot be written. Retest: `grep -rn "MinimalCosetRepChain\|weylCoxeterSystem" .lake/packages/TauCeti/TauCeti` in the pull-request worktree must hit `Bruhat.lean` and `Presentation.lean`.

## R03 (P2) — At the revision the contract cites, Tau Ceti already builds S3.3, S3.4 and S4.1–S4.3; the README plans them again

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:516` (“Define the integral Demazure Euler operator by finite signed root strings … Prove its localization identity”), 563 (“Prove D_i²=D_i, the finite braid relations and word-independence”), 650 (rational PL paths, reparametrization, normalization), 680 (root operators, cut times, string lengths), 696–701 (LS chains, bonds, interval gcd, central transport T(λ,χ;σ), convexity API); also line 71–73 (“The pinned library has no …”), which no longer lists LS paths, crystals or Demazure operators.

**Claim:** These are construction targets of this roadmap.

**Witness:** At Tau Ceti `2fd255d9`, the revision whose declarations the contract names (R02), the following exist and prove the stated targets: `TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/Basic.lean` (`RootPairing.demazureOperator` with exactly S3.3's three strings, the localization identity, `Dᵢ²=Dᵢ`, Weyl-invariant fixed points), `Demazure/Braid.lean` (braid relations and word independence via Matsumoto), `Demazure/LongestElement.lean` (Δ·D_{w₀}(f) equals the dot alternatization), `Demazure/Parabolic.lean` (Levi and wall cases, the recursion D_iχ_ξ=χ_{s_iξ}); `RootSystem/ReflectionBond.lean` and `Weyl/CoverBond.lean` (S4.3's bond b_λ(x,y)=−⟨xλ,β∨⟩, unique positive root label, positivity, integrality, central translation invariance), `Weyl/ChainBond.lean` (`bondGcd`, `IsAChain`, denominator criterion, gcd of a concatenation), `Weyl/IntervalBondGcd.lean` (`intervalBondGcd` with the chain-independence theorem `bondGcd_eq_intervalBondGcd`, proved by the very chain-sorting induction S4.3 asks for, with d_λ(x,x)=0 and d_λ(x,z)=gcd(d_λ(x,y),d_λ(y,z))), `Weyl/ReflectedChain.lean`; and `TauCeti/RepresentationTheory/LSPath/` (`PLPath.lean`: segment lists, `normalize`, reduced presentations, concatenation monoid, reversal; `Reparametrization.lean`; `RootOperator.lean`: `minHeight`, last/first cut times, `lower`/`raise`; `StringLength.lean`: ε=−h, φ=H(1)−h; `Basic.lean`: `LSPath` as (τ;a) with a-chains, `toPLPath`, finiteness, `straight`, `simple`; `Distinguished.lean`: uniqueness of the constant-velocity presentation and the well-defined central shift; `Central/Transport.lean`: `LSPath.centralTransport χ : LSPath P b λ ≃ LSPath P b (λ+χ)` with endpoint, height, straight-path and additivity laws; `ConvexHull.lean`: π(t)∈t·Conv(Wλ) and the 0∈Conv premise with the central counterexample; `Highest.lean`; `Integrality.lean`; `Concatenation.lean` (tensor rule and tie convention); `Stretch.lean`). None of these exists at `a91d3aafa`.

**Repair:** After the pin update of R02, rewrite the From Tau Ceti contract and S3.3, S3.4, S4.1, S4.2, S4.3 (and the convexity, central-transport and chain-simplex bullets of S4.5) to consume those declarations by name, keeping as targets only what that revision does not prove (the geometric H⁰ interpretation of S3.3–S3.4 through S5, the crystal-category packaging of S4.1 if `TauCeti.NormalCrystal` does not already give it, the component and tensor theorems of S4.4, S4.6–S4.7). Move the Checks that the natives already prove to one line each citing the native lemma. Then restate `Suggested.lean`: at that pin the LS-path character identity Σ_{π∈LS(λ)} e^{π(1)} = D_{w₀}(e^λ) (S4.4 with S3.4; Littelmann 1995, Theorem 9.1 with Demazure's formula) and the component theorem (LS paths of shape λ are stable under `TauCeti.PLPath.lower`/`raise` and every one is reached from `LSPath.straight`; Littelmann 1995, Theorem 7.1) are statable on native carriers (`TauCeti.LSPath`, `RootPairing.demazureOperator`, `AddMonoidAlgebra ℤ M`) and are headlines of S4; state each that the native library leaves unproved, and name in the module docstring only those that remain unstatable. Retest: `TauCeti.bondGcd_eq_intervalBondGcd` must be cited at S4.3 instead of “construct the chain-independent interval gcd”, and the S4.3 Check “bond 2, a=1/2 allowed, a=1/3 not” must be `TauCeti.isAChain_iff_den_dvd_bondGcd` on the instance.

## R04 (P3) — Two sampled theorems carry no source locator

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:569` (S3.5, “Own the exact stabilizer/separability and closed-immersion argument for the chosen canonical model”) and line 1000 (S7.2, “Distinguish the effective Cartier divisor of the full section from individual Schubert boundary Weil divisors, which need not be Cartier”).

**Claim:** The closed immersion of G/P_λ by the extremal line and the Cartier/Weil distinction of the Chevalley divisor are targets with their hypotheses.

**Witness:** Neither paragraph nor its `*Needs:*` line names a source; every other sampled target does (S7.1 cites BrionFlags Proposition 1.4.5, whose statement I read at BrionFlags line 667–683; S3.1 cites §1.4, lines 649–654).

**Repair:** Add locators: for S3.5, BrionFlags §1.4, Proposition 1.4.3 and the lines 653–654 pull-back description (type A, with the remark that the characteristic-p closed-immersion argument is the target), and Jantzen Part II, Chapter 8 for the general rational-representation statement (locator only); for S7.2, BrionFlags Proposition 1.4.5 for the divisor and Proposition 1.3.5 (“nonsingular in codimension 1”, line 683) for why the Weil class is defined.

## Previous findings

- r5 R01 (P3, no source manifest) — not repaired: the folder still holds README.md, Suggested.lean and metadata.toml only, and `board/packages/SchubertGeometry/` has no `sources.toml`. A manifest copy inside the roadmap folder would be a stray file under the gate's rule (“sources are the README's references”), so this is not re-raised as a folder finding; it is the board package's record to add.

## Verified sound

**Scope, gate, Lean.** The outside-folder diff against origin/main is empty; the worktree was clean. The worker's gate at a4a7f5c has every scanner, stray-files, build and readme-ids check at zero and only `depcheck=1` (R01). `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean` from the worktree exits 0 with no diagnostics; the file has `import Mathlib`, a module docstring and an empty namespace: no declarations, no sorry'd data, no `set_option`, nothing to probe with one tactic and no `#check` signatures to compare. Its docstring lists ten unstatable headline families; at the branch pin `a91d3aafa` that list is correct (no flag, Bott–Samelson, Schubert, LS-path, Demazure, analytic-space or flag-K-ring carrier exists there: a recursive grep for `Schubert`, `LSPath`, `demazure`, `AnalyticSpace`, `FlagVariety` returns no file). At main's pin the S4 line is no longer true, which is R03.

**Repair check of the previous round.** The 203 changed lines are: a Scope paragraph on Picard groups (lines 23–31), a new From Tau Ceti paragraph pair (75–115) replacing RootSystems citations by native names, the `(Sk.n)` ids on every target heading, and six rewritten `*Needs:*` lines (404, 420, 565, 635, 675, 692, 713, 735, 756, 1288) plus two Dependencies sentences (444, 786). No RootSystems citation remains (grep: 0 hits), so the earlier upward edge to RootSystems is gone; the new edge is R01.

**Depcheck output** (brief's command, `--movable`):

    UPWARD: SchubertGeometry (on main) -> IndexTheory (#10) at README lines [1255, 1370]
    depcheck: 239 roadmaps, 2429 edges, 1 problem(s)

**Pinned declarations opened** (branch pin: Mathlib `6b7abb3c`, Tau Ceti `a91d3aafa`; main's Tau Ceti `2fd255d9` where noted).

| Declaration | File and line at the pin | What it says; consequence |
|---|---|---|
| `RootPairing`, `RootDatum` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean:81, :111` | `RootDatum` is the abbreviation `RootPairing ι ℤ X₁ X₂`; README's “Mathlib `RootDatum`” is right |
| `RootPairing.Base` | `Base.lean:68` | support, linear independence of simple roots and coroots, every root or its negative in the closure; no spanning, as the README says |
| `RootPairing.weylGroup` | `WeylGroup.lean:55` | subgroup of `Aut P` generated by reflections |
| `Module.Grassmannian`, `Module.Basis.flag` | `RingTheory/Grassmannian.lean:66`, `LinearAlgebra/Basis/Flag.lean:37` | a submodule with projective quotient; a basis flag; no scheme |
| `Matrix.J`, `SymplecticGroup.mem_iff'` | `LinearAlgebra/SymplecticGroup.lean:58, :185` | blocks 0,−1,1,0; `Aᵀ * J * A = J`, as cited in S1.5 |
| `Convex.sum_mem`, `subset_convexHull`, `convex_convexHull` | `Analysis/Convex/Combination.lean:213`, `Hull.lean:49, :52` | as cited in S4.3 |
| `CoxeterSystem.strongExchange`, `exchangeCondition`, `deletionCondition` | `TauCeti/GroupTheory/Coxeter/StrongExchange.lean:413, :434, :463` | arbitrary word with a left inversion; reduced word with a left descent, shortened word reduced; non-reduced word loses two letters: exactly the README's three glosses |
| `TauCeti.matsumoto`, `braidEquivalent_of_isReduced_wordProd_eq` | `Matsumoto.lean:138, :79` | monoid-valued `f : B → G` with braid relations gives equal products on reduced words of one element; no square relation (docstring says so); S3.4's use on `End(ℤ[M])` is the intended form |
| `CoxeterSystem.BruhatLE`, `bruhatLE_iff_exists_sublist_wordProd_eq` | `Bruhat.lean:159, :450` | reflexive–transitive closure of Bruhat steps; subword criterion for a fixed reduced word |
| `CoxeterSystem.IsMinimalCosetRep` | `Parabolic.lean:233` | `∀ v ∈ cs.parabolic J, ℓ u ≤ ℓ (u * v)`: minimal in the left coset u·W_J, as the README says; matches S4.3's W/W_λ of orbit weights uλ |
| `MinimalCosetRepCovBy`, `MinimalCosetRepChain`, `exists_minimalCosetRepChain`, `length_last_add_length`, `weylCoxeterSystem`, `length_weylCoxeterSystem_eq` | absent at `a91d3aafa`; at `2fd255d9`: `Bruhat.lean:588, :650`, `ChainProperty.lean:178, :165`, `Presentation.lean:167, :191` | R02 |
| `TauCeti.DynkinType.simplyConnectedRootDatum`, `simplyConnectedBase`, `simpleIndex` | `LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean:79, :94, :205` | `RootDatum (Fin t.numRoots) (Fin t.rank → ℤ) (Fin t.rank → ℤ)` taking `ht : t.Valid`; matches the README |
| `TauCeti.GeneralLinear.diagonalRootDatum n` | `Algebra/AlgebraicGroup/GeneralLinear/Root/Datum.lean:119` | `RootDatum (DiagonalRootIndex n) (ULift (Fin n) →₀ ℤ) (ULift (Fin n) → ℤ)`, the coordinate datum; the central character e₁+⋯+eₙ lies in it, as the README says |
| `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` | `AlgebraicGeometry/Cohomology/Basic.lean:61` | abbreviation for `Sheaf.H` after forgetting the module structure; no coherence or vanishing inside |
| `SheafOfModules.isInvertible`, `InvertibleSheaf` | `AlgebraicGeometry/LineBundle/Basic.lean:89, :112` | rank-one predicate and full subcategory; no linearization |

**Cross-roadmap citations resolved** (main at eaf17b1 unless an open head is named).

| Citation | Where it is | Note |
|---|---|---|
| ModularCurves §0G | `ModularCurves/README.md:427` | Grassmannian parameter spaces |
| ReductiveGroups Layers 7, 7b, 7C, 8, 9, 10B | `ReductiveGroups/README.md:627, :732, :652, :1023, :1092, :1759` | 7b states the parabolic double-coset theorem; Layer 8 constructs the scheme of Borels; 10B has contravariant duality and the Steinberg module before any splitting |
| GroebnerGeometry G5 | `GroebnerGeometry/README.md:394` | straightening, SAGBI, Rees comparison |
| SchemeAndStackFoundations Layers 1–2, §§2.2, 2.6, 4.12, 5, 5.7 | lines 2044, 3232, 3309, 3437, 5613, 6535, 6987 | §2.6 has `projectiveSpace_cohomology`; §4.12 Chow's lemma; §5.7 `K_0`/`G_0` via GrothendieckEulerForms |
| StableReduction Layers 2 and 4; AlgebraicVectorBundles L2A | `StableReduction/README.md:405, :529`; `AlgebraicVectorBundles/README.md:306` | relative Proj; blowups |
| TopologicalKTheory T1.5; LieGroups Layers 6 and 8 | `TopologicalKTheory/README.md:432`; `RepresentationTheory/LieGroups/README.md:383, :428` | LieGroups' open revision #1051 keeps Layer 8 (its head line 1079) and names SchubertGeometry as a consumer, the right direction |
| ComplexKahlerGeometry K3, K4; RealAnalyticGeometry R3.2 | lines 296, 444; 728 | |
| AlgebraicTopology Stage 5 item 3; MorseTheory M2; CharacteristicClasses C5, C5a; ReflectionInvariantTheory §§1–3 | lines 849 (item 3 is the finite-cover transfer); 144; 1344, 1420; 7–40 | |
| HamiltonianReduction R2a | `SymplecticGeometry/HamiltonianReduction/README.md:157` | |
| IndexTheory I8 | open head #1077 ce2d41a, line 902 | statement matches S9.2's interface word for word (Atiyah–Bott II, Theorem 4.12); direction is R01 |
| GeometricQuantization §§3.3–3.4 (Scope, Downstream) | open head #1186 663f762, lines 624, 680 | §3.3 owns the ordinary holomorphic Picard group and cites SchubertGeometry S9.1/S9.7 as its supplier; consistent with the new Scope paragraph |
| TensorProductCombinatorics §8.3, Layer 6 (Downstream) | open head #1107 ae3c4ba, lines 2277, 1707 | consumes S4.1 and S9.5 |

**Ownership.** The three objects moved down into S1.0/S1.1, S5.6 and S9.0 (relative parabolic quotients, integral Schubert closures, analytic spaces with proper coherent GAGA) are also constructed at the heads of ShimuraData #1038, AlgebraicModuliForArithmeticGeometry #853 and ComplexComparisonPartII #848 (106 GAGA hits at its head); the previous two reviews recorded that this roadmap, being on main, cannot cite them and that their reviews must re-point, so it is not raised again. `roadmaps grep` for “Bott–Samelson”, “Littelmann|LS path”, “Frobenius split”, “standard monomial”, “holomorphic Lefschetz|Atiyah–Bott”, “Pittie” finds no other roadmap owning Bott–Samelson schemes, LS paths, Schubert splitting or the Pittie–Steinberg presentation (Demazure hits in GeometricSatake and HeckeStacks are Demazure–Satake lattices, a different object). `Suggested.lean` declares no name, so no fully qualified name can collide.

**Headline theorems.** Relative flag/Schubert incidence; all-word image and derived pushforward; Demazure and Weyl character formulas; LS components, characters and tensor rule; splitting, normality and vanishing; all-degree standard monomials; Chevalley formula and cycle comparison; flag K-ring presentation; proper coherent GAGA; holomorphic Lefschetz and moment–Morse comparisons. At the branch pin none is statable and the docstring says so correctly. The Pittie–Steinberg freeness of ℤ[X] over ℤ[X]^W for a simply connected derived group is statable on Mathlib's `RootDatum` but the README treats it as an input (S8.2, Steinberg1975 Theorem 2.2), not a headline; no finding. The S4 headlines that become statable at main's pin are part of R03.

**Sources read for the seeded sample** (cache ids are those of the worker's sources cache; the README's own “LLM line 251/324” and “CFL line 188/960” locators match the Cambridge extraction 891f80d5 and cb33fd65).

| Target | Locator read | Verified |
|---|---|---|
| S1.5 symplectic flags | no source cited; Mathlib `Matrix.J`, `mem_iff'` | all displayed block identities recomputed (table below) |
| S2.2 word schemes | LLM (891f80d5 / 11918f6a) §1.4, pp. 300–301, lines 294–327; KnutsonBottSamelson 80eac6da §1 lines 10–31, §2 lines 32–66 | contracted product (P_{i₁}×⋯×P_{i_r})/Bʳ, point for the empty word, iterated ℙ¹ crank; the handout's right crank is the fibre product over G/P_α |
| S3.1 associated lines | BrionFlags 88c50482 §1.4, lines 643–654 (p. 17) | globally generated iff dominant, ample iff regular dominant; the B⁻-eigenline of H⁰(λ) has character −λ, matching the README's sign convention |
| S3.3 signed strings | KnutsonDemazure 2002228c pp. 1–4, lines 10–146 | d_α p=(p−α r_α p)/(1−α) at line 85–88 is the README's Δ_i; the SL₂ string at line 136–138; §4.0.2 is λ=2ω₁+5ω₂ with word (12)(23)(12) |
| S3.5 highest-line embeddings | none cited | R04 |
| S5.1 Frobenius trace | Ramanathan1987 b68f1ecc Definition 1.1 line 193 (p. 65), §1.16 line 360 (p. 70), Lemmas 1.18–1.19 lines 392–406 (p. 71) | Hom(F_*O,O)≅F_*(K^{1−p}) by duality; the one-variable trace kills t^i for i<p−1 and sends t^{p−1} to 1 |
| S5.2 compatible ideals | Definition 1.1(b–c) lines 196–200, Proposition 1.4 line 231 (p. 66), Theorem 3.5(i) line 799 (pp. 82–83) | σ(F_*I)=I; simultaneous compatible (p−1)D-splitting of all Schubert varieties via the resolution of w₀ |
| S6.2 determinant sections | GroebnerGeometry G5 (roadmap) | on main, line 394 |
| S7.1 divisor valuations | BrionFlags Proposition 1.4.5, lines 667–683 (pp. 17–18) | div(p_{wλ}|X_w)=Σ(λ_i−λ_j)X_{w s_{ij}} over Schubert divisors; equals ⟨λ,β∨⟩ for β=ε_i−ε_j |
| S7.2 boundary multiplicities | none cited | R04; Cartier/Weil facts recomputed below |
| S7.3 cycle comparison | BrionFlags §1.3, lines 398–437 (pp. 11–12) | Schubert classes a basis, torsion-free; the dimension misprint at line 418 is in Source issues |
| S9.0 analytification and GAGA | SGA1 8e64218d XII Théorème 1.1 line 9399 (p. 239), Proposition 1.3.1 line 9479 (p. 241), Théorème 4.2 line 9738 (p. 248), Corollaire 4.3 line 9801, Théorème 4.4 line 9805 (pp. 249–250); SerreGAGA 9898f985 §12 Théorèmes 1–3 lines 735–749 (printed pp. 19–20) | locally finite type, flat local maps with isomorphic completions, exact faithful analytification, proper exchange isomorphism, equivalence of coherent categories for proper X |
| S9.1 flag specialization | same SGA1 locators | specialization of XII.1.1 and XII.4.2 |
| S9.5, S9.8 | deductions from S4 and S3.1/S9.1; no source needed | — |
| S4.3 (bond condition, not in the sample but central to R03) | CFL cb33fd65 Definition 2.1 line 188 (p. 4), §7.1 lines 941–962 (p. 18) | b_λ(σ,σ′)=(σλ,β∨) on the lower element; gcd condition on maximal chains |
| S1.0 | ConradReductive 1a63a17e Theorem 2.3.6 line 2993 (pp. 72–73), Theorem 5.1.13 line 6011 (p. 143) | quotient represented, ample det(Lie H)*, big cell |
| S9.6 | KnutsonSymplectic 16a6f660 §4 lines 131–141 (p. 4) | K/N(T) has trivial rational cohomology; SU(2) exercise |

**Adversarial table.** Each row gives values I computed this round (scripts in the job's scratch directory for S3.6, the Gr(2,4) counts over 𝔽₂ and the symplectic block laws; the rest by hand).

| Statement | Instances | Values computed on both sides / wrong model | Result |
|---|---|---|---|
| S1.5 Gram matrix CᵀQ_srcC=J_(r,s) | m=2, r=s=1, columns (u₁;u₂,f₂;f₁) | matrix product equals [[0,0,1],[0,J₀,0],[−1,0,0]] exactly | pass |
| S1.5 unipotent condition | r=2, s=0 | Z symmetric: u(Z)ᵀJu(Z)=J; Z=[[1,2],[0,3]]: fails | pass; the condition Z−Zᵀ=YᵀJ₀Y is necessary |
| S1.5 multiplication, inverse | Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=−2; product ((4,6),9), not 13; u(Y,Z)·u(−Y,−Zᵀ)=I₄ | pass |
| S1.5 conjugation | A=[2], D=[[1,1],[0,1]]∈Sp(J₀) | l u l⁻¹ = u(DYAᵀ, AZAᵀ); the model u(DY, AZAᵀ) differs | pass |
| S1.5 dimensions | m=2 | isotropic ranks 0,1,2 give 0,3,3; radical dims 3 (r=1) and 3 (r=2); 10−7=3 both | pass |
| S1.0 cell count | GL₃/𝔽₂ | 1+2+2+4+4+8=21=168/8; partial flag 1+2+4=7 | pass |
| S3.3 D_i strings | m=0,−1,−2 | eλ; 0; −e^{λ+α}: localization (eλ−e^{λ+α})/(1−e^{−α})=−e^{λ+α} | pass |
| S3.3 Δ_i strings | m≤0, m=1, m≥2 | (1−x^{1−m})/(1−x) gives Σ_{j=0}^{−m}x^j; 0; −Σ_{j=1}^{m−1}x^{−j} with x=e^α | pass; the displayed three cases are the correct expansion |
| S3.3 inversion conjugacy | pairing −m under ι | ιD_iι(eλ)=ι(Σ_{j=0}^{−m}e^{−λ−jα})=Σe^{λ+jα}=Δ_i(eλ) | pass |
| S3.3 numerator law | N=p−x s_i p | s_i N=s_i p−x⁻¹p=−x⁻¹N | pass |
| S3.6 word 121 | λ=(7,5,0) from (0,5,7) | augmentations 1,6,33,81; χ₁, χ₂ multiplicity-free; χ₃ = the formula 1+min{2,a,b,c,7−a,7−b,7−c} on 46 weights, histogram 21/15/10, (4,4,4)↦3, (9,3,0)↦0 | pass |
| S3.6 word 212 | same | augmentations 1,3,21,81; ψ₃=χ₃; Δ₁χ₃=Δ₂χ₃=χ₃ | pass |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0, u≥w≥v | 81 patterns; multiplicities equal χ₃ coefficientwise | pass |
| S3.6 numerator identity | steps Δ₁χ₂, Δ₂ψ₂, Δ₁χ₀ | (1−e^{α_i})Δ_iχ = χ−e^{α_i}s_iχ holds exactly | pass |
| S3.4 word independence via `matsumoto` | f(i)=D_i in End(ℤ[M]) | braid relations ⇒ equal products on reduced words; no D_i²=D_i needed | pass |
| S4.3 a-chain test | bond 2 | 2·(1/2)=1 integral; 2·(1/3)=2/3 not; q=2∣2, q=3∤2 | pass |
| S4.3 empty chain | u=v | gcd of no bonds 0; every q>0 divides 0 | pass |
| S4.3 central path | λ central ≠0 | π(1/2)=λ/2∈(1/2)Conv{λ}, ∉{λ} | pass |
| S4.3 bond convention vs CFL | σ′=s_βσ>σ | CFL b(σ,σ′)=(σλ,β∨)>0 with σ the lower element; README b_λ(x,y)=⟨yλ,β∨⟩ with y lower | agree |
| S7.1 covers | GL₃, λ=ω₁, w=s₁s₂ | v=s₁: β=α₂, ⟨ε₁,α₂∨⟩=0, both weights ε₂; v=s₂: β=α₁+α₂, coefficient 1 | pass |
| S7.1 non-cover projection | w=s₂s₁ | v=s₂: β=α₁, coefficient 1, ε₃>ε₁ with ε₂ between; v=s₁: ε₃>ε₂ cover, bond −⟨ε₃,α₂∨⟩=1 | pass |
| S7.1 λ=ρ | (2,1,0), w=s₁s₂ | ⟨ρ,α₂∨⟩=1, ⟨ρ,(α₁+α₂)∨⟩=2 | pass |
| S7.1 vs Brion 1.4.5 | β=ε_i−ε_j | λ_i−λ_j=⟨λ,β∨⟩ | agree |
| S7.2 cone over 𝔽₂ | Gr(2,4) Plücker points | 35 points; p₃₄=0 gives 19; p₂₄=0 on the cone gives 11=7+7−3; X_(2) and X_(1,1) have 7 each, meeting in 3; p₁₃p₂₄=p₁₄p₂₃ on all 19 | pass |
| S7.2 dimensions | pivots (2,4), (1,4), (2,3), (1,3) | 3, 2, 2, 1 = 4−|λ| for λ=(1,0),(2,0),(1,1),(2,1) | pass |
| S7.2 ℙ¹ | O(m), m=0,1,2 | multiplicity 0,1,2; λ=0 empty divisor | pass |
| S8.2 | SL₂ | ℤ[z,z⁻¹]/(z+z⁻¹−2)=ℤ[z]/(z−1)², rank 2; (1−t)²=0 | pass |
| S8.4 | PGL₂ | [O(2)]=(1+u)²=1+2u; image ℤ+2ℤu misses u | pass |
| S9.3 | z=2, L(1) | 2/(1−1/4)=8/3, (1/2)/(1−4)=−1/6, sum 5/2=z+z⁻¹ | pass |
| S9.0 base change | class t over ℂ[t] | [A→A] by t: H⁰=0, H¹=A/(t); at t=0 H⁰=ℂ | pass |
| S9.6 | SU₂, SU₃ | ℝP²: H⁰=ℤ, H²=ℤ/2; χ=2/2=1 and 6/6=1 | pass |
| S9.2 interface vs I8 | hypotheses | same manifold, isolated-fixed-point, det≠0 and bundle-map hypotheses; same formula | agree (direction is R01) |
| Scope Picard paragraph vs S3.1, GQ §3.3 | — | S3.1's forgetful map is to Pic of the scheme; GQ head §3.3 owns the holomorphic Picard group of K/H and cites S9.1/S9.7 | consistent |

## Not verifiable

- Steinberg1975, *On a theorem of Pittie*, Topology 14: no legal text in the cache (the only Steinberg file is the 1985 Pacific J. paper) and the publisher copy is paywalled; cited by locator (Theorem 2.2, Remark 2.3), uncertified. Pittie1972 likewise.
- Jantzen, *Representations of Algebraic Groups*, Part II, Chapter 14: locator only, no legal copy read.
- Littelmann1995 (08b256fd, OCR of the author's scan) and MerkurjevEquivariant (e7fc6970) were not re-read this round; the previous review's readings stand.
- KnutsonBottSamelson §§4–6 and KnutsonBorelWeil were not re-read this round (not in the sample).
- Ownership against open pull requests whose files the brief does not supply was checked only through `roadmaps grep` snippets.

## Source issues

- **Misprint** in BrionFlags at §1.3, printed p. 11 (line 418): the source says each component of an intersection has dimension at least the sum of the two dimensions; it should be that sum minus the ambient dimension; affects a stated result.
- **Misprint** in Ramanathan1987 at Theorem 3.7 proof, printed p. 84 (line 908): the source says to apply Theorem 3.6(i); it should be Theorem 3.5(i); affects nothing.
- **Misprint** in SGA1 at Exposé XII, Proposition 1.3.1, retyped printed p. 241 (line 9479): the source says the input is an O_{X^an}-module; it should be an O_X-module; affects nothing.
- **Misprint** in KnutsonDemazure at §1, printed p. 1 (line 12–13): the source says degree-k Čech cochains live on k-fold intersections; it should be (k+1)-fold, degree 0 on the cover's members; affects a stated result.
- **Misprint** in KnutsonDemazure at §1 Riemann–Roch, printed p. 1 (line 33): the source calls a section with poles holomorphic; it should be meromorphic; affects nothing.
- **Error** in KnutsonDemazure at §2, printed p. 2 (line 54): the source says isolated fixed points make the denominator det(1−t|T_mM) nonzero; it should require a generic t outside the tangent-weight kernels; affects a stated result.
