# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at 91eac5a)
**Verdict:** needs changes

The mathematical counterexamples below do not depend on the unavailable references. Locations abbreviated `README` and `Lean` mean `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md` and `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/Suggested.lean`.

## R01 (P1) — The endpoint convention is an antihomomorphism

**Location:** README:286–292, 643–651: “the lift of `γ` from `x₀` ends at `μ(γ) • x₀`”.
**Claim:** This defines `μ : FundamentalGroup Y y₀ →* G` for a left deck action.
**Witness:** Mathlib `Topology/Homotopy/Lifting.lean:627` defines precisely this endpoint map into `Gᵐᵒᵖ`. For endpoint labels `(12),(23)`, the label of the Mathlib product is `(132)`, whereas their product in `G` is `(123)`.
**Repair:** Use the opposite fundamental group for this endpoint rule, or compose the opposite-valued map with inversion and change the generator/rotation conventions accordingly. Specify the standard-loop relation in the chosen group. With the opposite domain, the tested product has endpoint `(123)=(12)(23)`. Recheck 2.4 and 7.2 together: the two `S₃` products must agree, and the `C₅` differential multiplicities must still match the actual action. BelyiMaps 6.1 concerns permutations of a fibre; it does not identify those permutations with left deck transformations.

## R02 (P1) — A generating vector does not retain the complex structure

**Location:** README:630–637, 681–689: “`GenVector.toAction (GenVector.ofAction X)` is `G`-equivariantly biholomorphic to `X`”.
**Claim:** A realization chosen from the signature alone is an analytic inverse for every action.
**Witness:** `C₂,(0;2⁶)` has one generating vector, but its family has dimension `3`. In particular, genus-two curves with full automorphism groups of orders `10` and `48` cannot be biholomorphic.
**Repair:** Parameterize realization by a marked complex quotient/orbifold or a Teichmüller point. With that datum retained, state the analytic inverse theorem; with only the vector, state topological compatibility. The one vector then has a three-dimensional family of realizations instead of identifying every genus-two curve. Also replace the unspecified `m_j / gcd` in 2.6 by the exact double-coset stabilizer formula `|K ∩ x⟨c_j⟩x⁻¹|`, with the quotient-genus formula and discarded order-one entries.

## R03 (P1) — The braid relation fails to quotient simultaneous conjugation

**Location:** README:715–728, 768–773: “`... ∧ v.a = w.a ∧ v.b = w.b`”.
**Claim:** These braid classes coarsen simultaneous-conjugacy classes and satisfy `numBraidClasses ≤ numInnClasses`; the transformed branch tuple has product one.
**Witness:** For `S₃,(2;∅)`, direct enumeration gives `360` generating vectors and `60` inner classes. The written braid relation is equality, so it gives `360` braid classes: `360 ≤ 60` is false.
**Repair:** Conjugate the handle entries by the same `g` as the branch entries. Preserve the branch product, which is the inverse handle-commutator product, rather than asserting it is one. Test `(1;3)` with `a=(12), b=(23), c=(123)`: `[a,b]=(132)`, `c≠1`, but `[a,b]c=1`. On the unramified example the repaired braid quotient has `60` classes. State and prove the geometric comparison for this repaired relation.

## R04 (P1) — Special extensions do not rule out generic fullness

**Location:** README:856–873, 923–928: “generically full iff no overgroup datum … extends it”.
**Claim:** Existence of any topological extension decides the generic full group and its certificate.
**Witness:** The hyperelliptic `C₂,(0;2⁶)` action extends to `C₁₀,(0;2,5,10)` on `y²=x⁵−1`. The respective family dimensions are `3` and `0`; the `C₂` family is nevertheless generically full, as README:1127 itself requires.
**Repair:** Separate occurrence of an extension at a point from extension over the whole generic family. Require the appropriate dominance/equal-Teichmüller-dimension condition and prove it for each listed inclusion. Restrict maximality and certificate uniqueness to those generic extensions. The index-five extension above must be allowed at its special curve and rejected as a generic extension of the three-dimensional family.

## R05 (P1) — Sorting a noncommutative branch tuple destroys its relation

**Location:** README:478–482: “drops … and sorts”.
**Claim:** Sorting the projected entries by order produces a generating vector.
**Witness:** In `S₃×C₃`, let `a=(12), b=(23), z=(132)`. The vector `((b,0),(z,2),(1,2),(a,2),(b,1),(b,2))` has orders `(2,3,3,6,6,6)`, product `1`, and generates the group.
**Repair:** Reorder by specified Hurwitz moves, including their conjugations, and prove independence at the intended equivalence level; do not simply permute entries. Under projection to `S₃`, deletion gives `(b,z,a,b,b)` with product `1`; stable order-sorting gives `(b,a,b,b,z)` with product `(123)`. The resulting signature `(0;2,2,2,2,3)` is hyperbolic (`μ=2/3`), so the existing domain restriction does not exclude the counterexample. A Hurwitz move instead of the offending plain swap preserves product `1` and generation.

## R06 (P1) — The trivial group refutes the branch bound and quotient-genus claim

**Location:** README:574–577, 784–785, 795–797, 839–841.
**Claim:** Every action satisfies `r ≤ 2g+2−4h`, and `g0=genus X` never occurs for `g≥2`.
**Witness:** The faithful trivial-group action on a genus-two surface has `h=g=2`, `r=0`, `μ=2`. The asserted inequality becomes `0≤−2`, while `g0=genus X` holds.
**Repair:** Keep the trivial group in the library. State `h=g` iff `G` is trivial; assume `|G|≥2` for the displayed branch bound. In general retain `r ≤ 4(g−1)/|G|−4h+4`. This evaluates to `0≤0` for the example. Handle the trivial case separately in the dimension and finiteness deductions.

## R07 (P1) — Numerical Riemann–Hurwitz data do not imply the Wiman period bound

**Location:** README:836–843.
**Claim:** Hyperbolicity and `genusOfOrder σ n=g` alone imply `m_j≤4g+2` for every period.
**Witness:** `n=15, σ=(0;2,3,30)` has `μ=2/15` and rational genus `1+15(2/15)/2=2`, but `30>10`. There is no corresponding order-15 generating vector: an element cannot have order `30`.
**Repair:** State the action bounds on realized data `(G,σ,v)`, including nontriviality where R06 requires it. If retaining the larger numerical finiteness theorem, give a separate proof and appropriate numerical bounds, without invoking nonexistent `c_j`. The displayed counterexample is excluded from the realized-data theorem, while `C₁₀,(0;2,5,10)` attains the correct bound.

## R08 (P1) — A non-full group may already contain the hyperelliptic involution

**Location:** README:321–325, 958–965.
**Claim:** Testing `G` and the generic full group gives the same answer; absence of the hyperelliptic involution is equivalent to non-fullness.
**Witness:** For `C₄,(0;2,2,4,4)`, vector `(2,2,1,3)` has genus `2`. Its involution fixes `4(1/2+1/2+1/4+1/4)=6` points and is already in `G`, although the action extends generically by index two.
**Repair:** Retain only the implication “hyperelliptic involution absent from `G` ⇒ action not full”, and distinguish the predicate on `G` from that on the generic full group. The README's `C₂,(1;2,2)` example gives the opposite discrepancy: `2≠6` fixed points in `G`, despite a hyperelliptic surface. Replace `hypInvolution v : G` when no such element exists by an option/subtype or an explicitly conditional construction; similarly handle the trigonal witness.

## R09 (P1) — A refined passport does not determine the topological class

