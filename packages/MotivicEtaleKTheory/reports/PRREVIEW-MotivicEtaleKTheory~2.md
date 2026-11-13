# Review of MotivicEtaleKTheory (pull request #1470 at 8d34493)

**Verdict:** needs changes

Incremental re-review of the 61 lines changed since 83b84df. Both previous findings are repaired; the rewritten §7.1 introduces the two findings below.

## R01 (P2) — §7.1 proves the divisor condition for schemes only; the supplier requires it on simplicial divisors

**Location:** `TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 654: "This section proves the two conditions of §7.3a for this theory. … For a smooth divisor ι:D→Y in 𝒱, let ι_* be the inverse of the purity isomorphism".

**Claim:** Gysin maps, `ι_*1=c₁(O_Y(D))` and the projection formula for a smooth divisor of one scheme establish SchemeKTheoryOperations §7.3a's divisor condition for the real Deligne theory.

**Witness:** SchemeKTheoryOperations §7.3a (README lines 2987–2989, 3053) states the condition and its Gysin criterion for simplicial divisors `D_•⊂Y_•`, says term-wise Gysin maps "need not assemble", and its Check `H²(B_•(ℤ/2)_k,Γ(0))=ℤ/2` with all terms' `H²=0` shows term-wise vanishing is insufficient. T1 uses it on `P(E″)_•⊂P(E)_•`.

**Repair:** State and prove the criterion's inputs on simplicial divisors. Replacement for the divisor passage: "For the divisor condition use §7.3a's Gysin criterion on a simplicial divisor ι:D_•→Y_• as in that condition. Since c₁ is a morphism of sheaves on 𝒱, the pair (O(D_•), canonical section) in `H¹_(D_•)(Y_•,O^×)` has a class cl(D_•)∈`H²_(D_•)(Y_•,Γ(1))` restricting in each simplicial degree to §5.2's supported class of D_p. Construct the purity morphism `Rι_*Γ(i)|_(D_•)→RΓ_(D_•)Γ(i+1)[2]` in the derived category of sheaves on Y_• (not degree by degree), restricting in each degree to the purity isomorphism below and compatible with cup product by cl(D_•); ι_* is this morphism on cohomology followed by forgetting support." Then give the construction (a chain-level Gysin map natural for the cartesian structure maps `D_p=Y_p×_(Y_q)D_q`, or a proof that the composite `fib(Γ(i)→Rι_*Γ(i)|_(D_•))→RΓ_(D_•)Γ(i+1)[2]` of restriction-fiber and cup with cl(D_•) is zero on Y_•), and prove `ι_*1=c₁(O(D_•))` from cl(D_•) directly rather than from the API bullet on T1's classes, which already presuppose the condition. Add a Check in Deligne form that term-wise vanishing does not suffice: the universal class `c₁∈H²_D(B_•𝔾_m,ℝ(1))=ℝ` is nonzero, while its restriction to every term `𝔾_m^k` is `c₁` of a trivial line bundle, hence 0.

## R02 (P3) — direction of the Gysin map in §7.1

**Location:** `TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 654: "let ι_* be the inverse of the purity isomorphism H_Dᵏ(D,ℝ(i))≃H_D,Dᵏ⁺²(Y,ℝ(i+1)), which sends 1 to §5.2’s supported class of D, followed by forgetting support".

**Claim:** ι_* is the inverse of the displayed isomorphism followed by forgetting support.

**Witness:** The displayed map runs `H_Dᵏ(D)→H_(D,D)ᵏ⁺²(Y)` (it sends 1 to the supported class); its inverse lands in `H_Dᵏ(D,ℝ(i))`, on which "forgetting support" is undefined. {0}⊂𝔸¹, k=0, i=0: inverse ends in `H⁰_D(point,ℝ(0))=ℝ`, not in `H²_D(𝔸¹,ℝ(1))=0`.

**Repair:** "let ι_* be the purity isomorphism H_Dᵏ(D,ℝ(i))→H_D,Dᵏ⁺²(Y,ℝ(i+1)), which sends 1 to §5.2’s supported class of D, followed by forgetting support" (same instance: `ℝ→H²_(D,{0})(𝔸¹,ℝ(1))=ℝ→H²_D(𝔸¹,ℝ(1))=0`, as `c₁(O(0))=0` on 𝔸¹).

## Previous findings

