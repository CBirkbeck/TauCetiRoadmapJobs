# Review of PadicDifferentialEquationsAndRigidCohomologyPartII (package, round 2)

**Verdict:** needs changes

Twelve findings: two P1, four P2, six P3. The roadmap's scope is repairable. The six earlier findings were checked first; their disposition is recorded below. No mathematical package file or source-manifest entry was changed by this review.

## R01 (P1) — The generic-field base-change input is not supplied at the cited section

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:254`: “§RD.0.54: the ring comparison for D'Addezio's”; also lines 203–205, 428–445 and MS.5.5.

**Claim.** RD.0.54 and RD.0.53 supply the comparison and injective multiplication used for D'Addezio's generic pair, just as for the local Robba pair.

**Witness.** Parent #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:2122,2148,2152`: complete residue coefficients are required; RD.0.54(c) is an equal-characteristic comparison. DAD line 511 uses residue `k(t)`; line 572 needs injectivity for that different pair.

**Exact repair.** Keep the generic theorem. Replace the unsupported assertion by a declared supplier gap, in both the README and `design/plan.json` gaps, owned by PadicDifferentialEquationsAndRigidCohomology RD.0.53/RD.1.72: for perfect `k`, `E = Frac((W(k)[t]_(p))^∧)`, its annular subfield `E†`, and DAD's algebraic fields of Definition 4.2.5, supply compatible Frobenius embeddings and injectivity of `E ⊗_(E†) E†_alg → E_alg`, with the comparison to the completed extended coefficients if used. Cite the gap in MS.0.4. RD.1.72 supplies the reverse filtration itself, but its proof's pointer to RD.0.54(c) does not supply this missing comparison. Test the distinction on `k = 𝔽_p`: the `t`-adic completion of `k(t)` is `k((t))`; the series `Σ t^(n!)` belongs to the latter and not the former. Merely replacing the generic field by its local completion changes the object and does not repair the input.

## R02 (P1) — The empty finite PBQ sum is asserted to be PBQ

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:598`: “a sum of finitely many PBQ submodules with the same maximal slope is PBQ”; repeated at lines 967–969.

**Claim.** The finite-sum closure statement includes every finite indexing set.

**Witness.** For the empty family, all member and equal-slope hypotheses hold, but the sum is `0`. MS.0.9, lines 572–576, explicitly makes `PBQ(0)` false.

**Exact repair.** Require a nonempty finite family in MS.0.10 and MS.2.4, retaining the same-slope hypothesis. Add the empty family as a negative-control Check. Retest: the empty sum has rank 0 and is not PBQ; one unit line has rank 1 and bounded quotient of slope 0; two unit lines have rank 2 and bounded quotient of the same slope 0.

## R03 (P2) — Numerical maximal-slope assertions need nonzero sources

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:431–434`: “`f : M → P` … whose restriction to `M†` is injective”; also MS.3.3 at lines 1147–1149 and MS.4.2 at lines 1373–1376.

**Claim.** These hypotheses suffice to assign `λmax(M)` and identify it with the target's numerical slope.

**Witness.** `M† = 0 → E(0)` and `M† = 0 → E(−1)` are injective, demanding respectively `λmax(0)=0` and `λmax(0)=1`. TSU line 1168 explicitly assumes a nontrivial source for Proposition 4.5.

**Exact repair.** Require `M† ≠ 0` in MS.0.4 and `N† ≠ 0` in the injective assertion of MS.3.3; require the isoclinic quotient `P ≠ 0` in MS.4.2 and whenever `slope(P)` is used numerically. State separately `Top(0)=0` and `S_min(0)=0` for the zero-object saturation/hull Checks, without giving zero a numerical extremal slope. Retest: both zero-source injections are excluded; the inclusion of the unit line into a two-dimensional unit-root target still gives `0=0` and `1≤2`.

## R04 (P2) — The local supplier uses a different slope normalization

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:121–122`: “`v_π(c)/v_π(q)` … Generic slopes … are those of §RD.1.35”; also line 1292.

**Claim.** The supplier's numerical slopes can be used unchanged under this convention.

**Witness.** Parent #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:3096`, normalizes `w(π)=1`. With `K=ℚ_p`, `q=p²`, `F(e)=p²e`, its slope is 2; this README's slope is 1.

**Exact repair.** Add the explicit dictionary `λ_MS = λ_RD / v_π(q)` for RD.1's local slopes, including the ramified case, and distinguish the supplier's additive slope twist from the Tate notation here. Transport reverse-filtration indices and numerical bounds through that dictionary. Clarify line 1292: iteration multiplies raw valuations by the iterate, but slopes remain unchanged when the denominator is updated from `v_π(q)` to `v_π(q^a)`. Add a two-line Check with Frobenius eigenvalues `1,p²`: raw slopes `(0,2)`, normalized slopes `(0,1)`; after squaring, raw `(0,4)`, normalized `(0,1)`. For ramification index 2 and `q=p²`, raw slope of `p²` is 4 and normalized slope is again 1.