**Location:** README:1073–1089, especially “every field except `gen_vectors` and `braidClass` an invariant of the refined passport's `Aut(G)`-orbit”.
**Claim:** In particular, `topClass` is determined by that passport orbit.
**Witness:** For `G=C₂²`, `σ=(2;∅)`, both `(a₁,b₁,a₂,b₂)=(x,y,0,0)` and `(x,0,y,0)` generate `G`. Their passports are empty; their pushed-forward fundamental classes are respectively `x∧y≠0` and `0` in `H₂(G,ℤ)=C₂`.
**Repair:** Assign each field only the equivalence relation under which it descends. These genus-five actions are not topologically equivalent: mapping classes preserve the fundamental class and automorphisms of `C₂²` preserve zero/nonzero. Remove the claim that passport orbits determine `topClass`. In 8.1 restrict the non-equivalence assertion to different **family** prefixes; different refined prefixes may be topologically equivalent, as the Klein-quartic example already shows.

## R10 (P1) — Labelled fixed-point functions and characters are equivariant, not invariant

**Location:** README:947–950, 1049–1051.
**Claim:** `#Fix(γ)` for a fixed element and `χ_Ω` as a character of the fixed abstract group depend only on topological equivalence, which allows `Aut(G)`.
**Witness:** For `C₃²` and `(x,x,x²,x²,y,y²)`, the fixed-point counts are `12` at `x` and `6` at `y`. Exchanging `x,y` is an allowed group automorphism and changes the count at `x` from `12` to `6`.
**Repair:** State `FixCount(α·v,α(γ))=FixCount(v,γ)` and the corresponding pullback law for characters. On `C₅,(1,1,3)`, multiplicities `(m₁,m₂,m₃,m₄)=(0,0,1,1)` become `(1,0,1,0)` after scaling the vector by `2`. The **unlabelled** decomposition multiset can still be invariant because the rational constituents are permuted; prove that consequence of equivariance.

## R11 (P1) — The punctured mapping-class supplier explicitly excludes the required theory

**Location:** README:737–748, 753–765.
**Claim:** SurfaceTopology Layer 9 supplies punctured/marked mapping class groups, half-twists and their action on generating systems.
**Witness:** `TauCetiRoadmap/SurfaceTopology/README.md:1608` in the indexed supplier explicitly excludes punctured surfaces and mapping class groups with marked points. Layer 9's closed-surface Dehn-twist theory cannot supply the stated half-twist action.
**Repair:** Give these precise prerequisites an actual owner and contract: marked surfaces with cone-order colours, half-twists, the outer action, its descent to inner classes, and the sphere braid comparison. A full uncoloured mapping class group cannot act on a fixed ordered signature: exchanging orders `2` and `3` changes that signature. For `(0;2,3,7)`, use the colour-preserving action or a groupoid over reordered signatures; account for the basepoint/inner-automorphism ambiguity instead of asserting an action of `Out(Γ)` on raw `Hom(Γ,G)`. This is an undeclared supplier gap, not a request to implement a supplier immediately.

## R12 (P1) — ComplexTori does not supply the analytic Jacobian comparison

**Location:** README:168–171, 1016–1022.
**Claim:** ComplexTori Milestone 1 supplies `H⁰(X,Ω)^∨/H₁(X,ℤ)` and its comparison with the algebraic Jacobian.
**Witness:** `TauCetiRoadmap/ComplexTori/README.md:130–152` starts with an already supplied full lattice. It constructs the torus and its homology; it never constructs the period lattice of a curve or identifies that torus with its Jacobian.
**Repair:** Name an earlier owner's exact period-lattice/Abel–Jacobi comparison theorem, or declare the precise missing contract. Include equivariance and the rational homology comparison needed by 7.3. In genus two the required result identifies a rank-four integral lattice in a two-dimensional complex dual; a generic torus with an arbitrary lattice is not that comparison. JacobianChallenge D–F supplies the algebraic Jacobian but does not fill this analytic step merely by citation.

## R13 (P1) — Supplier contracts cite unavailable sections and unpinned modules

**Location:** README:122–137, 154–158, 791–798, 867–873.
**Claim:** FuchsianOrbifolds “4a” and TeichmullerGeometry “T6, T7, T9” provide the minimum area, fixed-locus orbifold identification, and generic maximality outside Singerman's list.
**Witness:** The checked main FuchsianOrbifolds has no Layer 4a. TeichmullerGeometry's supplied head has §§5.6, 8.4, 10.1, 10.4 instead; §10.4 treats closed genus-`≥3` surface groups, not arbitrary cone signatures.
**Repair:** Repoint the minimum area to TeichmullerGeometry §10.1 and stabilizers/dimension to §§5.6/8.4. Do not infer the global orbifold Teichmüller identification or the all-signature Singerman genericity theorem from its closed-surface maximality result; own those additional targets here or declare exact supplier gaps. Check `(0;2⁶)` and `(0;2,3,7)` explicitly: neither is the unramified genus-`≥3` input of §10.4. The mechanical dependency check passes because it does not validate these statements inside suppliers. The six modules cited separately as “Tau Ceti main” in lines 122–128 are all absent at the pin, including `Automorphism/HigherGenus.lean`; `finite_algEquiv_of_two_le_genus` is absent too. Replace those unpinned-library contracts with the exact earlier roadmap targets, such as AlgebraicCurves Layer 11 for finiteness, and BelyiMaps/FuchsianOrbifolds for the analytic inputs.

## R14 (P1) — The recorded build gate is failing

**Location:** Lean:1; worker gate at the reviewed head, rule `build`.
**Claim:** The acceptance test must pass with only `sorry` warnings.
**Witness:** The worker records `build=1 FAIL`: importing Mathlib emits the module-system warning requesting a `module` header. Independent direct elaboration succeeds with 18 `sorry` warnings; this is a gate failure, not a Lean type error.
**Repair:** Adopt the module header required by the pinned build, preserving the allowed imports, and rerun the targeted build/gate. A scratch copy with `module` was elaborated as a repair probe; see verification below. No acceptance while the recorded gate remains red.

## R15 (P2) — Generation does not imply transitivity in an arbitrary permutation representation

**Location:** README:490–492; Lean:246–256.
**Claim:** Every triangle generating vector in a permutation subgroup gives a connected permutation triple.
**Witness:** Embed `C₁₀` as a regular action on ten letters plus one fixed letter. Vector `(5,2,3)` still generates it and has orders `(2,5,10)`, but the triple has two orbits of sizes `10` and `1`.
**Repair:** Require a nonempty transitive permutation action for the connectedness assertion. Keep the construction of an unconditionally valid permutation triple separately. The regular ten-letter action passes; adding the fixed letter must fail the connectedness hypothesis. Tau Ceti `PermutationTriple.IsConnected` explicitly requires both nonzero degree and pretransitivity.

## R16 (P2) — State the actual extension conditions for every row

**Location:** README:909–920.
**Claim:** Each normal inclusion is characterized by one automorphism of order dividing the index, with a sample `θ(c₁)=c₂` for `(1;t,t)`.
**Witness:** `bujalance` lines 247–249 give the N2 image of `x` as `(ab)⁻¹x⁻¹(ba)`; lines 273–282 require two involutions for N4; lines 312–320 require automorphisms of orders three and two for N7.
**Repair:** Write all row conditions, the generator dictionary and compatibility equations, without the ellipsis or a substitute finite-search specification. N4 has quotient `C₂²`, not `C₄`; N7 has the order-three cycle and order-two permutation, not one cyclic order-six datum. Check both transformations on generators and their products. The single swap does describe the N8 test after the source's generator dictionary, but it does not specify the other seven cases. The source locators are §3, pp.1541–1544, and §4, pp.1544–1551. Also replace 5.3’s false proof-route constraints: N1 has six target periods versus zero source periods, and T1 introduces periods 2 and 3, neither dividing 7. Use the actual equal-dimension Fuchsian-inclusion classification and the correct subgroup cycle-length conditions; the Riemann–Hurwitz equality alone does not classify inclusions.