- R01 — repaired: line 57 now reads "Section 6.10 proves that the shared complexes … satisfy the projective bundle and divisor conditions of SchemeKTheoryOperations §7.3a … and exports the field diagonal diagonalChernMilnor"; this matches KTheoryFiniteLocalFields §6.10 at its head.
- R02 — repaired: References note now reads "the supported comparison is stated for regular quasi-projective schemes; its proof uses Theorem 2.7 over an infinite field, and §2.3 here supplies the finite-field descent".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.0b diagonal coefficient from T5–T6 | symbols of length n=1,2,3,n | T6: `c_(n,n)=−(n−1)·c_(n−1,n−1)∪c_(1,1)`; 1, −1, 2; general `(−1)^(n−1)(n−1)!` | agrees with supplier Checks and WeibelKBook line 27746 | none |
| §2.0b / §2.4 character coefficient (T8) | p=1,2,3 on symbols | `(−1)^(p−1)/(p−1)!`·`(−1)^(p−1)(p−1)!` = 1,1,1 | as stated | none |
| §2.0b target of T3 | index order (weight, K-degree) | `c_(p,n):K_n→H^(2p−n)(X,ℤ(p))=CH^p(X,n)`; supplier T3 has `K_j→H^(2i−j)(X,Γ(i))` | same convention | none |
| §2.0b 𝒱 | smooth finite type over k | supplier needs closure under smooth quasi-projective over a member; `GL_N^k×X`, `P(E)` stay in 𝒱 | admissible | none |
| §7.1 projective bundle Check | ℙ¹ over a point, i=1, k=1,2 | `H¹_D(ℙ¹,ℝ(1))=ℂ/ℝ(1)=ℝ`; `H²_D=ℝξ`; summands ℝ⊕0 and 0⊕ℝ; wrong twist gives `H⁰_D(pt,ℝ(1))=0` | as stated | none |
| §7.1 purity Check | {0}⊂𝔸¹, k=i=1 | `H¹_D(pt,ℝ(1))=ℝ`; `H²_D(𝔾_m,ℝ(2))=ℂ[dz/z]/iℝ[dz/z]=ℝ` (generator `dz/2πiz`, `ℝ(2)`·it = iℝ[dz/z]); unshifted: `H²_D(𝔾_m,ℝ(1))=0` | as stated | none |
| §7.1 c₁ on units | u=2e^(iθ), u=i | `log|u|`: log 2, 0; `−2∂∂̄log|u|=0` so a degree-one cocycle | agrees with §7.1 Checks and §7.4 | none |
| §7.1 truncation | Γ(p)[2p] | supplier T3: `τ^(≤2i)Γ(i)[2i]`, i.e. nonpositive truncation of the shift; `π_n=H^(2p−n)` | same object | none |
| §7.1 divisor condition | simplicial `D_•⊂Y_•` | README treats a divisor of one scheme; supplier requires simplicial | fails | R01 |
| §7.1 Gysin direction | {0}⊂𝔸¹, k=i=0 | inverse of displayed map ends in `H⁰_D(pt,ℝ(0))=ℝ`; forward ends in `H²_(D,{0})(𝔸¹,ℝ(1))=ℝ` | wording reversed | R02 |
| References: WeibelKBook pages | lines 27403, 27490, 27552, 27688, 27746, 27808 | printed pages 452, 454, 455, 457, 458, 459 (extraction's page markers are 8 higher) | as cited | none |
| References: BKK pages | lines 1379, 3971, 4323, 4334 | printed 38, 109, 119, 120 | as cited | none |

Rows for untouched statements stand as in the previous review, of 83b84df.

- Source locators read at the text: 10 (WeibelKBook line 27403, 27490, 27552, 27681–27700, 27746; BKK line 1379–1383, 3965–3990, 4323, 4334–4340); each supports the statement it is cited for. BKK's site (line 4319–4320) holds separated schemes only, which the README's "on each separated member U" accounts for.
- Supplier citations resolved at open heads: SchemeKTheoryOperations §7.3a (theory, two conditions, Gysin criterion, T1–T3, T5, T6, T8 as the contract words them; its Scope paragraph names this roadmap's §§2.0b and 7.1 as the motivic-operation and Deligne instances); KTheoryFiniteLocalFields §6.10 (proves both conditions on smooth finite-type F-schemes, exports `diagonalChernMilnor`).
- Library declaration opened: `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` (TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110).
- Gate at 8d34493: every check 0, `OK`. Dependency check: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: SchemeKTheoryOperations 37, KTheoryFiniteLocalFields 90, MotivesAndAlgebraicCycles 91, this roadmap 138.
- `lake env lean` on `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean`: exit 0, no output. The file still declares nothing; the two changed docstring bullets name the missing carriers. No `#check @name` comparison applies.
- Outside-folder diff against `origin/main`: empty. Pull request title and description read against this head: no sentence contradicted; no supplier, section or declaration added or dropped by the change (SchemeKTheoryOperations was already a listed supplier).
- Overlap check: read SchemeKTheoryOperations, KTheoryFiniteLocalFields, MotivesAndAlgebraicCycles (scope and the cited sections); Polylogarithms and BorelRegulators as in the previous review. Chern classes of a theory: owner SchemeKTheoryOperations §7.3a. Conditions for the motivic theory: KTheoryFiniteLocalFields §6.10. Conditions for real Deligne cohomology: this roadmap §7.1; no other open roadmap states them.
- Source independence: changed passages only; 6 passages compared with 2 sources (WeibelKBook, BKK), none shared; largest share BF, 74 of 223 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Bloch86 §7 and Beilinson85 §§1–2: uncertified in the manifest, cited by locator only.
- Levine98: waived; certifies nothing here.
- The sources SchemeKTheoryOperations §7.3a cites for the simplicial divisor condition (Schneider, Jannsen) are that roadmap's; they were not read here.

## Source issues

- none

## For the human reviewers

- none