## R05 (P2) — The affine convention excludes finite projective coefficient modules

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:117–120`: “a finite free module … Over a dagger algebra the same notion is an overconvergent F-isocrystal”.

**Claim.** Global freeness is part of the general affine dagger realization.

**Witness.** Parent #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:6333,6380`, supplies finite projective modules, not globally free ones. This package itself uses “finite projective” in MS.2.2, line 905.

**Exact repair.** Say finite free over the local fields and bounded-disc carriers, and finite projective over a general smooth affine dagger algebra; connections and invertible horizontal Frobenius linearizations remain required. Use local bases or projective direct summands in the global arguments. Add a Check that a nontrivial prime-to-`p` torsion line on an affine elliptic curve, with its finite-monodromy coefficient structure, is allowed without a global basis; local rank is 1 but a trivialization is additional data. The identity realization of a finite projective `M†` in MS.2.2(3) then retains `M†` on both sides, rather than silently replacing it by a free module. Do not restrict the curve theorems to curves with trivial Picard group.

## R06 (P2) — The final specified-map proof composes two arrows with the same direction

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:2088–2090`: “`π_m^*(h ∘ Top(g′))`”.

**Claim.** This is an endomorphism of `π_m^*Top(M)` to which the division-algebra argument applies.

**Witness.** Both `h` and `Top(g′)` have source `Top(N)` and target `Top(M)`. Their displayed composite is undefined for distinct objects. MS.6.11, line 2031, correctly uses an inverse.

**Exact repair.** Replace it by `π_m^*(h ∘ Top(g′)⁻¹)`, an endomorphism of `π_m^*Top(M)`. The remaining argument then proves `h` invertible. Test with labelled copies of a line and `g′(e_N)=2e_M`, `h(e_N)=3e_M`: the corrected endomorphism is multiplication by `3/2`, with inverse `2/3`; composing with `Top(g′)` recovers `3e_M`. Add this direction Check and sweep all reconstruction composites.

## R07 (P3) — The zero-factor Check names the wrong implication

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:629`: “For `U = 0` the reverse implication fails”.

**Claim.** `PBQ(M ⊗ U) → PBQ(M)` fails when the tensor factor is zero.

**Witness.** `PBQ(M⊗0)` is always false, so that implication is always true. For `M` the unit, `PBQ(M)=true` and `PBQ(M⊗0)=false`; the forward implication fails.

**Exact repair.** Change “reverse” to “forward” and explicitly take `M` to be the unit object. Keep `U ≠ 0` in the theorem. The truth values become `true → false` for the failed direction and `false → true` for the other direction.

## R08 (P3) — Connectedness does not make the constant horizontal sections equal to K

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1723–1724`: “both sides are `K`, since `X` and `C` are geometrically connected”.

**Claim.** The hypotheses of MS.5.8 imply geometric connectedness and this scalar identification.

**Witness.** Take `k=𝔽_p`, `X̄=ℙ²_(𝔽_(p²))` viewed over `k`, `Z=∅`, and `C̄=ℙ¹_(𝔽_(p²))`. Both are connected, smooth and projective; horizontal constants are the unramified quadratic `K₂`, of K-dimension 2.

**Exact repair.** Qualify only this Check by geometric connectedness, and add the constant-field-extension example: restriction is `K₂ → K₂`, an isomorphism, with dimensions `2=2`, not `1=1`. Preserve the general connected theorem and supplier gap.

## R09 (P3) — Endomorphism Checks confuse finite models with Q̄_p objects

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1973`: “all endomorphism algebras are `L` and the maps are identities”; also line 2059.

**Claim.** The unit's endomorphisms in the stated colimit category are the finite model field; arbitrary nonempty pullback gives an identity map.

**Witness.** For `X=Spec 𝔽_q`, `End(1)=Q̄_p`. For `Y=X ⨿ X`, `End(f^*1)=Q̄_p²`; pullback is the diagonal `a↦(a,a)`, injective but not an identity or surjection.

**Exact repair.** In MS.6.8 use a connected witness curve when claiming an identity, and write `Q̄_p` for endomorphisms in the colimit category (or explicitly restrict the Check to finite `L`-models). Add the disconnected-pullback Check above. In MS.6.12 use `End(M†)=Q̄_p`, or explicitly say the computation is on a finite model; require `c′ ≠ 0` as well as `c′ ≠ c` when calling `c′·id` an isomorphism. On a line, `c=1,c′=2` gives distinct isomorphisms; `c′=0` does not.

## R10 (P3) — The recorded library pins have moved again

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:162,188`: the two “pinned at” headings.

**Claim.** The hashes identify the libraries against which this package is checked.

**Witness.** `lake-manifest.json` now records Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, not the README's `f6090c70…` and `358314d4…`.

**Exact repair.** Update both headings to these actual pins. All ten cited Mathlib declarations were reopened at these pins and still exist; the new carrier in R11 must also be acknowledged. This is fresh pin drift after the previous F05 repair, not a claim that the repair worker used the wrong hashes then.

## R11 (P3) — The bounded-disc carrier is already present at the pin

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean:8–10`: “neither library has … the bounded-disc ring”.

**Claim.** A native carrier for bounded power series is absent.