## R17 (P2) — The Lean file substitutes arithmetic checks for unstated headlines

**Location:** Lean:10–20, 348–384, 438–445; README:71–102.
**Claim:** The file states the statable headlines and names the others with their missing carriers.
**Witness:** `GenVector G σ` and `SurfaceKernelHom G σ` are already real types, so their central correspondence is statable. Conversely, `IsSingermanPair.mu_eq` only checks arithmetic of a hardcoded list; it states no inclusion or generic-fullness theorem.
**Repair:** State the generating-vector/surface-kernel correspondence on these carriers. For the geometric existence theorem, topological classification, generic-fullness/extension theorem, Macbeath equality, Eichler/Chevalley–Weil representation theorem and Jacobian isogeny/decomposition theorem, either state the actual headline or name it and its missing carrier in the module docstring. Remove `IsSingermanPair` and its arithmetic surrogate unless needed for an actual statable headline. The regular-representation Chevalley–Weil sum checks total dimension; explicitly distinguish it from the missing character formula on holomorphic differentials. Also prune definitions unused by retained headlines.

## R18 (P2) — The roadmap specifies computational searches as deliverables

**Location:** README:840–846, 916–920.
**Claim:** Complete small-genus lists are proved by executing bounded enumeration; general stored lists are certified by searching for missing entries; nonnormal extensions are decided by finite search.
**Witness:** The requested deliverables explicitly include “the list is complete iff the bounded search finds nothing else” and the “Ries-based algorithm”. These are executable search/certificate specifications, excluded by this review's mathematical-roadmap contract.
**Repair:** Retain finiteness, exact classification statements with mathematical proofs, and the full extension criteria. Remove algorithm, stored-list certification and executable-search deliverables. The existing small `C₂`, `S₃` and cyclic examples can remain mathematical Checks. Keep the 19-row inclusion theory general, rather than replacing its nonnormal part by a search.

## R19 (P2) — Database aggregate counts are not counts for a fixed signature

**Location:** README:768–773.
**Claim:** All four database columns listed there are the counts “per `(g,G,σ)`”.
**Witness:** `lmfdb` lines 213–241 (the fetched `main.py`) reads `hgcwa_unique_groups` by genus and displays counts grouped by group and the `g0_is_gt0` split; `hgcwa_complete` is read by genus alone at line 228.
**Repair:** Distinguish intrinsic counts for a fixed signature from the sums displayed in the aggregate tables, and state the precise summation indices. For `C₂` in genus two the two signatures here contribute `1` and `4` inner classes; those are different fixed-signature quantities, with total `5` when both quotient-genus regimes are included. The live knowl/table-schema details were not accessible, so certify exact column semantics against those sources before claiming finer identities.

## R20 (P3) — Delete padding and unused definition scaffolding from Suggested.lean

**Location:** Lean:114–142, 182–195, 267–285, 311–320, 404–418.
**Claim:** These declarations are needed for the headline acceptance test.
**Witness:** `hurwitzBound_functionField` is exactly one application of the pinned Hurwitz theorem. `hyperellipticGenusTwoVector_isHyperelliptic` repeats the README Check `6=2·2+2`; its two data constructors exist only to support that Check.
**Repair:** Delete them from `Suggested.lean`, keeping the statements/examples in the README. Also remove the unused `numInnClasses`, standalone analytic `Aut`/`toAut`/`IsFull`/`numFixedPointsOfAction` scaffold and the unused trigonal predicate unless a retained headline needs them; move the elementary passport-action API and `Signature.mu_triangle` comparison out of the acceptance test. Do not repair padding by proving it in place. Generic one-tactic probes of all 18 admissions are recorded below; no unsupported claim that they all close automatically is made.

## R21 (P3) — Restore the required README structure and per-definition Checks

**Location:** README:3, 44, 235, 329–376 and all nine layers; Lean:96,223,225.
**Claim:** The document supplies the required contracts, APIs, local Checks and layer dependencies.
**Witness:** There are only seven `**Checks.**` blocks for 48 numbered targets. Definitions in 0.1–0.3, 0.6, 1.1–1.2, 3.1/3.3/3.4, 5.1/5.2/5.5, 6.2–6.4 and 8.2 lack three local discriminating Checks.
**Repair:** Use the prescribed Summary, Conventions, Exact supplier contracts, How to read the build, and Downstream consumers sections; give every layer Examples and Dependencies, every definition its prose API and three discriminating Checks, and every declaration a docstring. Use the counterexamples above as negative controls. Replace non-declaration backticked target names with prose, and make the documented equivalence `GenVector.map` agree with its actual function-valued Lean type. Explicitly supply the rational-representation/Schur-index input to 7.5 from FiniteGroupInvariants §§6.2–6.5 instead of its generic “abstract invariants” boundary.

## R22 (P3) — Replace chapter-level and incorrect source locators

**Location:** README:379–381, 602–605, 983–985, 1224–1259.
**Claim:** Breuer Chapter 3 supplies the signatures/existence/holomorphic-differential development, and the appendices contain the genus-48 data; the remaining layer-wide citations locate each target.
**Witness:** The publisher's contents (`breuer` lines 18–29, 38–39, 68–70) places Fuchsian groups in §3, p.7, differentials in §7, p.25, fixed points in §10, p.35, genus-48 calculations in §20, p.84; the appendices concern different topics.
**Repair:** Give exact theorem/section and printed page at every mathematical claim, distinguishing section 3 from Chapter 3. Correct the bibliography and add the required source manifest through the author's normal workflow; this review changes no manifest. For the readable extension source use the actual N1–N8/T1–T11 locations, and cite the versions actually read for Paulhus and Lange–Recillas. Unavailable texts remain uncertified, not silently verified.


## Verified sound

This was a full read of the 48 numbered README targets and all 49 named Lean declarations, including the standing conventions, APIs and worked examples. “Pass” below means the stated instances and the indicated algebra agree; it does not certify an unread source or prove a general theorem. Counterexamples are retained in the table and linked to findings. The scope is repairable, so the verdict is **needs changes**, not rejection.

**Gate and elaboration.** The head and clean worktree were checked. The diff outside `TauCetiRoadmap/GroupActionsOnRiemannSurfaces` is empty. The worker's text, metadata, stray-file and dependency checks all return zero; its build rule fails on the module-system warning (R14). Direct `lake env lean` elaboration of the original file succeeds with exactly 18 `sorry` warnings. A separate scratch copy with a `module` header also succeeds with exactly those 18 warnings. This demonstrates a candidate repair, not a passing targeted-build gate for the unchanged PR.

The requested dependency command was run with the supplied candidate order, `--movable`, and the main content checkout. Its entire output was:

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. All 48 targets' `Rests on` clauses and the supplier list were read; the file uses that label instead of `Needs`. This order check does not repair the false supplier contracts R11–R13. No declared gap was found, and no missing placement was treated as a defect.

