# Review of NoncongruenceModularForms (pull request #1709 at 7a76b85)

**Verdict:** needs changes

## R01 (P1) — The Farey-symbol carrier admits infinite-index groups

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:867`, `:927`; `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:811`. Claim: “For every Farey symbol” the associated polygon is a fundamental domain of a finite-index group with the indicated independent presentation.

Witness: `xs=[0]`, `labels=[even,even]` inhabits the Lean structure. Both side generators are `[[0,1],[-1,0]]`; their projective group has order 2 and infinite index. The purported independent presentation is instead `C₂∗C₂`.

Repair: specify admissible, nondegenerate special-polygon data before asserting the correspondence; prove that the combinatorial admissibility conditions imply the polygon hypotheses. In particular exclude the zero-area cases: `6r+3e₂+4e₃>6` rejects this datum and `[0]` with two equally labelled free sides (whose generator is the identity). It retains the advertised even/odd singleton (`7>6`) and odd/odd singleton (`8>6`). Do not assert that this inequality alone proves all polygon hypotheses without supplying that argument. Add these negative controls. A scratch Lean construction of the bad datum and equality of its generators elaborated successfully. This also invalidates the unrestricted “free generator is hyperbolic or parabolic” and the invariant/presentation assertions of §§5.2–5.4.

## R02 (P1) — Cusp width depends on the chosen scaling

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:503`. Claim: the cycle length equals `CuspDatum.width` “for any cusp datum” at that cusp.

Witness: for the full modular group at ∞ the cycle length is 1. Scaling by `diag(2,1/2)` fixes ∞ but conjugates `T` to `T⁴`; the resulting cusp datum has width 4.

Repair: use the datum scaled by the projective image of `σ⁻¹`, or state the explicit change-of-scaling factor. Require compatible scaling in the width-ratio comparison too. With integral scaling `σ=1`, both sides are 1; with the displayed rescaling the corrected comparison gives `4=4·1`. The native definition explicitly includes a scaling and its conjugation equation: `TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.lean:167`. FuchsianOrbifolds Layer 3(4) already states the scaling law.

## R03 (P1) — The composite-level quotient is not Mathlib’s PSL₂

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:601`, `:713`, `:759`. Claim: principal projective cosets and Hsu’s finite quotient are `PSL₂(ℤ/N)`, with order `N³/2 ∏(1−p⁻²)`.

Witness: at `N=8`, `SL₂(ℤ/8)` has 384 elements and center `{I,3I,5I,7I}`. Native PSL₂ has order 96; quotienting only by `{±I}` gives 192, the principal projective index.

Repair: name `Q_N=SL₂(ℤ/N)/{±I}` explicitly and use it throughout §§2.5, 3.5, 4.1–4.2 and the adelic comparison. Do not restrict to primes. At `N=12` the same correction gives `1152/2=576`, while native PSL₂ has order `1152/4=288`. The existing Lean `index_Gamma_map_toPSL` correctly uses the cardinality of SL₂ and need not be weakened. See `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:256`, and hsu line 100 (Theorem 2.4, printed p.1353).

## R04 (P2) — Distinguish an algebraic uniformizer from a formal q-coordinate

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:1188`. Claim: `q^(1/w)=u·t` for a local parameter defined over the cusp field.

Witness: any rational uniformizer on `X(1)` is S-invariant, but `q(2i)=e⁻⁴π≠e⁻π=q(i/2)` although these points have equal j. For `t=1/j`, explicitly `q=t+744t²+…`.

Repair: for an algebraic uniformizer use `q^(1/w)=κt+O(t²)`, as §8.3 does, and prove algebraicity of the formal change. If t means a parameter only in the completed local ring, say so and prove its field of definition. Derive the coefficient-field presentation from that formal change and its leading root, not from an equality of algebraic functions with q. The corrected statement has `κ=1` and quadratic coefficient 744 on this test. BMR’s coefficient presentation (bmr-database line 80, equation (2.5), p.2) does not assert the stronger equality of parameters.

## R05 (P1) — Bounded denominators do not make Farey symbols finite

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:874`. Claim: “finiteness of symbols with bounded denominators”.

Witness: for every integer `j`, the singleton `[j]` with labels `(even,odd)` satisfies the stated datum, and every denominator is 1. These are infinitely many distinct symbols. Free-label renaming gives another independent infinity.

Repair: state a genuine finite-height result, bounding numerators as well as denominators and either bounding the label alphabet or quotienting free-label renamings. For numerator bound 1 and denominator bound 1 the available rationals are exactly `−1,0,1`, whereas the original bound admits every integer. Keep the integer-shift operation; do not silently identify distinct shifted subgroups.

## R06 (P1) — The Scholl headline has no owner for its proof inputs

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:1293`, `:1299`. Claim: the simultaneous Frobenius polynomial and ASD congruences are “consumed from the source”; the representation is expressly not constructed.

Witness: li-long lines 179–192 obtains the polynomial and congruences from Scholl’s compatible representations and an étale/crystalline comparison. None of §8.3’s four dependencies supplies those constructions or that comparison for noncongruence forms.

Repair: give this theorem a complete owned proof route, with exact contracts for the noncongruence cohomological realization, integral comparison and Frobenius polynomial, either here or from a named eligible supplier. A bibliography item is not a supplied theorem. Keep the stated general scope and identify the additional input for odd weights: the accessible Li–Long passage explicitly assumes even weight, while Li–Long–Yang treats particular odd-weight examples. Test the completed contract at `d=0` (polynomial 1, zero space) and `d=1` (one polynomial for every coefficient and every integral form), rather than replacing it with independently chosen integers for each coefficient.

## R07 (P1) — The rational denominator contract points to a nonexistent target

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:141`, `:1205`. Claim: AlgebraicModularFormsAndSerreWeights R15.2 supplies `TauCeti.KatzModularForms.boundedDenominators`.

Witness: the supplied roadmap now has §2.9, not R15.2. Its declaration is `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.KatzModularForms.boundedDenominators`; the claimed `TauCeti` declaration is absent at the pin.

Repair: cite AlgebraicModularFormsAndSerreWeights §2.9, `README.md:412` and `Suggested.lean:51`, with its actual namespace and width-`N` hypotheses. It supplies exactly the rational statement needed: at level 11, `Δ/11` requires a clearing denominator divisible by 11, so the repointed contract still includes level primes. This is supplier drift, not a request to rebuild the all-prime theorem.

## R08 (P1) — Degree-6–11 transitive labels are not supplied on main

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:1045`. Claim: PolynomialGaloisGroups “Layer 1D up to degree 11” supplies the monodromy labels.