**Witness.** `TauCeti/RingTheory/PowerSeries/Bounded.lean:63,81` defines `PowerSeries.HasGaussNorm.subring K 1` and identifies membership with bounded coefficient norms. `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` supplies the open-disc series carrier.

**Exact repair.** Remove the bounded-disc ring from the missing-carrier list; cite these existing carriers in Scope and the supplier contracts, leaving their Frobenius/differential-module structures and slope theory as missing prerequisites. No extra Lean declaration or import is needed in this empty acceptance file. Test the object identification: `Σ X^n` has coefficient bound 1 and belongs; `Σ p^(−n)X^n` has coefficient norms `p^n` and does not. This change does not make any full headline theorem statable.

## R12 (P3) — The manifest still points to deleted MS.5 targets

**Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/sources.toml:20,40,77,94`: `MS.5.10`, `MS.5.1-MS.5.11`, `MS.5.9`, `MS.5.11`.

**Claim.** These `cited_for` values identify targets of this package.

**Witness.** The repaired README's Layer MS.5 ends at MS.5.8. The actual owners are MS.5.6 for the affine-line reduction, MS.5.7 for the curve theorem, and MS.5.8 for docile restriction.

**Exact repair.** The fix worker updates TSU `MS.5.10→MS.5.7`, KED05 `MS.5.9→MS.5.6`, AE `MS.5.11→MS.5.8`, and DAD's range to `MS.5.1-MS.5.8`. Preserve source keys and retrieval evidence. Retest by resolving every explicit `cited_for` target/range against README headings: the three singleton references then resolve once each and the range has eight existing endpoints/targets. This reviewer leaves the author's entries untouched.

## Verified sound

### Previous findings, checked first

| Earlier finding | Repaired passage checked | Disposition |
| --- | --- | --- |
| F01: RD.3.50 drift | README:238, “§RD.5.8c: étale descent … on a smooth separated `k`-scheme `X` of finite type” | **Repaired.** All old RD.3.50 occurrences are gone. Parent #1002 RD.5.8c at line 8846 exists and states both consumed forms. |
| F02: opposite twist signs | README:128–130, “`E†(−1) ⊕ E†(0)` … have slopes 1 and 0” | **Repaired.** Recomputed all seventeen changed occurrences: top is the slope-one line, kernel is the slope-zero line. The independent supplier scaling defect is R04. |
| F03: unsupported affine–generic hull theorem | README:93–94, “affine–generic hull comparison … whose published proof has a gap”; README:1687, “Proof route (through the curve rank theorem)” | **Partly repaired.** The three targets and their proof dependency were deleted; the surviving curve proof uses MS.4.2. Internal references and Lean docstring were renumbered, but the manifest was not (R12). The retained generic theorem has the separate supplier defect R01. |
| F04: wrong extension eigenspace | README:273, “classified by the `π_p²`-eigenspace”; README:1061–1063, “the Frobenius-fixed part of … the twist” | **Repaired.** The gap and plan agree, the untwisted fixed part is zero, and the required eigenspace has dimension one. |
| F05: hashes | README:162,188 now contain `f6090c70…` and `358314d4…` | **Partly repaired at the present pins.** These are the requested earlier replacements, but both are now stale (R10). |
| F06: slope-indexed versus step-indexed S | README:130, “step-indexed `S_i` is distinct from … `S_(≤μ)`”; README:833, “`Sol_0 = S_(≤0)(Sol)`” | **Repaired.** On the log module the dimensions are 1 at slope bound 0 and 2 at slope bound 1; the first step always has dimension 1. |

No earlier finding was marked not actionable. No settled non-actionable finding is re-raised.

### Principles, shape and ownership

Read the entire 2,239-line README, all 68 target subsections and 68 `*Needs:*` lines, the 38-line Lean file, metadata and eight-entry manifest, and the plan's eight gaps. The roadmap extends the parent with PBQ, saturation, reconstruction and dagger-hull results; it does not re-plan the parent. The `p≡1 mod4` restriction is confined to a worked Legendre example, with the other congruence class a negative control; it does not restrict the general theorems. No computational algorithm, copied source passage, sorry'd data, `set_option`, or forbidden supplier was found in this package.

The seven layers have mathematical names, dependencies and ending Examples/Dependencies subsections. Their construction follows the mathematical needs of reconstruction: bounded quotients precede PBQ; PBQ and saturation feed curve recovery; coefficient and Lefschetz arguments feed the finite-field results. No assertion that the roadmap follows a source, or source-chapter layer heading, occurs. There are 18 definition/API blocks, with Check counts respectively `3,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,4,3`; R07–R09 identify Checks that still need correction. Every target has a source locator. Backticked mathematical notation was distinguished from claims to declare Lean identifiers: there are no claimed new Lean declaration names to resolve. No process dates, pull-request numbers, machine paths or HTML anchors occur in the roadmap or Lean docstring. The front matter and layer shape were compared with `TauCetiRoadmap/AlgebraicCurves/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/README.md` on main.

Ownership searches used `roadmaps grep` across main and the 435 indexed open heads for PBQ, pure bounded quotient, maximally bounded quotient, dagger hull, quasi-saturation, completed generic field, minimal slope and logarithmic growth. The PBQ/hull/saturation objects have no competing owner in those results. SatoTateGroups #1725, `TauCetiRoadmap/SatoTateGroups/README.md:888–901`, uses “Lefschetz condition” for a centralizer condition, a different object. Other growth hits concern modular forms, heights or polylogarithms, not this solution filtration. The supplied board-package index was read; its three entries do not concern these objects.

The closest heads were also inspected by scope: parent #1002; FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, README:53–94 (group schemes, Dieudonné and integral comparisons); PadicHodgeTheory #1062, README:8–21 (periods and geometric comparisons); VectorBundlesAndIsocrystals #1205, README:8–28 (curve/bundle classification); CrystallineCohomology #857, README:51–94 (crystalline and log-crystalline constructions). These own the supplied foundations, not the new PBQ reconstruction results. All paths here are under `TauCetiRoadmap/<named roadmap>/`. No duplicate fully qualified Lean name is possible in the empty target namespace. The supplied overlap report has no conflicting head, dropped cited id, or id defined only by an open revision; the renumbered MS.5 ids have no external consumer in the checked index. The manifest's internal references still require R12.

### Suppliers, pins and gaps

All 69 distinct explicitly cited parent section ids were matched against the head of #1002. Presence alone was not treated as mathematical sufficiency: R01, R04 and R05 record the problems found in their contents. The source's own completion and coefficient hypotheses were read. Other resolved contracts include:

| Contract | Current owner and locator | Content checked |
| --- | --- | --- |
| Local carriers, coefficient extension | parent README:673,1120,1370,1630 | bounded/Amice distinction, finite extension, derivation |
| Analytic coefficient embeddings | parent README:910,1597,1976,2120,2146 | completeness and valuation p-basis; generic mismatch is R01 |
| Slopes and reverse filtration | parent README:3030,3094,3131,3162,3203,3223,3247,4033 | raw valuation normalization; nonzero numerical slopes; corrected reverse grade |
| Frobenius/connection and Taylor transfer | parent README:1670,1794,2537,3282,3324,3346,4693,4893 | horizontality, lift change, logarithm and radius hypotheses |
| Dagger/convergent categories | parent README:5957,5973,6048,6133,6219,6331,6378,6404,6474,6604 | finite projective affine realizations; Tate `q^(−n)` |
| Gluing and finite étale transport | parent README:6641,6663,6690,6708,8846 | exactness, adjunction, trace and smooth-base descent |
| Slope-filtered opens, full faithfulness | parent README:6824,8693,8780,11227 | dense opens; local/global full faithfulness; subquotient closure |
| Curves and docility | parent README:8756,9309,10886,10995 | finite étale dense affine; projective lifting's geometric hypotheses; nilpotent residues |
| Trace, duality, weights | parent README:7541,10638,11440,11506,11961,12056,12830,12893,12923,13385,13454 | twists, `q^d`, signs, coefficient and realizability conditions |
| Existing boundaries of gaps | parent README:1559,4893,6913,12563,12938,13286,13454 | extensions requested below are additional contracts |
| Affinoid acyclicity | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434` on main | finite-cover Čech exactness and Tate acyclicity |
| Curve models | `TauCetiRoadmap/AlgebraicCurves/README.md:478,1468` on main | Dedekind/local-ring bridge and regular projective completion; perfect-base smoothness |