**Adversarial table — every numbered target.** Write `μ=2h−2+Σ(1−1/m)`, `g=1+nμ/2`, and use right-to-left composition of permutations. `C_n` vectors below are additive. An empty list has sum zero and lcm one. Periods are at least two, so the displayed rational denominators are nonzero. The real geometric assertions assume finite, faithful, holomorphic actions on compact connected complex surfaces of genus at least two; characteristic-p/inseparable and noncompact actions are outside this domain, not silently included.

| Target | Instances and computed values on both sides | Result / repair |
| --- | --- | --- |
| 0.1 Signatures, μ, genus, hyperbolicity | `(0;∅)` gives `μ=−2`; `(0;2,3,5)` gives `−1/30`; `(0;2,3,6)` gives `0`; `(0;2,3,7)` gives `1/42`; `(0;2,4,5)` gives `1/20`. For `n=168`, `1+nμ/2=3`; for `n=0`, the total function gives `1`. `(1;2)` gives `1/2`, `(2;∅)` gives `2`. | Instance checks pass |
| 0.2 Generating vectors | `C₂,(0;2⁶)`: sum `6=0 mod 2`, generated order `2`, one vector. `C₂,(0;2³)`: sum `3=1`, zero vectors. `C₄,(0;2⁴)` tuple `(2,2,2,2)` sums to `0` but generates order `2≠4`. Empty sphere tuple generates order `1`, not `2`. | Instance checks pass |
| 0.3 Transport and actions | `C₁₀` vector `(5,2,3)` under multiplication by `3` becomes `(5,6,9)`, sum `20=0`, orders `(2,5,10)` unchanged. The four units act freely on four vectors; conjugation gives four singleton orbits. `S₃` gives `12/6=2` inner classes. | R21 |
| 0.4 Presentation/universal property | `C₄` tuple `(2,2,2,2)`: all squares and total sum are `0`; homomorphism exists, image order `2`. `C₂` triple `(1,1,1)`: each square `0` but sum `1`; no homomorphism. Trivial assignment: all relators map to `1`. | Instance checks pass |
| 0.5 Surface-kernel correspondence | `C₁₀,(2,5,10)` vectors `(5,2,3),(5,4,1),(5,6,9),(5,8,7)` give four surjective assignments. The `C₄` assignment above gives `2≠4` image order; trivial assignment has order `1≠2`. | R17 |
| 0.6 Quotients | R05's `S₃×C₃` tuple projects to `(b,z,a,b,b)`, product `1`; simple sorting gives `(b,a,b,b,z)`, product `(123)`. Its target has `μ=2/3`, `n=6`, `g=3`. Projection to the trivial group deletes all branch entries. | R05 |
| 0.7 Triangle dictionary | `C₁ C₂ C₃` maps to `zyx=1`; orders `(2,3,7)` map to `(7,3,2)`. Regular `C₁₀` has one orbit of size `10`; adjoining a fixed point gives orbit sizes `10,1` while the same elements generate `C₁₀`. | R15 |
| 1.1 Actions and Aut | A faithful `C₁₀` action has image order `10`, kernel order `1`; a trivial `C₂` action has image order `1`, kernel order `2`. An elliptic curve has infinitely many translations, explaining the genus restriction on finite Aut. | Instance checks pass |
| 1.2 Stabilizers/quotient | Local model `z↦z²`: stabilizer order `2`, local degree `2`; `z↦z¹`: both `1`. Hyperelliptic `C₂`: six exceptional fibres of size `1`, ordinary fibres of size `2`, total covering degree `2`. | Instance checks pass |
| 1.3 Branch signature | For hyperelliptic `C₂`, each exceptional fibre contributes `2−1=1`, total ramification `6`. For `C₁₀`, contributions `10−5=5`, `10−2=8`, `10−1=9`, total `22`. Trivial group: zero branches, ramification `0`. | Instance checks pass |
| 1.4 Riemann–Hurwitz | `C₂`: `2g−2=2=2·1`. `C₁₀`: `2=10/5`. `S₃,(2,2,3,3)`: `2=6/3`. Trivial genus-two action: `2=1·2`, but branch bound is `0≤−2`. | R06 |
| 1.5 Differential representation | Hyperelliptic involution on genus two acts as `−I₂`: trace `−2`, invariants dimension `0=h`. Bielliptic involution: eigenvalues `1,−1`, trace `0`, invariants `1=h`. `C₅` example has inverse-pullback eigenvalues `ζ⁴,ζ³`. | Instance checks pass |
| 2.1 Fuchsian realization/torsion | `(0;2,3,7)` has area `2π/42=π/21` and elliptic orders `2,3,7`; `(2;∅)` has area `4π` and no nonidentity torsion. `(0;2,3,6)` has `μ=0`, excluded from this hyperbolic model. | Instance checks pass |
| 2.2 Torsion-free kernel | Map `Γ(0;2⁶)→C₂` sends each order-two generator to the involution, giving genus `2`. The trivial map kills an order-two generator: order drops `2→1`, kernel has torsion. For `(2;∅)→1`, order conditions are empty and kernel is torsion-free. | Instance checks pass |
| 2.3 Vector to action | Fixed Fuchsian models give `C₂,(0;2⁶)` degree `2`, quotient genus `0`, genus `2`; `S₃,(1;3)` degree `6`, quotient genus `1`, genus `1+6(2/3)/2=3`. | Instance checks pass |
| 2.4 Action to vector | Left-deck labels `(12),(23)` give endpoint label `(132)` for the Mathlib fundamental-group product, versus `(12)(23)=(123)`. In the local cyclic model a positive loop has rotation `exp(2πi/m)`. | R01 |
| 2.5 Existence criterion/integrality | `C₂,(2⁶)`: one vector, genus `2`. `A₅,(2,3,7)`: no order-seven element, zero vectors even though `μ>0`; predicted rational genus `1+60/84=12/7` is nonintegral. Trivial group `(2;∅)` gives genus `2`. | Instance checks pass |
| 2.6 Compatibility/restriction | One hyperelliptic vector has family dimension `3`, not `0`; full automorphism orders `10` and `48` distinguish realizations. Restrict `C₁₀` to `C₅`: order-two inertia disappears; order-five branch splits into two, order-ten into one, giving `(5,5,5)` and `g=2`. | R02 |
| 3.1 Refined passports | `C₁₀` gives four distinct ordered passports; `Aut(C₁₀)` puts them in one orbit. `S₃` vectors have passport `(transposition,transposition,3-cycle,3-cycle)` despite two inner classes. | Instance checks pass |
| 3.2 Frobenius/Möbius count | For the `S₃` classes `(2,2,3,3)`, prefactor `3·3·2·2/6=6`; trivial/sign character terms are `1+1`, standard term `0`, so count `12`, all generating. In `C₄` with four class entries `2`, raw count `1`, generating count `0`. | Instance checks pass |
| 3.3 Braid equivalence | `S₃,(2;∅)`: `360` vectors, `60` inner orbits, but `360` classes for the written relation. `S₃,(1;3)`: branch product `(123)`, handle product `(132)`, total `1`. | R03 |
| 3.4 Topological equivalence | Unramified `C₂²` vectors `(x,y,0,0)` and `(x,0,y,0)` both have genus `1+4·2/2=5` and empty passport; fundamental-class images `1` and `0` in `C₂` differ. | R09, R11 |
| 3.5 Braid refines topology | `C₁₀`: `4` braid classes map to `1` topological class; `C₃×C₁₅`: `192/2=96` braid classes map to `1`. | Instance checks pass |
| 3.6 Sphere classification | `C₁₀` units `(1,3,7,9)` move four vectors transitively. `C₃×C₁₅` has `192` generating triples and `192` automorphisms acting freely; quotient has `1` class. Distinct periods in the first case prevent a nontrivial period-preserving permutation. | R11 |
| 3.7 Counts | `C₂,(0;2⁶)` has `(inner,braid,top)=(1,1,1)`. `C₁₀` has `(4,4,1)`. Written unramified `S₃` gives inequality `360≤60`, false. For genus-two `C₂`, inner counts for h=0 and h=1 are `1` and `4`, total `5`. | R03, R19 |
| 4.1 Quotient genus | Trivial group on genus two: `h=g=2`. Hyperelliptic and bielliptic involutions give respectively `h=0` and `h=1`, with `r=6` and `r=2`. | R06 |
| 4.2 Dimension | Hyperelliptic `C₂`: `−3+6=3=3g−3`; bielliptic `C₂`: `3−3+2=2`; `C₁₀` triangle: `−3+3=0`; trivial group `(2;∅)`: `6−3=3`. Hyperbolicity excludes `(1;∅)` with dimension `0`. | R13 |
| 4.3 Hurwitz/large actions | Klein: `168=84(3−1)`. Bring: `120<84(4−1)=252`, and `120>4(4−1)=12`, corresponding to `μ=1/20<1/2`. Trivial genus-two group gives `1<84`. `(2,2,2,m)` has `μ=1/2−1/m<1/2`. | R20 |
| 4.4 Harvey criterion | `n=1,(2;∅)`: `M=1`, all conditions true, one vector. `n=2,(0;2⁶)`: six maximal 2-powers, even, one vector. `(0;2⁵)`: five, odd, zero vectors. `n=4,(0;2⁶)`: `M=2≠4`, zero generating vectors. | Instance checks pass |
| 4.5 Wiman | Genus two: `(5,2,3)` in `C₁₀`, sum `10=0`, orders `(2,5,10)`, `10=4·2+2`. Genus three: `(7,2,5)` in `C₁₄`, sum `14=0`, orders `(2,7,14)`, `14=4·3+2`. Cyclic unramified degree two over h=2 gives g=3 and `2<14`. | Instance checks pass |
| 4.6 Finiteness/bounds | `n=15,(2,3,30)`: `μ=2/15`, g=`2`, but `30>4g+2=10`. `n=1,(0;2⁸)`: `μ=2`, g=`2`, but `8>6`. Both are numerical data without realizing vectors. | R06–R07, R18 |
| 5.1 Extension | Hyperelliptic subgroup of `C₁₀`: `2·1=10·(1/5)=2`; index `5=1/(1/5)`. This establishes a special extension; it does not identify two chosen complex realizations. | R02, R04 |
| 5.2 Generic fullness | Same example has family dimensions `3` and `0`; existence of the latter extension is true, generic failure of fullness for the former is false. | R04 |
| 5.3 Singerman list | All 19 area identities appear in the separate table below. Row N1 has branch counts `0→6`; row T1 has periods `(7,7,7)→(2,3,7)`, with `2∤7` and `3∤7`. N5 at t₁=t₂=2 gives `μ=0=2·0`, excluded geometrically but accepted by the Lean list predicate. | R16 |
| 5.4 Extension criterion | N4 quotient has `4` elements with nontrivial orders `2,2,2`, not an element of order `4`; N7 uses orders `3` and `2`, not a cyclic group of order `6`. N5 on `(2,2,1,3)` in `C₄` uses inversion and has index `2`. | R16 |
| 5.5 Generic full certificate | Hyperelliptic `C₂` can have a special `C₁₀` overgroup of order `10`, whereas its generic full group has order `2`. Bielliptic `C₂` generically extends to `C₂²` of order `4`, same dimension `2`. | R04 |
| 6.1 Fixed points | `S₃` example: order-three element has `6(1/3+1/3)=4`; involution `2(1/2+1/2)=2`. In `C₃²`, counts at x,y,xy are `12,6,0`; exchanging x,y exchanges the first two. Identity is excluded: hyperelliptic arithmetic expression would give `6` whereas the actual identity fixes all points. | R10 |
| 6.2 Hyperelliptic predicate | Hyperelliptic `C₂`: `6=2·2+2`, quotient genus `0`. Bielliptic `C₂`: `2≠6`, quotient genus `1`. Klein involution: `4≠2·3+2=8`. | Instance checks pass |
| 6.3 Family hyperellipticity | In `C₄,(2,2,4,4)`, involution fixes `6` and lies in a non-full group of order `4`. In bielliptic `C₂`, involution fixes `2`, while the generic full `C₂²` contains one fixing `6`. | R08 |
| 6.4 Cyclic trigonal | `S₃`, g=2: `4=g+2`, and RH `2=−6+2·4`. `C₃²`, g=10: `12=g+2`, RH `18=−6+24`. Klein g=3: `2≠5`. | R08 |
| 7.1 Eichler trace | Genus-two hyperelliptic involution: `1+6(−1)/(1−(−1))=−2=Tr(−I₂)`. Elliptic rotation ω: `1+3ω/(1−ω)=ω`; inverse pullback gives conjugate ω. Free nonidentity action has empty sum and trace `1`. | Instance checks pass |
| 7.2 Chevalley–Weil | `C₅,(1,1,3)` gives multiplicities `(0,0,1,1)`, total `2`; changing weights gives `(1,1,0,0)` for the opposite convention. `C₂,(0;2⁶)` gives `(0,2)`; `(1;2,2)` gives `(1,1)`. Zero representation gives `0`; two trivial constituents give `2h`. | Instance checks pass |
| 7.3 Homology/Jacobian action | Hyperelliptic involution: differential trace `−2`, homology trace `−4=−2+(−2)`; identity traces `2` and `4`. `C₅` eigencharacters χ₃,χ₄ plus their conjugates give χ₁+χ₂+χ₃+χ₄, dimension `4`. | R12 |
| 7.4 Kani–Rosen | For `C₂²` and its three order-two subgroups, coefficient at 1 is `3/2=1+2/4`; at any nonidentity element `1/2=2/4`. Genus-two quotient genera can be `(1,1,0)` with full quotient genus `0`: dimensions `2+2·0=1+1+0`. | Instance checks pass |
| 7.5 Rational decomposition | `C₂`: χdim=1, Schur index=1, n=1; B dimensions `2` or `(1,1)`. Klein rational orbit size2, χdim3, multiplicities0+1: `dim B=½·2·3·1=3`, n=3, A dimension1. Q₈ signature `(4,4,4)` has g=2; quaternionic χ has degree2, Schur index2, so n=1 (not2), B dimension2. | R21 |
| 7.6 Decomposition record | `[(2,1)]`: sum `2`; `[(1,1),(1,1)]`: sum `2`; Klein `[(1,3)]`: sum `3`. Abelian constituents all have n=1; h=0 trivial isotypical component has dimension0 and is omitted. | R10 |
| 8.1 Prefixes | Klein has two refined passports (two order-seven classes), one Aut orbit and one topological class; common family prefix. `C₂` genus-two signatures h=0,r=6 and h=1,r=2 have different family prefixes. | R09 |
| 8.2 Record descent | Unramified `C₂²` example has identical empty passport but topological fundamental-class values `1` and `0`; `C₃²` relabelling changes labelled counts `12→6`. | R09–R10 |