Witness: `Completed/PolynomialGaloisGroups/README.md:35` restricts complete classification to degrees ≤5; line 57 expressly excludes completeness in degrees 6–11. The cited Layer 1D is not in that main-branch roadmap.

Repair: replace the nonexistent citation by an exact, declared contract with an eligible owner for the larger-degree label semantics, or own the missing target in the appropriate continuation. Do not consume an unmerged revision of the existing roadmap. Preserve the intended scope. Test the replacement on the degree-7 monodromy groups of orders 42, 168 and 5040; the degree-≤5 contract cannot name those actions.

## R09 (P1) — The worker’s build gate fails

Location: `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:1`.

Witness: the supplied gate records `build=1 FAIL`: importing Mathlib without a module header emits the module-system warning. The direct Lean elaboration exits successfully; this finding is the gate failure, not a type error.

Repair: add `module` before the imports and rerun the targeted gate. A scratch copy with that header elaborated under defaults with only `sorry` warnings and the counterexample probes. No other worker gate failure was reported. Severity follows this review job’s explicit rule for a failing build gate.

## R10 (P2) — Import the earlier level and denominator roadmap

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:70`, `:179`, `:1247`. Claim: this roadmap owns general/signed levels and Wohlfahrt, and states CDT while excluding every step of its proof.

Witness: `packages/ModularFormsPartII/design/README.md:242`, `:301`, `:320`, `:358`, `:994` already owns geometric levels, intersection/core laws, signed Wohlfahrt and CDT; W6.4–W6.5 supply the rational and number-field variants.

Repair: record the earlier owner and exact W1.2–W1.3, W1.5–W1.6, W1.8 and W6.3–W6.5 contracts; retain here the permutation dictionary and transport to the native holomorphic-form carrier. Resolve any unavailable export through an explicit supplier gap, rather than silently treating a design as compiled API. The roadmap tool currently finds no main/open roadmap folder for ModularFormsPartII, so this evidence is its board design, not a library claim. On `Δ/11`, the transport clears by 11; on the width sets `{4,3}` it preserves level 12. This also removes the statement-only escape from proving CDT.

## R11 (P2) — The general double-coset endomorphism is already at the pin

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:1152`. Claim: “this milestone owns” the double-coset action because ModularForms Layer 2 only treats Γ₁(N).

Witness: `TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean:83`, `:127`, `:138`, `:162` already supplies the modular/cusp endomorphisms and finite-coset sum for arbitrary arithmetic `G`, with finite decomposition and positive determinant.

Repair: consume `HeckeRing.GL2.heckeSlashModularFormEnd` and `heckeSlashCuspFormEnd`; own the required commensurability instance and Berger comparison. The README’s own first Check already identifies precisely that native operator. The arithmetic slash normalization gives `T₂Δ=−24Δ`; no extra determinant rescaling is needed.

## R12 (P2) — Reuse the existing full cycle partition API

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:493`; `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:416`.

Witness: `TauCeti/GroupTheory/Perm/Partition.lean:96` defines `Equiv.Perm.fullCycleType`; lines 340 and 346 prove its total sum and positivity. The roadmap rebuilds that object and those properties using `cycleType.sum` instead of support cardinality.

Repair: define any needed cusp-width specialization through `fullCycleType`, cite the generic partition API, and retain only the new geometric cusp correspondence. For `(1 2)` on three letters both descriptions are `{2,1}`, with sum 3 and two cusps; for the identity on three letters both are `{1,1,1}`. The fixed-point correction is essential, but it already has an owner.

## R13 (P2) — Statable headlines are replaced by datum and example declarations

Location: `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:16`; `TauCetiRoadmap/NoncongruenceModularForms/README.md:905`, `:1132`.

Witness: Kulkarni’s finite-index/existence theorem is omitted while side matrices and determinants are present. A generated subgroup is statable with `Subgroup.closure` on native PSL₂. The promised odd-weight dimension formulas also have no target signature or missing-carrier explanation.

Repair: after R01, keep the few definitions needed for `FareySymbol.group` and state its finite-index and subgroup-realization headlines. State the promised odd-weight dimension results using native form spaces and regular/irregular cusp data, or identify precisely which missing carrier prevents each signature. Merely calling the file “not exhaustive” is insufficient. Retest the finite-index headline against the excluded even/even singleton and the retained even/odd singleton (index 1); test odd parity on a group containing `−I`, where both dimensions are 0. Berger also needs reassessment after R11: its double-coset carrier already exists.

## R14 (P3) — Remove the acceptance file’s API and small-value padding

Location: `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:306`, `:405`, `:534`, `:732`, `:1085`, `:1109`.

Witness: `map_comap_modularHom` closes by one `exact Subgroup.map_comap_eq_self_of_surjective modularEquiv.surjective Γ'`; `generalLevel_pos` closes by `exact orderOf_pos _`. Both probes elaborated. The index-7/8 existentials merely package worked Checks.

Repair: delete these declarations from `Suggested.lean`; keep the mathematics in the README. Also remove the `card_modularClasses` small-value table, the matrix-identity/API catalogue, routine restriction/Sturm wrappers and the dedicated sample-permutation declarations except for at most a handful of nontrivial proved tests supporting retained definitions. Do not prove the padding in place. Every original admitted theorem was tried with one-tactic alternatives on a scratch copy; the small enumeration’s reduction exceeded default recursion and was then left admitted, not treated as a failure of the original statement.

## R15 (P3) — Replace executable procedures with mathematical targets

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:66`, `:464`, `:806`, `:1008`; `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:646`.

Witness: the owned scope promises executable enumeration; §§4.3 and 5.5 specify reduction/conversion algorithms and termination. `oddPartAux`, `invMod` and `crt` implement finite searches, rather than merely stating the mathematical congruence criterion.

Repair: retain the finite-action classification, Hsu relations, existence of witnesses and Farey correspondence as mathematics; remove executable enumeration, word-reduction and conversion deliverables. State the modular inverses/CRT parameters mathematically on native carriers. Keep the index-7/8 numerical tests in the README: the relations still distinguish the tested groups without requiring an algorithm-development roadmap.

## R16 (P3) — Correct the source locators and record the versions actually read

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:923`, `:955`, `:998`, `:1013`, `:440`.