Parent line numbers refer to its README after removing the one-line display header added by `roadmaps show`; the section ids additionally identify each target.

The eight gap slugs match exactly between README and plan; their `needs` strings match after removing code delimiters. They have named ownership and specified hypotheses. None of these declared gaps is itself a finding:

- `extended-log-robba-growth`: logarithmic extended coefficients, embedding and eigenvector growth.
- `dejong-disc-robba-submodules`: saturated submodule descent with finite free quotient.
- `unit-root-correspondence-perfect-base`: fixed coefficient field and perfect-base extension of the existing correspondence.
- `legendre-kummer-extension`: the specific cohomology/eigenspace calculation, correctly twisted after F04.
- `irreducible-iota-purity`: beyond the parent's real objects on curves.
- `lefschetz-curves-irreducibility`: the finite-set, coefficient-linear restriction theorem.
- `docile-curve-restriction`: H⁰ restriction, beyond existence of log extensions.
- `coefficient-linear-weil-ii`: L-linear cohomological weight bounds.

These are precise additional supplier contracts, not unowned prerequisites. R01 concerns a ninth, undeclared input. No gap requests a computation algorithm.

The required dependency command completed with:

    depcheck: 234 roadmaps, 2110 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The parent is at merge-order line 121 and this package at line 236; the other two suppliers are on main. This mechanical result does not certify the mathematical content of a contract.

### Lean acceptance test and library duplication

`lake env lean <package Suggested.lean>` was run from the pinned content checkout: **exit 0, no output and no warnings**. The file has one `import Mathlib`, one module docstring, its namespace, and zero declarations. There are zero sorried theorems, zero data definitions, zero instances and zero section-variable binders. Consequently the one-tactic probe and the `#check @name` signature comparison each have zero cases; no placeholder was invented to make a probe possible. No Tau Ceti import needed building. No Lean process was left running.