**The 19 Singerman area checks.** Each row is in the README order. These verify both sides numerically, not the existence or maximality of an inclusion. The table in `bujalance` lines 75–95, printed p.1538, agrees with the listed indices and normal/non-normal distinction.

| Row | Parameters used | μ(σ) | d·μ(σ′) |
| --- | --- | --- | --- |
| N1 | none | 2 | 2·1=2 |
| N2 | t=3 | 4/3 | 2·(2/3)=4/3 |
| N3 | t=2 | 1/2 | 2·(1/4)=1/2 |
| N4 | t=3 | 2/3 | 4·(1/6)=2/3 |
| N5 | t₁=2,t₂=3 | 1/3 | 2·(1/6)=1/3 |
| N6 | t=4 | 1/4 | 3·(1/12)=1/4 |
| N7 | t=4 | 1/4 | 6·(1/24)=1/4 |
| N8 | t₁=3,t₂=4 | 1/12 | 2·(1/24)=1/12 |
| T1 | (7,7,7) | 4/7 | 24·(1/42)=4/7 |
| T2 | (2,7,7) | 3/14 | 9·(1/42)=3/14 |
| T3 | (3,3,7) | 4/21 | 8·(1/42)=4/21 |
| T4 | (4,8,8) | 1/2 | 12·(1/24)=1/2 |
| T5 | (3,8,8) | 5/12 | 10·(1/24)=5/12 |
| T6 | (9,9,9) | 2/3 | 12·(1/18)=2/3 |
| T7 | (4,4,5) | 3/10 | 6·(1/20)=3/10 |
| T8 | n=2 | 1/4 | 6·(1/24)=1/4 |
| T9 | n=3 | 1/3 | 4·(1/12)=1/3 |
| T10 | n=3 | 2/9 | 4·(1/18)=2/9 |
| T11 | n=4 | 1/8 | 3·(1/24)=1/8 |