Witness: in Kurth–Long’s accessible version, generators are Theorem 3, §3.3, p.7; invariants are §3.4, p.8; polygon existence is Theorem 2, p.4. The README repeatedly cites §2 or only Theorem 1.

Repair: cite those exact locators with the arXiv version, or verify the published numbering before using it. The reverse construction is §5.1 and coset representatives §5.3, not §§3–4 as claimed. Supply a precise primary locator for Millington (BMR points to Theorem 2), and locators for claims currently supported only by a whole work or none (§§0.4, 3.1, 3.5). Keep library/supplier results as exact declaration/section citations instead. Add a source manifest when repairing the package; this review did not edit one. The tests in the tables below still require R01’s admissibility correction; fixing a locator does not repair that mathematics.

## R17 (P3) — Complete the roadmap shape and per-definition Checks

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:3`, `:33`, `:193`, `:384`, `:612`.

Witness: there is no opening `**Summary.**`, `## Exact supplier contracts` or `## How to read the build`; layers lack their required Examples/Dependencies endings. Definitions such as `lift`, `psl2Index`, strict level and congruence closure lack three local discriminating Checks.

Repair: use the required headings and target-specific `*Needs:*` lines; turn API claims into prose bullets and attach at least three discriminating Checks to each definition. In particular add the scaling, zero-area and composite-level controls above. Cite FreeGroupsAndLimitGroups §4.11 for the Kurosh input to §0.3 (`TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1013`) rather than leaving the freeness corollary’s route implicit. Keep ownership statements in Scope and ownership. The global worked examples are useful but do not replace the missing per-definition contract.

## Verified sound

The whole README and Lean file were read. The review checked all 15 seeded targets, the remaining layers, the pins, the worker gate, scope outside the folder, explicit dependencies, and ownership by object in main, the supplied open-roadmap heads and board packages. No outside-folder diff, sorry-defined data, `set_option`, cyclic/upward dependency reported by the checker, or copied source passage was found. The findings are repairable within this roadmap’s distinct subgroup/permutation scope; this is not a rejection of that scope.

Direct `lake env lean` elaboration of the original file succeeded, with 84 `sorry` warnings. An independent scratch file checked the types of all 178 named declarations using `#check @...`; the worker’s count of 180 also counted two words in comments. The 13 suspected lost-binder cases did not produce an additional mathematical defect: coset numberings imply finiteness, the odd-vanishing/restriction statements intentionally do not need finite index, and the bare definitions do not assert analytic properties without the subsequent hypotheses. No signature was changed in the PR. The repaired-header scratch probe exited 0; the degenerate Farey datum and generator equality were proved. The initial over-eager `rfl` probe on the small enumeration hit the default recursion limit; its second run left that computation admitted and used no option override.

The dependency check, run with the supplied candidate order, `--movable` and main content, returned exactly:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

The worker’s gate had every scanner at zero and only `build=1 FAIL`, for the warning described in R09. This review did not edit the PR or rerun a mutated PR build. No `UPWARD`, `CYCLE` or `moved:` line was returned. The semantic supplier failures R07–R08 are not disproved by the mechanical result.

### Numeric adversarial controls

The following values were independently calculated from the README’s permutations, composing right to left. `W` includes 1-cycles; `H` lists the Boolean relators in their displayed order. “Pass” below means the indicated instance agrees, not that an admitted theorem has been proved. The empty triple is excluded by native `IsConnected` (`n≠0`), and an equivalence from a subgroup quotient cannot have target `Fin 0`.

| Instance | n; e₂; e₃; W; g; level | Monodromy order | H | Genus identity, left = right |
|---|---|---:|---|---|
| Full group | 1;1;1;[1];0;1 | 1 | T | 13=13 |
| Index 2 | 2;0;2;[2];0;2 | 2 | TTT | 14=14 |
| Γ₀(2) | 3;1;0;[1,2];0;2 | 6 | TTT | 15=15 |
| Normal index 3 | 3;3;0;[3];0;3 | 3 | T | 15=15 |
| Γ₀(4) | 6;0;0;[1,1,4];0;4 | 24 | TTT | 18=18 |
| Γ(2) | 6;0;0;[2,2,2];0;2 | 6 | TTT | 18=18 |
| Γ₀(11) | 12;0;0;[1,11];1;11 | 660 | T | 24=24 |
| Two index-7 congruence rows | 7;3;1;[7];0;7 | 168 each | T each | 19=19 |
| Two index-7 level-6 rows | 7;1;1;[1,6];0;6 | 42 each | FFFFTTF each | 19=19 |
| Index-7 level-12 row | 7;1;1;[3,4];0;12 | 5040 | FFFFTTF | 19=19 |
| Index-7 level-10 row | 7;1;1;[2,5];0;10 | 5040 | FFFFTTT | 19=19 |
| Γ₀(7) | 8;0;2;[1,7];0;7 | 168 | T | 20=20 |
| Two index-8 congruence rows | 8;2;2;[8];0;8 | 48 each | TTT each | 20=20 |
| Two index-8 noncongruence rows | 8;2;2;[8];0;8 | 336 each | FFT each | 20=20 |

The index-8 certificate word sends point 1 to 1 in both congruence examples and to 6 in both noncongruence examples. Its congruence-modulus test is therefore discriminating. On the 24 nonzero vectors of 𝔽₅², the Γ₁(5) action gives Hsu result F at modulus 5 and TTTTTTT at modulus 10; the odd relator sends `(1,0)` to `(4,0)`. Thus §4.4’s doubled strict modulus avoids an actual sign error.

| N | SL₂ cardinality | Scalar center | Native PSL₂ | Sign quotient Q_N |
|---:|---:|---|---:|---:|
| 1 | 1 | {0} | 1 | 1 |
| 2 | 6 | {1} | 6 | 6 |
| 3 | 24 | {1,2} | 12 | 12 |
| 4 | 48 | {1,3} | 24 | 24 |
| 6 | 144 | {1,5} | 72 | 72 |
| 8 | 384 | {1,3,5,7} | 96 | 192 |
| 10 | 720 | {1,9} | 360 | 360 |
| 12 | 1152 | {1,5,7,11} | 288 | 576 |

These counts were obtained by enumerating determinant-one matrices in the finite rings, including the zero ring at N=1. They validate the SL cardinality formula and refute the native-PSL identification. The `N≠0`/`N≥3` guards in the Lean cardinality/index theorems were retained.