The README's substantive headline groups are all named in the docstring:

| Headline | README targets | Docstring lines | Missing structure at the actual pins |
| --- | --- | --- | --- |
| Bounded splitting, PBQ filtration, growth comparison, local reconstruction | MS.0.7, MS.1.1, MS.1.8, MS.3.7 | 25–28 | Amice/Robba differential Frobenius modules, their slopes and solution comparison |
| Curve PBQ filtration and rank theorem | MS.2.5, MS.4.2 | 22–24 | curve isocrystals, completed generic modules and bounded quotients |
| Curve specified-map and minimal-slope dual | MS.4.6, MS.4.8 | 15–19 | convergent/overconvergent coefficient categories and their extremal pieces |
| Minimal slope property on curves | MS.5.7 | 20–21 | dagger hulls in those categories |
| Docile Lefschetz full faithfulness | MS.5.8 | 32–33 | docile coefficient categories and geometric restriction |
| Finite-field existence and specified-map theorem | MS.6.13, MS.6.14 | 29–31 | coefficient-linear isocrystals, fibres, slopes and Lefschetz data |

No complete headline becomes statable merely from the bounded-disc carrier found in R11. An empty acceptance file remains appropriate after its inaccurate absence claim is repaired. No padding, bounded substitute or unstatable `Prop` field occurs.

Opened declarations at Mathlib `1b1ccf4b…`:

| Declaration | File and line | Actual assumptions/content checked |
| --- | --- | --- |
| `LinearMap.quotKerEquivRange` | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | ring, additive groups and modules; quotient/kernel equivalence |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id` | `Mathlib/RepresentationTheory/Invariants.lean:126,131,137` | finite group and invertible group cardinality, line 121 |
| `LinearMap.trace`, `trace_one` | `Mathlib/LinearAlgebra/Trace.lean:75,190` | total trace definition; finite free assumptions at line 168 for the rank identity |
| `Padic.norm_p_pow` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | natural powers, prime p, norm `p^(−n)` |
| `FixedPoints.subfield` | `Mathlib/FieldTheory/Fixed.lean:103` | fixed points of a monoid semiring action form a subfield |
| `WittVector.Isocrystal`, `isocrystal_classification` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113,179` | module and Frobenius-semilinear equivalence; classification assumes algebraically closed residue field and finrank 1 |

The native Isocrystal structure contains no connection or finite-dimensionality field. It does not supply the differential or scheme coefficient objects here. Object searches at Tau Ceti `2fd255d9…` found bounded/open-disc series (R11), dagger differential-form infrastructure, and Amice **transforms of measures**; the latter are not the Amice **field**. No native convergent/overconvergent F-isocrystal category or PBQ/saturation reconstruction theorem was found. The ten named Mathlib imports are cited rather than redeclared.

### Sources and the seeded sample

The seeded target is **MS.6.1, Lefschetz condition**. Opened TSU lines 1456–1463, §6.3, printed page 28: the base is separated of finite type, `α` is closed, the object is irreducible, and the witness consists of a smooth curve, a morphism, a `k(α)`-rational point above `α`, and irreducible restriction. README:1745–1754 includes these hypotheses. Taking the connected component through the marked point gives the connected witness formulation for a nonzero irreducible restriction. The explicit identity-curve test below checks the residue field condition, rather than just containment of the point in the image.

Reopened repaired source passages: TSU lines 1111–1146 (§3.9, printed pp. 21–22; Legendre slopes and extension), OHK lines 1925–1944 (Proposition 7.5, Theorem 7.6(ii), Proposition 7.7, printed pp. 36–37; growth shift and solvability), and DAD lines 627–660 (Proposition 4.2.12 proof, printed pp. 16–17; the failed compactness bound). Also read DAD lines 511–589 (generic coefficients, dual image and opposite slope bound), TSU lines 754–875 (generic intersection, bounded quotient and PBQ), 1153–1195 (saturation and the nonzero-source hypothesis), 1468–1505 (Lefschetz consequences), and 1923–1952 (finite-field headlines). The earlier review's computed cases were reused only where still applicable and were supplemented by the cases below; its prose-only “sound” summaries were not treated as a proof.

The six accessible works and two settled uncertified works are all represented by unique manifest keys. No author-flagged unverified accessible locator was found. No additional source was needed or fetched. The specific publication-version limitations are listed below.

### Computed adversarial table