**Independent enumeration controls.** Scratch computations used elementary exact integer/permutation arithmetic, not the author's counts or downloaded code. They returned `S₃:(2,2,3,3)→12`, `S₃:(2;∅)→360`, `C₃²:(3⁶)→29040`, `C₃×C₁₅:(3,15,15)→192`, `S₅:(2,4,5)→120`, and `PSL₂(𝔽₇):(2,3,7)→336`. The last group was represented by determinant-one matrices over `𝔽₇` modulo ±1; its order-two/three/seven pools have sizes `21,56,48`. For `S₅` the corresponding order-two/four/five pools have sizes `25,30,24`. Trivial centres give respectively `12/6=2`, `360/6=60`, `120/120=1`, `336/168=2` inner classes. Abelian groups give singleton inner classes. Additional Hurwitz arithmetic: `1+504/84=7`, `1+1092/84=14`, and `1+192/(2·24)=5`; existence/fullness for those three extra database labels was not independently established.

**Lean signatures, hypotheses and padding.** I re-elaborated one scratch copy containing `#check @...` for each of the 49 named declarations, and compared all results with the README. The two anonymous instances (finiteness and the Aut action) were also read. No PR file changed. The five automated dropped-binder flags were assessed individually: `Aut` legitimately needs only a topology and charted-space structure; `toAut` is a homomorphism without faithfulness, not an embedding; `IsFull` only tests its surjectivity; `numFixedPointsOfAction` is just `Nat.card` of an arbitrary fixed set, with infinite-set value zero; the flag on `hurwitzBound_functionField` is a shadowed ambient `G`, not a lost hypothesis about its subgroup argument. These definitions are unused scaffolding (R20), and their docstrings must not claim their types contain the stronger assumptions.

The following table accounts for the 49 named declarations. Names are relative to `TauCetiRoadmap.GroupActionsOnRiemannSurfaces`; `S=Signature`, `V=GenVector`, `Γ=SignatureGroup` in this table only. The numerical values refer to the fully specified instances above.

| Declaration | Evaluated instance / both sides or discriminating values | Assessment |
| --- | --- | --- |
| Signature | `(h,r,m)=(0,3,[2,3,7])` valid; `[2,1,7]` violates `2≤m`; `[3,2,7]` violates monotonicity | Instance checks pass |
| S.mu | `(2,3,7)→1/42`, `(2,3,6)→0` | Instance checks pass |
| S.IsHyperbolic | `1/42>0` true, `0>0` false | Instance checks pass |
| S.genusOfOrder | `168,(2,3,7)→3`; `0→1` | Instance checks pass |
| S.periods | triangle→`[2,3,7]`; r=0→`[]` | Instance checks pass |
| S.dim | `(0,6)→3`; `(2,0)→3`; `(0,0)→−3` | Instance checks pass |
| S.triangle | h=0,r=3, m=(2,3,7) | Instance checks pass |
| S.mu_triangle | `1/42=−(−1/42)`; Euclidean `0=−0` | Instance checks pass |
| S.one_div_fortyTwo_le_mu | `1/42≤1/42`; `1/42<1/24` | Instance checks pass |
| S.mu_eq_one_div_fortyTwo_iff | `(2,3,7)`: true↔true; `(2,3,8)`: false↔false | Instance checks pass |
| S.dim_nonneg | h=0,r=3→`0≥0`; h=1,r=1→`1≥0` | Instance checks pass |
| S.dim_eq_zero_iff | triangle `0=0`↔true; `(2;∅)` `3=0`↔false | Instance checks pass |
| GenVector | C₂ six entries: product1, order2, image2; C₄ four 2s: image2≠4 | Instance checks pass |
| hyperellipticGenusTwoSignature | h=0,r=6, μ=1 | R20 |
| hyperellipticGenusTwoVector | six additive ones sum0 mod2, image order2 | R20 |
| V.map | `(5,2,3)→(5,6,9)` under unit3; reverse unit7 recovers `(5,2,3)` | R21 |
| V.innAction | C₁₀ orbit sizes1; S₃ generating-vector orbit size6 | Instance checks pass |
| V.numInnClasses | C₁₀ value4; S₃ four-branch value2 | R20 |
| V.refinedPassport | S₃ values `(2-class,2-class,3-class,3-class)` | Instance checks pass |
| V.refinedPassport_smul | conjugating by (12) changes 3-cycles but not their one conjugacy class | R20 |
| signatureRelators | C₂ triple maps power relators to1 but product relator to involution | Instance checks pass |
| SignatureGroup | `(0;∅)` gives trivial group, one element; `(0;2,2)` gives C₂ | Instance checks pass |
| Γ.A | genus-two quotient has indices0,1; h=0 has zero valid indices | Instance checks pass |
| Γ.B | same two handle indices; h=0 gives empty function | Instance checks pass |
| Γ.C | triangle has three branch indices; their orders2,3,7 | Instance checks pass |
| Γ.isConj_pow_C_of_isOfFinOrder | order-two generator is conjugate to its own first power; h=2,r=0 has no nonidentity torsion | Instance checks pass |
| SurfaceKernelHom | C₂ six-branch assignment: image order2, exact order2; trivial assignment: order1≠2 | Instance checks pass |
| SurfaceKernelHom.ker_torsionFree | exact-order C₂ map has no nonidentity finite-order kernel element; trivial map kills order2 | Instance checks pass |
| V.toPermutationTriple | reverse (c₁,c₂,c₃) gives required product c₁c₂c₃=1; 10+1 permutation action has two orbits | R15 |
| Aut | identity and inverse differentiable maps belong; genus-two hyperelliptic involution has order2 | Instance checks pass |
| toAut | faithful C₁₀ image10; trivial C₂ image1 | Instance checks pass |
| IsFull | full C₁₀ example true; its C₂ subgroup image2 versus Aut order10 false | Instance checks pass |
| numFixedPointsOfAction | nontrivial genus-two involution→6; identity on infinite X→Nat.card X=0 | Instance checks pass |
| V.exists_genus_eq | C₂ hyperelliptic gives g=2; trivial h=2 gives g=2 | Instance checks pass |
| V.card_le_hurwitz | Klein `168≤168`; C₁₀ `10≤84` | Instance checks pass |
| V.card_eq_hurwitz_iff | Klein true↔true; C₁₀ false↔false | Instance checks pass |
| hurwitzBound_functionField | Klein `168≤84·2`; genus-two C₁₀ `10≤84` | R20 |
| harvey_iff | C₂ six-branch: all true and one vector; C₄ six-branch: M=2≠4 and no vector | Instance checks pass |
| wiman | C₁₀ `10≤10`; trivial h=2 `1≤10`; n=0 case `0≤6` | Instance checks pass |
| wiman_eq_iff | C₁₀ true↔true; trivial h=2 false↔false; n=0 false↔false | Instance checks pass |
| IsSingermanPair | N5 at (2,2) accepts μ=0 on both sides; N1 μ2 versus μ1 | R17 |
| IsSingermanPair.mu_eq | 19 exact identities above, including N1 `2=2·1` | R17 |
| V.numFixedPoints | C₂ nonidentity6; S₃ values2 and4; identity arithmetic6 despite infinite fixed set | Instance checks pass |
| V.numFixedPoints_le | C₂ `6≤6`, S₃ order3 `4≤6`; witnesses n=6,4 | Instance checks pass |
| V.IsHyperellipticVector | C₂ hyperelliptic true (`6=6`); bielliptic false (`2≠6`) | Instance checks pass |
| V.IsCyclicTrigonalVector | S₃ true (`4=4`), Klein false (`2≠5`) | R20 |
| hyperellipticGenusTwoVector_isHyperelliptic | `6=2·2+2` | R20 |
| V.chevalleyWeilMultiplicity | C₅ multiplicities0,0,1,1; zero representation0; trivial representation h | Instance checks pass |
| V.chevalleyWeilMultiplicity_regular | C₂ regular gives `0+2=2`; trivial group h=2 gives `1·(2−1)+1=2`; S₃ regular gives `−6+2·(3/2)+2·2+1=2` | Instance checks pass |