### Sampled and headline adversarial checks

The review checked 178 signatures, including real definitions, proved API statements and 84 admitted targets. The selected rows below retain the sampled and headline evidence; routine declaration-level controls are omitted. Numeric substitutions test signs, junk values and hypotheses, not universal conclusions. The source-only lift witness is distinguished explicitly.

| Declaration | Instance | Computed values | Result / change |
|---|---|---|---|
| `modularHom_injective` | ping-pong at q=1 and q=−1 | S(−1)=1>0; R(1)=−1/2<0; R²(1)=−2<0 | pass |
| `isConj_of_isOfFinOrder` | 1,S,R,R²; T | orders 1,2,3,3; T infinite is excluded | pass |
| `exists_freeGroupBasis_of_torsionFree` | projective Γ(2); index-6 commutator | rank 2=1+6/6 in each case | cite Kurosh; R17 |
| `abelianization_equiv` | images of S,R in Z/6 | S↦3, R↦2 generate six residues | pass |
| `lift` | ⊤; trivial projective subgroup | SL₂(ℤ); {±I} | pass |
| `index_lift` | ⊤; image Γ(3) | 1=1; 12=12 | API/padding; R14 |
| `map_lift` | ⊤; trivial subgroup | ⊤=⊤; {1}={1} | API/padding; R14 |
| `lift_map_eq_self_iff` | SL₂(ℤ); Γ(3) | true↔true; false↔false (−I∉Γ(3)) | pass |
| `psl2Index` | Γ(2); Γ(3) | 6;12, versus SL indices 6;24 | pass |
| `psl2Index_eq_index` | Γ(2) | 6=6 | pass |
| `two_mul_psl2Index` | Γ(3); trivial SL subgroup | 2·12=24; 2·0=0 (infinite-index convention) | pass |
| `millington` | two index-3 classes | orders of T:2 versus 3; neither conjugate nor equivalent | pass |
| `exists_modularTriple_equivalent` | trivial degree 1; connected degree 2 | subgroups ⊤ and kernel to C₂; indices 1 and 2 | pass |
| `card_subgroups_of_class` | Γ₀(2); normal index 3 | 3·1=3; 1·3=3 | pass |
| `cuspWidths` | Γ₀(2); full group | [2,1]; [1], including fixed points | reuse fullCycleType; R12 |
| `cuspCount` | Γ₀(2); full group | 2;1 | pass |
| `sum_cuspWidths` | Γ₀(2); Γ₀(11) | 2+1=3;11+1=12 | native API; R12 |
| `card_cuspWidths` | same groups | 2=2;2=2 | pass |
| `pos_of_mem_cuspWidths` | Γ₀(2) | widths 1,2 both >0; 0 absent | native API; R12 |
| `period_permT_base` | Γ₀(2), base 2 | 1=integer width 1 | pass |
| `period_permT_coset` | Γ₀(2), σ=S, cusp 0 | cycle through point1 length2; min h=2 | pass |
| `cuspCount_eq_card_cuspOrbits` | Γ₀(2); Γ(2) | 2=2;3=3 | pass |
| `genus` | Γ₀(2); Γ₀(11) | 0;1 | pass |
| `genus_formula` | same groups | 15=15;24=24 | pass |
| `six_dvd_of_elliptic_eq_zero` | Γ(2); Γ₀(11) | 6=6(0−2+3);12=6(2−2+2) | pass |
| `generalLevel` | W=[1,2];[3,4] | 2=lcm(1,2);12=lcm(3,4) | pass |
| `generalLevel_eq_lcm` | W=[1,2];[3,4] | 2=lcm(1,2);12=lcm(3,4) | pass |
| `generalLevel_pos` | full group; Γ₀(2) | 1>0;2>0 | one exact; R14 |
| `normalClosure_T_pow_le_lift_iff` | Γ₀(2), N=0,1,2 | true↔2∣0; false↔2∣1; true↔2∣2 | pass |
| `strictLevel` | SL₂(ℤ); Γ(3); trivial subgroup | 1;3;0 (empty defining set in last case) | pass |
| `strictLevel_pos` | SL₂(ℤ); Γ(3) | 1>0;3>0; trivial subgroup excluded | pass |
| `strictLevel_eq_or_eq_two_mul` | Γ(3); irregular lift of Γ₀(4) | 3=3;8=2·4 | pass |
| `strictLevel_eq_of_neg_one_mem` | Γ(2); SL₂(ℤ) | 2=2;1=1 | pass |
| `generalLevel_inf` | images Γ(2), Γ(3) | intersection level6=lcm(2,3) | pass |
| `generalLevel_normalCore` | Γ₀(2) | level(core)=2=level(Γ₀(2)) | pass |
| `strictLevel_inf` | Γ(2), Γ(3) | 6=lcm(2,3) | pass |
| `strictLevel_normalCore` | Γ₀(2); Γ(3) | 2=2;3=3 | pass |
| `wohlfahrt_lemma` | N=2,M=1; N=1,M=2 | Γ(2)=Γ(2)∨closure(T²); SL₂=Γ(2)∨closure(T) | pass |
| `wohlfahrt` | Γ₀(2); index7 level12 | true↔true; false↔false (7 does not divide576) | pass |
| `wohlfahrt_strict` | Γ₁(5) | true↔Γ(5)≤Γ₁(5), strict level5 | pass |
| `exists_lift_not_isCongruenceSubgroup` | KSV lifts of Γ₀(6) | projective index12, SL index24, strict level12 | source witness; construction not independently rebuilt |
| `congruenceClosure` | Γ₀(2); index8 noncongruence rows | closure=Γ₀(2), index3; closure=SL₂, index1; equality flags T,F | pass |
| `index_dvd_of_isCongruenceSubgroup` | Γ₀(2); index7 level12 | 3∣6;7∤576 (excluded hypothesis) | pass |
| `orderOf_σ1_mul_σ0` | Γ₀(2); index7 level12 | 2=2;12=12 | pass |
| `compositionFactor_of_isCongruenceSubgroup` | Γ₀(11); S₇ example at level12 | PSL₂(F11) order660 allowed; A₇ order2520 excluded | pass |
| `hsu` | 18 explicit permutation rows above | T on congruence rows; F on 6 noncongruence rows | agrees; mathematical criterion retained |
| `hsu_strict` | Γ₁(5) on 24 nonzero vectors | mod5 F; mod10 all 7 relations T | pass |
| `FareySymbol` | [0], even/odd; even/even; empty | accepted; accepted; rejected | second admission false geometry; R01 |
| `cuspExpansion` | Δ, σ=1; zero form | q−24q²+… on both;0 on both | pass |
| `cuspExpansion_one` | Δ, σ=1; zero form | q−24q²+… on both;0 on both | pass |
| `eq_zero_iff_cuspExpansion_eq_zero` | zero; Δ | true↔true; false↔false (a₁=1) | pass |
| `isCuspForm_iff` | Δ; E4 | true↔a₀=0; false↔a₀=1 | pass |
| `cuspExpansion_eq_of_same_cusp` | Γ(2), E4, σ=1,τ=T | width2, ζ=−1; coefficients at m2,4 are240,2160 unchanged | pass |
| `finrank_cuspForm` | full group k4,12; Γ₀(11) k4 | 0=−3+1+1+1;1=−11+3+4+5;2=0+0+0+2 | pass |
| `finrank_modularForm` | full group k4,12; Γ₀(2) k4 | 1=−3+1+1+2;2=−11+3+4+6;2=−3+1+0+4 | pass |
| `finrank_cuspForm_two` | Γ₀(2); Γ₀(11) | 0=0;1=1 | pass |
| `exists_basis_coeff_mem_numberField` | M4(SL₂), E4 | K=Q, coefficients 1,240,2160 | pass |
| `exists_bounded_denominators_numberField` | Δ/11 at congruence level11 | D=11 gives coefficients1,−24; D=1 fails at a₁ | pass |
| `unbounded_denominators` | Δ/11; coefficient sequence2⁻m | D=11 works and Δ is congruence; 2⁻m has no common D | CDT transport; R10 |
| `unbounded_denominators_numberField` | sqrt(2)·Δ, K=Q(sqrt2) | D=1; sqrt2,−24sqrt2 integral; congruence conclusion true | CDT transport; R10 |
| `labelPrefix` | index7 level6,10,12 | same prefix(7,0,2,1,1); levels6,10,12 differ | pass |
| `exists_labelPrefix_eq_isCongruence_ne` | index8 congruence/noncongruence | same(8,0,1,2,2); Hsu T/F | worked Check; R14 |