The following compact ledger covers all 68 targets, with separate rows where a finding touches a convention or Check. It records calculations and negative controls, not a claim that finite examples prove the theorems. `L_s` means a constant line with Frobenius slope s; `Log` is the rank-two module with `∇e₂=e₁ dt/t`, `F(e₁)=q⁻¹e₁`, `F(e₂)=e₂`. The corrected q-normalization is used in numerical rows. “Retain” means no change identified by that calculation.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions 1–4 | `q=p²`, ramification `e=1,2` | `v_π(q)=2,4`; raw slope of F=q is `2,4`; normalized slope `1,1` | R04 dictionary |
| Convention 4 dual/twist | `O(1)⊕O(0)` | slopes `−1,0`; dual slopes `1,0`; `Top(M^∨)=O(−1)=S_min(M)^∨` | F02 repaired |
| Conventions 5–11 | zero; ordinary rank-two on ordinary locus | zero has 0 slopes; ordinary fibres have `0,1`; unit's solution eigenvalue `1⁻¹=1`; zero has `B=0`, PBQ false | R03 defines zero extremal objects |
| MS.0.1 | affine line, local origin | residue fields `k(x)` and `k((x))`; lacunary coefficients `1` at factorial exponents are not rational | distinct fields retained |
| MS.0.2 | unit, zero, Log, rank-one F=a | solution dimensions `1,0,2`; bounded dimensions `1,0,1`; log coefficient at `p^r` has norm `p^r`; solution F=`a⁻¹` | retain |
| MS.0.3 | `W(𝔽̄_p)[1/p]`; `ℚ_p(√p)` | fixed fields `ℚ_p`, `K`; slope `v_p(√p)=1/2`; twist product `√p/√p=1`, slope 0 | retain ramified case |
| MS.0.4 | unit→unit²; zero→L₀ and zero→L₁ | ranks `1≤2`, source span rank 1; zero injects into both, demanding extremal slope both 0 and 1 | R03; generic input R01 |
| MS.0.5 | zero, unit, Log | `(rank Mᵇ,rank B)=(0,0),(0,1),(1,1)`; bounded-solution dimensions `0,1,1` | retain |
| MS.0.6 | Log; `L₁⊕L₀` | log sub/quotient slopes `−1,0`, difference 1, unbounded coefficient norms `p^r`; split difference `0−1=−1` | F02 repaired |
| MS.0.7 | zero, L₁⊕L₀, Log | split slope ranks `0`, `1+1=2`; Log has unbounded norm sequence and no primitive of `dt/t` in E | both directions separated |
| MS.0.8 | identity and coefficient extension of Log | bounded quotient ranks `1=1`; coefficient norms of `1/p^r` remain `p^r` | retain |
| MS.0.9 | zero, unit, split, Log | PBQ values `false,true,false,true`; bounded quotient slope sets `∅,{0},{0,1},{0}` | retain |
| MS.0.10 | split quotient; empty sum | maxima `1` versus quotient `0`; empty sum rank 0, claimed PBQ versus false | R02 |
| MS.0.11 | M=unit, U=zero; U=unit | tensor ranks `0,1`; PBQ pair `true,false` in zero case, `true,true` in unit case | R07 implication direction |
| MS.1.1 | zero, L₁⊕L₀ | filtration lengths `0,2`; grade maxima `(1,0)`, nested maxima `(1,1)` | retain grade convention |
| MS.1.2 | split and Log | bounded slopes `{1,0}={1}∪{0}`; Log `{0}={0}`; nested-term formula would give `{1,1}` | retain |
| MS.1.3 | split under finite coefficients | grade ranks `(1,1)=(1,1)` and maxima `(1,0)=(1,0)` | retain |
| MS.1.4 | E† split lines | descended first step rank 1, slope 1, equals E†(−1); quotient rank 1, slope 0 | F02 repaired |
| MS.1.5 | unit disc line; zero | first filtration lengths `1,0`; ranks of descended/completed line `1=1` | retain conditional on declared gap |
| MS.1.6 | constant, log, negative λ | constant bound 1; log `|a_(p^r)|=p^r`, ratio to `(p^r+1)^λ` diverges for λ<1; negative class 0 | retain |
| MS.1.7 | Log eigen-solutions | `(μ,growth)=(0,0),(1,1)` with λmax=0; `0≤0`, `1≤1`; at λ=0 slope-one vector excluded | retain |
| MS.1.8 | Log, λ=−1,0,1 | dimensions of growth and slope-bound spaces `(0,1,2)=(0,1,2)` | F06 repaired |
| MS.1.9 | rank-one F=a; split F=diag(1,q) | solution/quotient eigenvalues `a⁻¹,a`; split solution slopes `0,−1`, so not isoclinic/PBQ | retain |
| MS.2.1 | unit, zero, split lines | PBQ generic values `true,false,false`, unchanged on nonempty opens | retain |
| MS.2.2 | lacunary `Σp^n x^(p^n)` | at origin bounded; at infinity norm terms `p^(−n)ρ^(−p^n)→∞`; polynomial x regular at all finite points | boundary condition essential |
| MS.2.3 | zero, full, rank-one F=q | glued ranks `0`, `rank M`; pre-twist slope 1, after `q⁻¹` twist slope 0 | retain |
| MS.2.4 | two unit subobjects; empty family | nonempty sum has only slope 0 and rank 1 or 2; empty sum rank 0 and PBQ false | R02 |
| MS.2.5 | split and irreducible line | filtration lengths 2 and 1; grades `(1,0)` and `(0)` | retain |
| MS.2.6 | Artin–Schreier degree-p cover | pullback unit rank 1, pushforward unit rank p, all slopes 0 | retain, wild boundary allowed |
| MS.2.7 | split; ordinary Legendre on U | bounded quotient ranks 2 and 1; latter slope 1; whole Legendre rank 2, so quotient cannot be overconvergent | retain |
| MS.2.8 | p=5, eigenvalues `−3±4i` | complex norms 5; neither equals 1; fixed space dimension 0, selected eigenspace dimension 1; twisted selected eigenvalue 1 | F04 repaired |
| MS.3.1 | zero, line, split | top-map kernel ranks `0,0,1`; saturated `true,true,false` | retain after R03 convention |
| MS.3.2 | E†→E; E†→E²; `(a,b)↦a+αb` | E-span ranks `1,1,1`; target ranks `1,2,1`; last linearization kernel rank 1 | retain carrier distinction |
| MS.3.3 | projection L₁⊕L₀→L₀; zero injection | source maximum 1 versus 0, kernel rank 1; zero-source slope undefined | R03 |
| MS.3.4 | zero, isoclinic, split | saturation ranks `0,r,1`; split saturation L₁, not rank-two enlargement | retain |
| MS.3.5 | unit Jordan block over finite k | horizontal splitting coefficient c constant, `c−σ(c)=0≠1`; PBQ/saturated true, irreducible false, top rank 2 reducible | retain |
| MS.3.6 | same split on both sides | bounded grade slope multiset `{1,0}` on both sides, recovered block maps `1,1` | retain |
| MS.3.7 | Log versus unit | top ranks `1=1`, whole ranks `2≠1`; Log fails saturation | saturation required |
| MS.3.8 | unit, zero, split on every dense open | section-map kernel ranks `0,0,1` | retain |
| MS.3.9 | Log, Legendre extension, split | `(PBQ,sat)=(true,false),(false,true),(false,false)`; raw iteration scales 1→a, normalized slope 1→1 | R04 iteration wording |
| MS.3.10 | zero, line, split | saturated quotient ranks `0,1,1`; split kernel rank 1 | retain |
| MS.4.1 | equal top and target ranks | `rank Top−rank P=1−1=0`, strict hypothesis false; no nonzero kernel forced | retain |
| MS.4.2 | identity line; split projection; zero→zero | ranks `1=1`; split maxima `1≠0`, section kernel rank 1; zero numerical slopes undefined | R03 |
| MS.4.3 | line, split, Log | triples `(PBQ,sat,irreducible top)` equal `(T,T,T),(F,F,T),(T,F,T)`; whole irreducibility `T,F,F` | retain |
| MS.4.4 | split with identity h | bounded ranks `2=2`, two saturated grades rank 1 each; recovered maps identity | retain |
| MS.4.5 | Log and Legendre extension | sub/top maxima `−1<0` versus `1>0`; total ranks 2 versus 3; PBQ/sat as in MS.3.9 | retain |
| MS.4.6 | line, h=2·id; h=0; Log versus unit | lifted scalar 2; zero cannot lift to an isomorphism; rank mismatch `2≠1` without saturation | retain |
| MS.4.7 | split projected to L₀ | kernel slope 1, quotient slope 0, required `1<0` false | retain |
| MS.4.8 | O(1), dual, scalar map | slopes `−1→1` under dual; double dual scalar `2→2→2`; arrow reverses twice | retain |
| MS.5.1 | zero; ordinary line N in rank-two irreducible | hull ranks `0`, `2` whereas rank N=1; idempotent hull rank `2=2` | retain |
| MS.5.2 | ordinary line and zero | first-step ranks `1=1`, zero `0=0`; hull rank 2 is not confused with first-step rank 1 | retain |
| MS.5.3 | n=2, N=L₀⊕L₁ | induced N rank 4, induced first-step rank 2; formula using whole N would give 4 instead of 2 | retain |
| MS.5.4 | N=0, N=M | dual image ranks 0 and rank M; dual image hulls 0 and M | retain |
| MS.5.5 | extendable line in split module | hull=N, first-step ranks `1=1`; residue rational field differs from Laurent completion | R01 supplier bridge |
| MS.5.6 | y↦y^p−y; identity | derivative `−1`, degree p, ramification at infinity p; identity degree 1 | retain wild case |
| MS.5.7 | ordinary line; proper curve | first steps `N=N`, ranks 1; proper hull=N, both first steps identical | deletion did not remove curve proof |
| MS.5.8 | constant field extension; Dwork control | constants `K₂→K₂`, dimensions `2=2`; Dwork `H⁰` dimensions `0→1` on x=0 | R08 constants; docility essential |
| MS.6.1, sampled | smooth curve identity; degree-two point | marked residue map `k(α)→k(α)` identity, residue degree `2=2`; rank-one pullback rank `1=1` | locator and witness verified |
| MS.6.2 | N=M⊕L, lower-slope L | maximal PBQ piece rank `rank M`; induced surjection/injection identity on M | retain |
| MS.6.3 | common curve, two rank-one objects | inequalities `1≤1≤1`, fibre eigenvalues `a=a` | retain |
| MS.6.4 | unit-root line; L₁ identity control | first all slopes `0=0`; control source/target slope `1=1`, not unit-root | retain |
| MS.6.5 | degree-two coefficients | underlying K-rank 2, coefficient rank `2/2=1`; extension to L-degree 4 gives `4/4=1`; forgotten-action tensor rank differs | retain finite-model distinctions |
| MS.6.6 | Spec 𝔽_q, F=2, n=2; smooth d=1 unit | both trace sums 4; duality pairs eigenvalues `1` and `q`, product q | retain |
| MS.6.7 | involution swapping (2,4) | average `(3,3)`, invariant; projector trace 1 versus identity trace 2; projected total 2 versus unprojected 4 | retain |
| MS.6.8 | point pulled to two points | End unit `Q̄_p→Q̄_p²`, `1↦(1,1)`; kernel 0 but `(1,0)` not in image | R09 |
| MS.6.9 | Spec 𝔽₃, F=2 | `w=2 log₃2`, `3^(w/2)=2`; w is not integral since `3^w=4` | retain real weights |
| MS.6.10 | rank-one identity; unequal eigenvalues | pole of `(1−t)⁻¹` at 1; for d>0 top eigenvalue q^d and lower weights give modulus `<q^d`; a≠b gives different local factors | retain |
| MS.6.11 | g′=2, h=3 on labelled lines | `Top(g′)⁻¹h=3/2`, then `g′τ=3`; average of identical lifts stays 3 | retain corrected source composition |
| MS.6.12 | scalar isomorphisms 1 and 2, zero control | all nonzero scalars invertible; induced h=1 distinguishes 1 from 2; zero has rank 0 | R09 finite-field wording and c′≠0 |
| MS.6.13 | curve and rank-one case | top rank `1=1`; nonzero scalar a lifts to same a | retain |
| MS.6.14 | labelled lines, g′=2, h=3 | written composition not typed; `h Top(g′)⁻¹=3/2`, inverse 2/3 | R06 |
| Deleted affine–generic proof | A₁ in W⟨u⟩ | `p^j u^j∉pA₁`, norm `p^(−j)→0`; asserted positive infimum versus actual 0 | F03 deletion justified |
| Current bounded-disc pin | ΣX^n; Σp^(−n)X^n | coefficient suprema `1`, `∞`; native bounded carrier accepts first and rejects second | R11 |