All 18 admitted theorems were probed on a scratch copy with alternatives `simp`, `rfl`, and `infer_instance`; none closed with those tactics alone. The non-admitted bridge closes by its existing single `exact` application, so its padding diagnosis needs no speculative proof search. Definition unfolding and the pin show that `mu_triangle` is an elementary comparison, and `refinedPassport_smul` is conjugacy-class API, not end mathematics. The proved genus-two constructor is real data, not sorry'd data, but exists only for a prohibited boundary/example admission. No `set_option`, sorry'd definition, `True` placeholder, sorried example, unsupported import, or fully qualified namespace collision was found.

**Headline coverage.** The README's end results are: the generating-vector/surface-kernel correspondence and Riemann existence criterion; torsion classification and surface kernels; topological classification and its sphere braid form; Hurwitz, Harvey and Wiman; Singerman's complete inclusion/extension classification and generic full group; Macbeath's fixed-point equality and the hyperelliptic/trigonal criteria; Eichler and Chevalley–Weil; Kani–Rosen and group-algebra Jacobian decomposition; descent of the resulting record. Lean has the torsion/kernel statements, genus integrality, numerical Hurwitz/Harvey/Wiman, a fixed-point upper bound, and the regular-representation dimension sum. It has neither the full geometric existence statement nor its genus carrier; the docstring correctly admits some of that absence. It does not name the missing carriers for all the other geometric headlines. The existing algebraic carriers make the central correspondence statable now; the 19-row scalar identity and genus-two predicate Check do not substitute for the missing geometric headlines (R17/R20).

**Libraries opened at the pins.** Mathlib was `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti was `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following are file-and-line witnesses, not searches against newer libraries.