### Prose-only targets and convention checks

| Statement | Instance | Computed values on the two sides | Result / change |
|---|---|---|---|
| §2.1 analytic width for arbitrary datum | full group, scaling1 and diag(2,1/2) | cycle1 versus widths1 and4 | Fails; R02 |
| §2.1 width ratios | Γ(2)→full group, compatible scaling | three width2 cusps over width1; 2+2+2=6 | Correct with compatible scaling |
| §2.5 Γ₀ index and divisor cusp formula | N=4; N=11 | 4(1+1/2)=6, widths1,1,4; 11(1+1/11)=12, widths1,11 | Correct instances |
| §2.5 principal quotient identification | N=8; N=12 | native PSL96 versus192;288 versus576 | Fails; R03 |
| §4.2 Hsu modular inverses | mixed N=10, e2,m5 | inverse5 modulo2=1; inverse5 modulo5 does not exist | Roadmap chooses correct modulus; source erratum below |
| §5.1 finiteness by denominator | singletons [j] | denominator1 for every j∈ℤ; infinitely many | Fails; R05 |
| §5.2 even fixed-point orientation | side−∞→0, M=diag(−1,1) | M(−i)=i∈ℍ; M(i)=−i∉ℍ | Determinant−1 orientation is correct |
| §5.2 odd endpoint action | side0→∞, matrix−U | 0↦1↦∞↦0; trace1; determinant1 | Correct |
| §5.2 free pairing inversion | first and reverse Γ₀(2) free pair | −T and T⁻¹; reverse=−(−T)⁻¹ | Correct projectively |
| §5.2 unrestricted free generator | singleton two free sides | generatorI, trace2, identity action | Neither parabolic nor hyperbolic; R01 |
| §5.3 finite index/presentation | singleton even/even versus even/odd | order2/infinite index versus full group/index1 | R01; positive-area check necessary |
| §5.3 subgroup realization | full, Γ₀(2), Γ(2) symbols | indices1,3,6 and 6r+3e₂+4e₃=7,9,12 | Correct examples; absent headline R13 |
| §5.3 moves | renaming free1 to free2 | matrices and group identical; raw labels differ | Relabeling works; complete move claim not certified from Kulkarni |
| §5.4 genus and cusp classes | Γ₀(11); Γ(2) | (r,t)=(3,2),(2,3); genera1 and0; indices12 and6 | Correct |
| §5.4 width formula | Γ₀(11); index7 level12 | 3+1+3+1+3=11 plus1; (2+1,2+1+1)=(3,4) | Odd-side contribution essential |
| §5.5 conversion | full and Γ₀(2) symbols/triples | widths[1]↔[1];[1,2]↔[1,2], indices1,3 | Mathematical correspondence retained; R01/R15 |
| §6.1 cover degree/covolume | full; Γ₀(2) | fibre sizes1;3, areasπ/3;π | Stabilizer removal necessary at i |
| §6.2 branch-point normalization | Γ₀(2) | over0 one degree3 point; over1 degrees2,1; over∞ degrees2,1; each sum3 | Matches triple with product1 |
| §6.2 Riemann–Hurwitz | same cover | −2=3(−2)+(2+1+1) | Genus0 matches |
| §6.3 descent/automorphisms | index7 width3,4 and5,2 | monodromy S₇; centralizer1; two unequal cusp widths | Rational descent argument consistent, conditional on supplier theorem |
| §7.2 irregular strict period | irregular signed cusp widthh, odd k | strict period2h; translationh multiplies f by−1; only odd exponents in q_(2h) | Distinguishes geometric and strict widths |
| §7.4 Hecke normalization | Δ, p2, coefficientsa₁=1,a₂=−24 | a₁(T₂Δ)=−24=−24a₁(Δ) | Native arithmetic normalization agrees |
| §7.4 Berger consequence | index8 noncongruence, k4 | dimS4(Γ)=2; dimS4(Γᶜ)=0; factorized operator rank0 | Correct implication; primary source not readable |
| §7.5 algebraic parameter | full group t=1/j | q=t+744t²+… versus u·t; second coefficient744 versus0 | Fails as algebraic-parameter equality; R04 |
| §7.5 coefficient field | E4 and sqrt2·E4 | coefficients(1,240) in Q; (sqrt2,240sqrt2) in Q(sqrt2) | Common finite field possible; not every complex scalar algebraic |
| §8.3 centered ASD, d1 | Δ, k12,p2,m1 and2 | −24−(−24)·1=0;−1472−576+2048=0; bounds2⁻¹¹,2⁻²² | Correct recurrence indexing/sign on a congruence test |
| §8.3 d0/invalid index | zero cusp space; m1,p2 | polynomial1; all a_m=0; a_(1/2)=0 | No 0/0 or negative-index invention |
| §8.4 applicability | width3,4 or5,2 versus mirrored1,6 | unique respective width class; two classes for1,6 | Distinguishes rational-descent claim; not an independent proof of all arithmetic inputs |
| §9.1 coefficient rescaling | coefficientsb_m=1, u=1/2 | a_m=2⁻m has unbounded denominators; b_m integral | Roadmap correctly distinguishes stored b_m from actual a_m |