Excluded hypotheses were also checked: q=1 is excluded by `q=p^s,s≥1`; equal characteristic is excluded from the differential coefficient field; nonperfect residue fields are excluded except the explicitly scoped fixed-field assertion; characteristic-zero scalar coefficients make the cyclic averaging denominator nonzero even at p=2. For p=2 and p=3 the logarithm witness still has coefficient norms `2^r` and `3^r`, so boundedness and growth-one distinctions persist. The Legendre example explicitly excludes p=2; it is not used to restrict any general theorem. A cyclic order-two action was used for the actual average; no target requires an arbitrary nonabelian group computation.

## Not verifiable

- `DEJONG98`, Proposition 6.4, and `TSU98`, Theorems 4.2.6 and 7.2.3: settled `uncertified` texts, not legally opened here. They remain named supplier-gap contracts. No repeat request was made.
- The published Annals numbering for DAD was not checked against the journal text. The mathematical passages above were checked in the manifest's arXiv v4, which the README expressly uses for locators.
- Ownership results are bounded by the supplied main commit and the indexed 435 open heads. No unlisted pull requests or inaccessible board branches were independently sought.
- A `sorry` elaboration cannot establish the unformalized deep theorems. The pass above verifies statements, concrete counterexamples, source passages and supplier interfaces; it does not supply proofs of the whole roadmap.