| Pinned file and declaration | What was checked |
| --- | --- |
| `Mathlib/GroupTheory/PresentedGroup.lean:39,90,135,149` — PresentedGroup, closure_range_of, toGroup, ext | Quotient construction, generation and universal property already exist; specialize them for the signature relators. |
| `Mathlib/Algebra/Group/Conj.lean:151` — ConjClasses.mk_eq_mk_iff_isConj | Passport equality is native conjugacy-class API. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:41` — mul_def; `Mathlib/Topology/Homotopy/Lifting.lean:627,640` — IsQuotientCoveringMap.fundamentalGroupToMulOpposite and its endpoint equation | Fundamental-group multiplication is reverse path concatenation; the endpoint-labelled deck map is opposite-valued (R01). |
| `TauCeti/Combinatorics/PermutationTriple/Basic.lean:75,427` — PermutationTriple, IsConnected | Product-only carrier; connectedness additionally requires nonzero degree and pretransitivity. |
| `TauCeti/GroupTheory/TriangleGroup/Signatures.lean:122` — orbifoldEulerChar | Reciprocal sum minus one, the negative of the roadmap's triangle μ. |
| `TauCeti/Analysis/Complex/RiemannSurface/LocalMultiplicity.lean:88`; `Degree.lean:133,356`; `Ramification.lean:76` | Local multiplicity, finite-map carrier and ramification degree. `FiniteHolomorphicMap.ofMDifferentiable` requires a nonconstancy witness as well as the stated topology hypotheses; holomorphicity alone is insufficient. |
| `TauCeti/Analysis/Complex/Fuchsian/Elliptic/Linearizing.lean:317,323` — quotientCoordinate and equivariance | Existing Fuchsian stabilizer charts are an input/model, not a proof for arbitrary compact-surface actions. |
| `TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.lean:83,186` | The finite-subgroup tame function-field Hurwitz bound and its characteristic-zero specialization already exist; R20's bridge is exactly the former. |
| `TauCeti/RepresentationTheory/CharacterTable/CentralIdempotent.lean:303`; `IdempotentDecomposition.lean:93,186` | Primitive idempotents and their sum use algebraically closed coefficients, finite dimension, irreducibility and invertibility of the group order. They do not by themselves supply the rational Schur-index theory. |
| `TauCeti/RepresentationTheory/CharacterTable/Realization.lean:112` — FDRep.exists_nonempty_iso_baseChange_iff | Descent has a scalar-endomorphism hypothesis and virtual-character condition, not an unconditional claim that every complex irreducible is rationally realizable. |

**Ownership and resolved suppliers.** Object searches covered the main roadmap repository, the provided open-head index through `roadmaps grep/show`, pinned libraries, and board packages. Searches included surface-kernel epimorphisms, generating vectors, finite group actions on Riemann surfaces, Singerman inclusions, Chevalley–Weil, analytic Jacobians/period lattices and Schur indices, not just the new declaration names. The namespace search found this folder only. The finite-action signature library is a new owner; its triangle specialization, generic character theory, analytic foundations and Jacobian foundations are adapters/consumers of existing owners. No finding claims that this whole scope replans an existing roadmap.

Cross-roadmap locators below are relative to `TauCetiRoadmap/<Name>/README.md`. Revisions of existing roadmaps were checked on main; new supplied folders were read at their supplied/indexed heads. Main ComplexTori, FuchsianOrbifolds and ComplexCurveModuli were also read as shape examples.

| Supplier | Resolved sections and outcome |
| --- | --- |
| FuchsianOrbifolds (main) | Layer 2 polygon/presentation items; Layer 4 quotient; 5.1–5.3 and 5.6 genus/RH (`:314` onward). The Layer 4a citation is absent (R13). |
| BelyiMaps (main) | 0.1–0.8, 1.1–1.5 (`:578–878`), 3.2–3.4 (`:1181–1240`), 4–8: native triples, passports, character counts, triangle groups, monodromy, filling and analytic existence. Extending from three punctures or three factors is new work here; it is not already the arbitrary-signature theorem. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.3.2 (`:2677` onward) supplies branch tuples and Hurwitz moves with arbitrary boundary product, not forced product one. IG.5.2 (`:5421` onward) supplies marked disc Hurwitz spaces and forgetting the boundary lift. The `r−3` sphere dimension comparison needs the stated projective-coordinate quotient, not merely the disc space. |
| TeichmullerGeometry | Actual §§5.6 (`:497`), 8.4 (`:654`), 10.1 (`:735`), 10.4 (`:780`) were opened. Old T6/T7/T9 references and their stronger orbifold/genericity claims are R13. |
| SurfaceTopology | Layers 7–9 provide edge-path groups, compact classification and closed/boundary mapping classes. The marked/punctured extension is excluded at `:1608` (R11). |
| AlgebraicCurves / ModularForms (main) | AlgebraicCurves Layer 11 (`:1396` onward), including finiteness target `:1432`, and Layer 12 (`:1468`); ModularForms 10B (`:1068` onward), including genus agreement `:1096`. These are the proper owners for the algebraic/analytic curve dictionary and differential dimension, not an unpinned Tau Ceti module. |
| JacobianChallenge / ComplexTori (main) | JacobianChallenge D–F, especially E (`:332` onward) and dimension `:348`, is algebraic; ComplexTori Milestone 1 (`:130–152`) starts with a lattice. Neither cited locator gives the period-lattice comparison used in 7.3 (R12). |
| HyperellipticCurves | §1.4 (`:831` onward), with the index-two field foundation in Layer 0: uniqueness/centrality and fixed-point criterion. This is consumed, not rebuilt. |
| CanonicalModelsAndGonality | §§6.1–6.3 (`:862,875,886`) and 6.6–6.7 (`:925,937`) give the function-field quotient and involution/trigonal criteria. The present roadmap owns their generating-vector comparison. No missing merge-order placement was called a defect. |
| FiniteGroupInvariants | §§6.2–6.5 (`:707–775`) own Galois orbits, rational characters and Schur indices; give this precise contract for 7.5 (R21). SatoTateGroups is only a scope exclusion, not a supplier. |

The eight automated citation leads were resolved rather than blindly reported: the three database/knowl identifiers are not Lean names; `exists_genus_eq` is declared locally; `ofAction` and `triangleEquiv` are prose targets; the surface-kernel equivalence is a locally intended but missing statable target; the higher-genus finiteness declaration is absent from the pin and must be supplied by the named roadmap, not alleged library main.

**Seeded source sample: all 15 targets.** Sources were fetched through the prescribed service from legal repositories, publisher archives or author pages. The README has no explicit “unverified” locator markers and no source manifest. Source keys below identify the one work throughout; Breuer's contents and its unavailable full text are the same work, not two entries. Printed publication pagination is only certified where actually visible. Preprint page numbers are explicitly identified.

| Sampled target | Text opened, locator, and outcome |
| --- | --- |
| 1.2 Stabilizers/quotient | Instance checks pass |
| 1.4 Signature RH | R06 |
| 1.5 Holomorphic differentials | Instance checks pass |
| 2.3 Vector to action | Instance checks pass |
| 2.4 Action to vector | Instance checks pass |
| 2.6 Compatibility | R02 |
| 3.1 Refined passports | Instance checks pass |
| 3.4 Topological equivalence | R11 |
| 3.5 Braid comparison | R03 |
| 3.7 Counts | R19 |
| 4.2 Dimension | Instance checks pass |
| 5.4 Extension | R16 |
| 6.2 Hyperelliptic group criterion | Instance checks pass |
| 7.3 Homology/End(Jac) | Instance checks pass |
| 7.6 Decomposition record | Instance checks pass |

Readable legal versions: [Bujalance–Cirre–Conder, publisher PDF](https://www.ams.org/journals/tran/2003-355-04/S0002-9947-02-03184-7/S0002-9947-02-03184-7.pdf), [Lange–Recillas, arXiv v2](https://arxiv.org/abs/math/0106055v2), [Swinarski, arXiv v1](https://arxiv.org/abs/1607.04778v1), [Paulhus 2023 author preprint](https://www.jenpaulhus.com/research/Paulhus-lmfdb2022.pdf), [Paulhus 2008 author preprint](https://www.jenpaulhus.com/research/PaulhusActaArith08.pdf), [Breuer publisher contents](https://assets.cambridge.org/97805217/98099/toc/9780521798099_toc.pdf), and [LMFDB source](https://github.com/LMFDB/lmfdb/blob/main/lmfdb/higher_genus_w_automorphisms/main.py). Paulhus 2008 lines 90–107 and 146–150 additionally support the group-algebra and V₄ decomposition checks, under its characteristic-zero standing hypothesis at line 52. These are alternate readable support, not a claim to have opened the missing primary locators.

## Not verifiable

All 17 referenced works/resources were attempted. Unavailable text did not halt the review, and none of the counterexamples relies on guessing it. No source file or extraction was copied into the repository or this report.

- **breuer:** Full *Characters and Automorphism Groups of Compact Riemann Surfaces* was not found legally by the service/author-page search. Only the publisher's contents was readable; the exact existence, fixed-point and Chevalley–Weil theorem texts remain uncertified.
- **broughton:** Propositions 2.1–2.2 and Tables 4–5, DOI `10.1016/0022-4049(91)90021-s`, resolved as paywalled. Secondary restatements do not certify its precise theorem numbering/hypotheses.
- **harvey:** Theorem 4, DOI `10.1093/qmath/17.1.86`; publisher access returned HTTP 403. **wiman:** the abbreviated 1895 citation did not resolve to a legal full text. Numerical checks do not certify either locator.
- **macbeath:** §2, DOI `10.1112/blms/5.1.103`, publisher HTTP 403. **singerman:** Theorem 1, DOI `10.1112/jlms/s2-6.1.29`, publisher HTTP 403; the 19 rows were checked in Bujalance–Cirre–Conder instead.
- **ries:** §3, DOI `10.2307/2154274`, resolved to a JSTOR landing page without a legal readable copy. Its genericity theorem was not certified.
- **farkas_kra:** III.7, V.1 and V.2.9 resolved only to publisher paywalled material. **miranda:** III.3 did not resolve to a legal full text; the author's book listing is not the text.
- **chevalley_weil:** pp.358–361, DOI `10.1007/bf02940687`, and the unspecified correction were not readable. **kani_rosen:** Theorems A–C, DOI `10.1007/bf01442878`, paywalled. The V₄ identity was checked directly and against Paulhus, not against those primary theorem labels.
- **Version concordance:** the readable Lange–Recillas v2 and Paulhus author preprints have their own pagination. Agreement with the published 2004/2008/2023 page and theorem numbering has not been established; cite the versions actually read.
- **lmfdb:** the live higher-genus page returned a reCAPTCHA page; no attempt was made to bypass it. Source-code rendering and aggregate queries were readable, but live knowl contents, the full table schemas and stored record values were not certified.

The consolidated missing-text record retains failed lookups under their original work keys; paywalled works marked `uncertified` are not requested again. Ownership searches used the readable main/open-head index and supplied sibling files; they do not certify unseen content outside those sources. The three extra high-genus labels mentioned above have only their arithmetic checked.

## Source issues

- none