The controls include nonabelian S₃, cyclic C₂/C₃, characteristic 2/3, the zero ring, identity maps and infinite-index zero values. DVRs, fans and nonreduced schemes are not inputs of these signatures.

### Seeded source audit

All 23 referenced works were attempted through the sources service. Nine were obtained as legal texts; fourteen remain wholly or partly uncertified as listed below. No README locator was explicitly flagged “unverified”. The 15 mandatory sampled targets were checked as follows; an alternate source or supplier check is explicitly distinguished from verification of the cited primary page.

| Sampled target | Text/locator opened and support | Outcome |
|---|---|---|
| 0.4 Lifts/projective index | Native `Subgroup.index_comap_of_surjective`, `index_map_eq`, and center quotient; Γ(3) index24→12 | Correct index assertions; README has no external locator at this target |
| 1.2 Millington | bmr-computation line 214, Theorem2.7, p.4; kurth-long line391, §4, pp.8–9 | Marked action correspondence supported; original Millington Theorem2 not readable; BMR cusp-count misprint not adopted |
| 2.1 Cusp widths/count | kurth-long line354, §3.4 p.8 and §4 pp.8–9; native cusp datum | Cycles/widths supported; arbitrary scaling refuted; Diamond–Shurman/Shimura pages uncertified |
| 2.3 Genus | kurth-long line384, §3.4 p.8, Euler-characteristic computation; native permutation genus | Formula supported and numerically tested; cited DS Theorem3.1.1/Shimura Prop1.40 not read |
| 3.1 Level | ksv line169, §3 p.4; hamilton-loeffler line21, Theorem1 p.1 | Signed versus strict distinctions supported; source gives level N or2N for odd lifts |
| 3.3 Wohlfahrt | ksv line198, Proposition3 proof pp.5–6; line262 Remark8 | Projective statement and sign-sensitive extension supported; original Wohlfahrt PDF blocked |
| 3.5 Order obstruction | hsu line100, Theorem2.4 p.1353; finite quotient cardinalities | Correct for SL₂/{±I}; native PSL₂ wording false at8,12 |
| 5.2 Generators | kurth-long line330, Theorem3 §3.3 p.7, referring to Kulkarni Theorem6.1 | Matrices agree up to central sign; README §2 locator wrong; Kulkarni primary not read |
| 5.3 Kulkarni | kurth-long line199 Theorem1 and line203 Theorem2, p.4; Definition4 p.7 | Special-polygon theorem and existence supported; does not justify degenerate data; original Theorems3.2–3.3 not read |
| 5.4 Farey invariants | kurth-long line354, §3.4 p.8 | Genus/index/cusp rules support admissible examples; §2 locator wrong |
| 5.5 Conversion | kurth-long line460 §5.1 pp.9–11; line703 §5.3 p.13; §4 permutation description | The construction is not at the cited §§3–4 alone; no certification of the entire claimed move equivalence |
| 6.1 Free-locus covering | FuchsianOrbifolds Layer0(5), main README; native compactified maps | Correct free-locus and finite-degree specialization; no primary theorem/page supplied here |
| 6.2 Belyi monodromy | bmr-database line87, §2.2 p.2; BelyiMaps Layers5–6; FuchsianOrbifolds Layer6 | Belyi-map assertion supported; precise peripheral-loop identification is this roadmap’s new proof obligation |
| 7.2 All cusp expansions | native `ModularForm.translate`, `qExpansion`, strict periods; FuchsianOrbifolds Layer3 | Carrier/strict-width convention supports statement; external DS pages unavailable |
| 7.3 Dimensions | ModularForms main Layer10B–10C; explicit k2,4,12 tests | Supplier’s RR route and odd-weight distinction resolved; DS Theorems3.5.1/3.6.1 uncertified directly |

Additional source checks: cdt line25 (published Theorem1.0.1, p.627) and line3500 (Remark6.3.1, pp.685–686) support the denominator conclusions, using `q=exp(πiτ)` rather than the roadmap’s `exp(2πiτ)`; increasing the allowed root denominator reconciles them. The published numbers agree with the claimed numbers, although the exact v4 PDF was not obtained. hsu lines143–173 (Theorem3.1, pp.1353–1354) and hamilton-loeffler lines79–102 (preprint p.2) support the three parity branches, including the squared central element in the signed version. li-long lines148–154 (p.4) reports Berger’s factorization; lines166–192 (p.5) provide the even-weight Scholl hypotheses and centered congruence. li-long-yang lines34–54 (pp.1–2) supports the rescaled arithmetic coefficients; its main odd-weight example is not a proof of the roadmap’s unrestricted odd-weight generalization.

### Pin and ownership audit

The following native definitions/results were opened, not inferred from declaration names. Paths are relative to their respective pinned libraries.