## Source issues

- **Misprint** in TSU at Theorem 3.12 and Definition 3.13, printed page 15: the source says the bounded quotient is nonzero for every solvable module; it should be restricted to nonzero input modules; affects a stated result.
- **Misprint** in TSU at Proposition 3.18, printed page 16: the source says tensoring with any unit-root factor preserves PBQ equivalently; it should be restricted to nonzero unit-root factors; affects a stated result.
- **Misprint** in TSU at Theorem 3.19, printed pages 16–17: the source says decreasing maxima and the bounded-quotient sum use nested filtration terms; it should be successive grades in both assertions; affects a stated result.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the source says the intermediate isomorphism ends at the source object's restriction; it should be the other object's restriction; affects nothing.
- **Misprint** in TSU at proof of Proposition 7.15(2), printed page 35: the source says the lifting map has the wrong target and uses the inverse comparison in its composite; it should be an endomorphism lift composed with the comparison; affects the proof.
- **Error** in TSU at Definition 7.14 and Theorem 7.18, printed pages 34 and 37: the source says weights are integers and all irreducibles are pure; it should be real weights: the constant line with Frobenius 2 over 𝔽₃ has weight `2 log₃ 2`, which is not integral; affects a stated result.
- **Misprint** in DAD at Theorem 4.2.6(i), printed page 14: the source says reverse grade i is indexed one place too low; it should be completed as `S_(m+1−i)/S_(m−i)`; affects a stated result.
- **Gap** in DAD at proof of Proposition 4.2.12, printed page 17: the source says compactness gives a positive lower norm bound outside pQ and bounded quotient torsion; it should be justified by another argument, since both steps fail for `A₁⊂W⟨u⟩`; affects the proof.