| Object | Declaration and file at pin | What it supplies / does not supply |
|---|---|---|
| Projective group | `Matrix.ProjectiveSpecialLinearGroup`, `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33`; `SpecialLinearGroup.mem_center_iff`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:256` | Full-center quotient, not a universal sign quotient |
| Index transport | `Subgroup.index_comap_of_surjective`, `Mathlib/GroupTheory/Index.lean:66`; `index_map_eq`, `:335` | Surjectivity and kernel containment are explicit |
| Map/comap | `Subgroup.map_comap_eq_self_of_surjective`, `Mathlib/Algebra/Group/Subgroup/Ker.lean:465` | One-tactic padding witness |
| Finite order | `orderOf_pos`, `Mathlib/GroupTheory/OrderOfElement.lean:1006` | Finite cancellative carrier supplies positive order |
| Triple carrier | `PermutationTriple.IsConnected`, `TauCeti/Combinatorics/PermutationTriple/Basic.lean:427` | Nonzero degree AND transitive monodromy; excludes empty-action vacuity |
| Triple genus | `PermutationTriple.genus`, `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:204` | Truncated integer formula; connectedness is needed for geometric interpretation |
| Coset dictionary | `TriangleGroup.cosetTriple`, `TauCeti/GroupTheory/TriangleGroup/PermutationRepresentation.lean:221`; `isConnected_cosetTriple:251`, `comap_stabilizer_toPerm_cosetTriple:257`, `ker_toPerm_cosetTriple:265` | Generic action dictionary already supplied; arithmetic identification of triangle group remains here |
| Cycle partitions | `Equiv.Perm.fullCycleType`, `TauCeti/GroupTheory/Perm/Partition.lean:96`; sum:340, positivity:346, conjugation:392 | Includes fixed points; generic API should be consumed |
| Cusp normalization | `Subgroup.CuspDatum`, `TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.lean:167` | Scaling, primitive stabilizer generator, positive width and conjugation law; width not intrinsic without scaling |
| Integer width | `Subgroup.integerCuspWidth`, `TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean:143` | Arithmetic integer period; do not confuse arbitrary real scaling |
| Forms | `ModularForm`, `CuspForm`, `Mathlib/NumberTheory/ModularForms/Basic.lean:72`, `:80`; odd vanishing:222 | Holomorphic and bounded/vanishing at all group cusps; does not itself assert arithmeticity or finite index |
| Fourier coefficients | `UpperHalfPlane.qExpansion`, `Mathlib/NumberTheory/ModularForms/QExpansion.lean:171`; `hasSum_qExpansion:194` | Series exists for arbitrary function; analytic equality needs positive period, periodicity, holomorphy and boundedness |
| Slash convention | `Mathlib/NumberTheory/ModularForms/SlashActions.lean:90`, `:142` | Arithmetic determinant exponent k−1, agreeing with the stated Hecke test |
| Sturm/finiteness | `TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z`, `TauCeti/NumberTheory/ModularForms/SturmBound.lean:87`; finite-dimensional instances:118,146 | Finite-index/arithmetic hypotheses retained |
| General Hecke action | `HeckeRing.GL2.heckeSlashModularFormEnd`, `TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean:127`; cusp action:138, coset sum:162 | Arbitrary arithmetic group, finite decomposition, positive determinant; no congruence assumption |
| Compactified maps | `compactifiedQuotientMap`, `TauCeti/Analysis/Complex/Fuchsian/Compactification/Map.lean:34`; `compactifiedQuotientFiniteHolomorphicMap`, corresponding `FiniteHolomorphicMap.lean:38` | Native compactification/map carriers exist; do not list all of Layer6 as lacking every carrier |
| Level-one sphere | `jBiholomorph`, `TauCeti/Analysis/Complex/Fuchsian/LevelOne/Sphere.lean:175` | The level-one analytic sphere identification has a native carrier |

Ownership was searched by object using the roadmap tools, main, supplied sibling heads and board packages. Existing-roadmap revisions were not used as suppliers. No fully qualified namespace collision was found.

Resolved supplier families (eight, with additional scope-only names):

- **FuchsianOrbifolds:** main `TauCetiRoadmap/FuchsianOrbifolds/README.md:193` Layer0, `:235` Layer2, `:263` Layer3, `:286` Layer4, `:311` Layer5 and `:344` Layer6. These actually supply the action, polygons, scaled cusp data, compactification, degree/Riemann–Hurwitz and level-one sphere used here. Its width law contradicts R02’s unqualified comparison.
- **ModularForms:** main `TauCetiRoadmap/ModularForms/README.md:93` arithmetic slash; `:1068` Layer10B and `:1119` Layer10C, including analytic/topological genus comparison at `:1097`. Its general valence/Petersson route and congruence dimension boundary agree with the intended extension here; the pinned Hecke implementation is already more general than that scope paragraph. The unresolved-name scanner’s genus-comparison warning is not a missing-owner finding: it is a named future supplier target, not asserted compiled API.
- **BelyiMaps:** main `TauCetiRoadmap/BelyiMaps/README.md:54` explicitly retains Layers8–11 as specifications for BelyiAnalyticCovers and BelyiAlgebraicAndDescent; those layer specifications start at `:2568`, `:2833`, `:3282`, `:3582`. The target acknowledges that boundary. The section references for analytic pair/existence, algebraization/descent and fields of moduli/definition resolve there. Generic triples, dessins and monodromy are imported rather than replaced.
- **PolynomialGaloisGroups:** main `Completed/PolynomialGaloisGroups/README.md:35` and `:57` resolves only the low-degree contract; R08 records the drift. The PartII checkout was searched too; it does not repair the cited nonexistent Layer1D on main.
- **AlgebraicModularFormsAndSerreWeights:** current new-roadmap text §2.9 resolves the intended rational theorem; R07 records the wrong section and namespace. This source is a roadmap statement, not a Tau Ceti pin declaration.
- **UniversalCovers:** main `Completed/UniversalCovers/README.md:98`, Stage2 milestones7–8, supplies pointed subgroup/unpointed conjugacy classification; §6.1 here specializes the modular free locus.
- **FreeGroupsAndLimitGroups:** main §4.11, `README.md:1013`, supplies Kurosh and avoids an implicit second foundational proof route for §0.3.
- **ModularFormsPartII:** board design W1/W6 supplies the ownership evidence in R10; it is distinguished from a main/open exported roadmap. No declared gap exists in this package to bridge a missing export.

AdelicImagesAndModularCurves, HyperellipticCurves and the elliptic-curve roadmap are scope/consumer boundaries, not permission to pull later prerequisites upward. The analytic/form dimensions and coefficient arithmetic are specialized to finite-index modular groups here; generic Riemann surfaces, Belyi descent, cycle partitions and general Hecke endomorphisms have earlier owners. In the resolver’s other leads, `FareySymbol.cuspClasses` is an intended local target, and `ComputedInvariants` is a real module name, not a missing declaration. Neither is reported as an absent supplier.

### Headline coverage

| README headline | Acceptance-file status |
|---|---|
| PSL₂(ℤ) free-product/triangle identification and torsion/freeness consequences (§0.3) | Injectivity/equivalence, torsion, free basis and abelianization stated; generic inputs need exact contracts |
| Millington classification (§1.2) | Both directions stated on native triples/subgroups |
| Cusp/elliptic dictionary and genus (§§2.1–2.3) | Cusp count/period and combinatorial genus stated; native compactification means analytic comparisons need individual statability assessment |
| Wohlfahrt and level/closure obstructions (§3) | Stated; earlier ownership R10 and finite quotient R03 must be fixed |
| Hsu and signed extension (§4) | Both stated; numerical relators checked; remove algorithm-development packaging |
| Kulkarni finite-index/existence/presentation and Farey invariants (§5) | Missing while matrix data are kept; finite-index/existence statable with simple subgroup definition after R01 (R13) |
| Belyi map/monodromy/descent (§6) | Omitted by a blanket layer reference. No native bundled algebraic Belyi pair found in pin search; compactified maps and level-one sphere do exist. Docstring must identify each unavailable carrier separately |
| All-cusp expansions, dimensions, coefficient fields (§7) | Expansions, even dimensions and coefficient-field theorem stated; odd dimensions omitted (R13) |
| Berger’s trace factorization (§7.4) | Omitted; native Hecke operator exists (R11), so “operator not seeded” is not a carrier explanation |
| All-prime bounded denominators and CDT (§§8.1–8.2) | Number-field and rational CDT targets stated on native forms; exact ownership/contract repairs R07/R10 |
| Scholl simultaneous ASD congruences (§8.3) | Omitted because of algebraic Belyi model hypothesis; this is a meaningful missing-carrier reason, but does not discharge proof ownership R06 |
| Intrinsic signature/prefix (§9) | Present, but invariance wrappers and fixed examples are not additional deep headlines |

## Not verifiable

No missing text was treated as verified, and the review was not parked. The source requests are consolidated in `needs-references.toml`; successful Kurth–Long and Hsu retries were removed from that request list. The source manifest is absent in the reviewed folder and was not edited. The following 14 works remain unavailable for direct primary-locator certification:

- **diamond-shurman:** Springer DOI classified paywalled by the service; genus, cusp and dimension locators remain uncertified. The supplier text and explicit computations were checked instead.
- **scholl:** Springer DOI classified paywalled; the author homepage lookup timed out. §§1–2 and §5 were not read. In particular the complete arithmetic-model requirements for all odd weights are not certified by the accessible survey’s even-weight passage.
- **millington:** Wiley DOI returned HTTP403; Oxford’s article page requires access. BMR cites Theorem2, but the primary theorem/page was not inspected.
- **wohlfahrt:** Project Euclid landing page yielded no PDF; a second fetch returned a firewall page, not the article. KSV’s elementary proof and its account of Wohlfahrt were read instead. The firewall text was not accepted as a mathematical source.
- **kulkarni:** JSTOR landing page, no verified legal open full text. Kurth–Long’s Theorems1–3 quote the relevant theorem numbers but do not certify Kulkarni’s entire move-equivalence claim.
- **atkin-swinnerton-dyer:** AMS volume/DOI landing page; no accessible full article obtained.
- **berger:** author/title search through the service found no legal full text. Li–Long’s report of trace factorization was read, not the primary proof or every normalization hypothesis.
- **jones:** Cambridge chapter landing page; no open full text obtained.
- **long:** DOI redirected to an access/login service; no open full text obtained.
- **serre:** bibliographic search through the service found no legal full text of Trees.
- **alperin:** bibliographic search through the service found no legal full text of the Monthly article.
- **shimura:** DOI resolution led to a JSTOR item without an accessible book; §§1.6/3.5 were not inspected.
- **girondo-gonzalez:** Cambridge book landing page, no open full text; Theorems2.31/2.34 not directly certified.
- **katok:** bibliographic search through the service found no legal full text; Chapters3–4 not directly certified.

The primary Scholl/Berger and full Kulkarni equivalence claims are therefore not classified as proved sound. The KSV lift example was read, including its eight sign choices, but its complete signed coset action was not independently reconstructed; that table row is explicitly source-based. There is no assertion here that small substitutions prove the general theorems. Ownership was checked against the supplied open-work files and indexed texts; no unavailable open work was guessed.

## Source issues

- **Gap** in kurth-long at Definition4 and its polygon construction, arXiv:0710.1835v1 p.7 (line282): the source says arbitrary listed pairing data produces a special polygon; it should exclude degenerate zero-area data such as the even/even singleton; affects a stated result.
- **Misprint** in kurth-long at §3.4, arXiv:0710.1835v1 p.8 (line373): the source says use γP for the width at the vertex sent to infinity by γ⁻¹; it should use γ⁻¹P; affects the proof.
- **Misprint** in hamilton-loeffler at the mixed-modulus presentation, arXiv:1307.0625v1 p.2 (line94): the source says invert 5 modulo m in the 2-primary factor; it should invert 5 modulo e; affects a stated result.
- **Misprint** in bmr-computation at Theorem2.7, arXiv:2207.13365v1 p.4 (line217): the source says the cusp count is the number of fixed points of σT; it should be the number of cycles, including fixed points; affects a stated result.
- **Error** in bmr-computation at equation(2.16), arXiv:2207.13365v1 p.3 (line155): the source says the half-order principal-index formula applies without separating small N; it should require N≥3 and give indices1 and6 for N=1 and2; affects a stated result.
- **Misprint** in bmr-database at equation(3.2), arXiv:2301.02135v1 p.3 (line132): the source says the integral of 2πif has coefficients −a_n/n in the width-h parameter; it should have coefficients −h a_n/n; affects a stated result.
- **Error** in ksv at Example18, arXiv:0905.4798v4 p.11 (line636): the source says the middle two displayed sign choices contain Γ(12); it should require equal signs on B and T, with the sign on A free; affects a stated result.

For the last item, the preceding condition is `δ₂=δ₃` and `TBA²=[[169,−36],[108,−23]]≡I mod12`; changing only B negates this word. The subsequent table’s congruence flags agree with the corrected condition. For the integration misprint, differentiation of the displayed series yields `−2πif/h`, while differentiation of the integral with variable lower limit gives `−2πif`. These source errors are kept separate from defects of the roadmap; the Hsu inverse and cusp-count mistakes were not copied into its definitions.
