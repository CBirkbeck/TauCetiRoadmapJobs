# Review of KloostermanSheavesAndBesselIsocrystals (package, round 2)

**Verdict:** needs changes

16 findings: 4 P1, 6 P2, 6 P3; 10 blocking. The four previous findings are repaired. The five Lean headlines elaborate and none is padding. The new findings concern mathematics and proof inputs not certified by elaboration, plus numbering, locators and Checks. No package input was edited.

Previous findings, checked first:

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, duplicate Hasse–Davenport target | repaired | README:202: “§3.3: the Hasse–Davenport lifting relation”. Former §0.2 is gone; §0.2 now constructs the root-depth quotient. CharacterSumsOverFiniteFields, open PR #1712, `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`:1123–1148 supplies precisely the relation, including the hypothesis that the characters are not both trivial. §§9.1–9.2 now consume it. For degree two, `−(−i√3)² = 3`; for trivial multiplicative/nontrivial additive character both sides are `−1`. |
| F02, unnecessary prime/rank restrictions | repaired | README:293: “at every prime `p` and every rank `n + 1 ≥ 1`”. The contract excludes RD.6.96 from its cited range. PR #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`:13641, 13664, 13731 gives RD.6.94, RD.6.95, RD.6.97 at that generality. §8.1 includes `p=2`; inverse characters coincide there. |
| F03, Springer layer names | repaired | README:335: “Layer 8 (§§8.1–8.6 …) and Layer 9”. PR #1828, `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md`:832, 964, 1016, 1051, 1075 supplies the numbered sections. No Layer D/H reference remains in the reviewed README. |
| F04, exponent-index misprint | repaired | README:1313: “`Sym^{2e_i − 2}`, of dimension `1 + 3 = 4`”. XZ lines 2440–2441 really use that indexing. For `sl₃`, the correct dimensions are `3+5=8`, the printed ones `1+3=4`. |

The repair report marks none of F01–F04 “not actionable”; no settled finding is re-raised. The repaired patterns were searched throughout the package. Newly discovered stale design labels are reported separately below.

## R01 (P1) — The radius theorem is at the wrong puncture

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1418: “a nonzero horizontal section on the open unit disc around `∞`”. The dependency enters §7.4 at line 1439.

**Claim:** A nontrivial adjoint constituent has a radius-one horizontal section at infinity, and parameter rescaling tests integral functoriality there.

**Witness:** XZ lines 2547–2551 use `Sol(V|₀)` and `f_i(cx)` at zero. For `SL₂`, the adjoint connection has no nonzero power-series horizontal section at infinity.

More explicitly, put `y=1/x`, `a=λ²≠0`, and write a section as `uE+vH+wF`. Horizontality gives `δ_y u=−2v`, `δ_y v=w−au/y`, `δ_y w=2av/y`. The pole terms force `u₀=v₀=0`; the constant terms force `v₁=u₁=w₀=0`; induction gives `a(2k−1)u_k=0` for `k≥1`, hence all coefficients vanish. The identity inclusion `SL₂⊂SL₂` is already an allowed inclusion in a table row.

**Repair:** State the radius result for a nonzero solution functional at **zero**, using the dual-solution convention of XZ §2.9.2 and the nilpotent local extension. For the invariant scaling `x↦cx`, write the radius as `1/|c|`; for `λ↦uλ`, it is `|u|^{−h}`. Require `c,u≠0`. Add the irreducibility/monodromy inputs used in XZ lines 2544–2551 and update §7.4. Test the replacement with the rank-two scalar solution at `p=2`: coefficients `4^j/(j!)²` have radius one; replacing `λ` by `2λ` gives radius `4`, and replacing it by `λ/2` gives radius `1/4`. Keep the infinity calculation as a negative control.

## R02 (P2) — ULA has been replaced by an unsupported divisor criterion

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:518–525: “every smooth effective divisor of every smooth `S′ → S`”.

**Claim:** This is the definition of ULA for arbitrary realizable targets, and it implies the trait criterion and smoothness assertion cited from Xu–Zhu.

**Witness:** XZ lines 988–998 require **smooth `S`**, define LA by the graph tensor comparison for every `N∈D(S)`, and quantify over **all morphisms between smooth schemes**. Lines 1064–1067 do not require that base-change morphism to be smooth.

The missing class is concrete: `Spec k→A¹` selecting zero is a map between smooth schemes but is not smooth (its relative dimension is `−1`). Thus the source's universal quantifier cannot be substituted by the displayed one. The source proves vanishing along divisors as a consequence, not the converse definition used here.

**Repair:** Use XZ Definition 2.8.2 with smooth target, the specified graph comparison, and all morphisms of smooth bases; state Proposition 2.8.5 and Corollaries 2.8.6–2.8.7 as consequences. If a singular-base or divisor-only version is needed, give it a separate theorem with an actual proof input. Test the definition at `S=A¹`, the zero-point base change, and `j_!K` for `j:G_m→A¹`, whose boundary vanishing cycles are nonzero; an object over a point remains ULA.

## R03 (P1) — Finite central torsors do not disappear over the coefficient field

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:831: “extends to `𝔸¹` and is trivial”; line 852: “descend from `K̄` to `K` since both functors are defined over `K`”.

**Claim:** Unipotence at zero makes a lift of an adjoint connection unique over an arbitrary characteristic-zero coefficient field, and geometric isomorphism automatically descends.

**Witness:** For nonsquare `a∈Kˣ`, the constant torsor `Spec K(√a)×A¹→A¹` is finite étale and nontrivial. It has trivial geometric local monodromy at zero.

There is also a connection-level witness. Take the irreducible rank-two Bessel connection `A=[[0,1],[λ²x,0]]` and `P=diag(a,1)`. The connection with matrix `PAP⁻¹` has the same projective connection and unipotent residue. Over `K̄`, all horizontal isomorphisms are `cP`, since the Bessel connection is geometrically irreducible. An `SL₂` isomorphism requires `c²a=1`, which has no solution in `K`. Over `K(√a)` it does.

**Repair:** State geometric uniqueness over an algebraically closed field, or uniqueness with a specified compatible rational marking that trivializes the central torsor. For the actual Zhu comparison over `K`, construct a Galois-equivariant comparison from the normalized localization/big-cell data and prove its descent; being defined over `K` is not the proof. Keep a named descent target in §2.7 so the arithmetic theorem is not narrowed. The nonsquare example must fail the new marking/descent hypothesis, while `a=b²` is repaired by `c=b⁻¹`.

## R04 (P2) — The quasi-minuscule comparison uses Frobenius before constructing it

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:977–986: “by the convergence of its relative cohomology”; “uses full faithfulness for F-isocrystals”.

**Claim:** The analytified de Rham object can be extended from a dense open using the supplied F-isocrystal full-faithfulness theorem, before §4.1 transports Frobenius to it.

**Witness:** §3.5 explicitly targets isocrystals with Frobenius forgotten. §4.1 constructs their Frobenius using §3.5. For `E₈`, the nontrivial minuscule-generator alternative in §3.4 is unavailable: it supplies zero nontrivial generators, whereas the adjoint has dimension 248.

PR #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`:11227, RD.5.112, has F-structures on the objects. RD.5.9 at line 8869 distinguishes this from dense restriction **without** Frobenius; the README conflates that restriction with forgetting overconvergence.

**Repair:** Prove the needed convergence/overconvergence of the quasi-minuscule analytification as an explicit theorem before applying any restriction result. Use RD.5.102(a), also identified in RD.5.112(ii), for dense-open restriction of the underlying overconvergent isocrystals, or construct the required F-structure independently before invoking the F-version. Give the `E₈` argument explicitly; do not leave “or by convergence” as an unowned input. The repaired route must reach the rank-248 object without using §4.1 or minuscule generators.

## R05 (P2) — The reductive cuspidal Newton contract lacks central normalization

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:242–246, gap `cuspidal-newton-bound`; the same needs sentence occurs in `packages/KloostermanSheavesAndBesselIsocrystals/design/plan.json`.

**Claim:** Every cuspidal Hecke eigenform for a split reductive group has Satake Newton point at most `ρ`, with no condition on its central character.

**Witness:** For `G=G_m`, an unramified degree character taking a degree-one idele to `q` is cuspidal. Its Newton point is `1`; `ρ=0` and the positive-coroot cone is `{0}`, so `1≤0` is false.

VL-est lines 270–279 impose a quotient by central elements whose degrees form a full lattice. Lines 291–303 explicitly use finite central character. A norm twist is excluded there. The declared gap is a valid ownership contract, but its hypotheses are not precise enough; this is not a finding about the supplier not yet providing it.

**Repair:** Add finite-order central character, or state the estimate on the source's fixed central-lattice quotient with exactly its hypotheses, in both occurrences of the gap. Explain why the normalized Bessel eigenfunction satisfies that condition. Retain the reductive scope. The torus test then gives slope `0` for finite-order characters and excludes the norm character of slope `1`.

## R06 (P2) — Cuspidal eigenfunction uniqueness needs additional data

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1174–1178: “a unique cuspidal eigenfunction for the generic two-point datum”.

**Claim:** The generic datum determines a unique eigenfunction for every split almost-simple automorphic group `G`.

**Witness:** HNY lines 639–647 allow arbitrary values on `Ω`. For `G=PGL₂`, `Ω=Z/2`; the functions form a two-dimensional space, with component vectors `(1,1)` and `(1,−1)` distinguished by the unramified quadratic twist.

This is also explicitly recognized by the consumer PR #1845, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:635: its uniqueness argument is restricted to simply connected `G₀`. Existence of the specified eigenfunction, and cuspidality, suffice here; arbitrary scalar multiples also preclude literal uniqueness without normalization.

**Repair:** State that the trace function of the chosen normalized eigenobject is a nonzero cuspidal Hecke eigenfunction, with its component values fixed. Alternatively state the simply connected uniqueness-up-to-scale result and then the central-isogeny transport. Keep the Newton bound for all groups. Verify the two `PGL₂` component vectors and show which specified normalization chooses one.

## R07 (P1) — The `B₃→G₂` monodromy drop is not an outer fixed subgroup

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:869–870: “Where the table gives a smaller group it is the fixed subgroup of the pinned outer automorphism”.

**Claim:** Every smaller group in the Frenkel–Gross table is obtained as a pinned outer fixed subgroup of the ambient group.

**Witness:** The based Dynkin diagram `B₃` has no nonidentity automorphism. Its pinned fixed group is therefore `SO₇`, dimension 21, whereas the table gives `G₂`, dimension 14.

**Repair:** Separate foldings (`A_{2n−1}`, `D_{n+1}`, `E₆`, and triality in `D₄`) from the exceptional `G₂⊂B₃` inclusion. State the latter by its seven-dimensional representation and the invariant tensor/monodromy argument, with the appropriate Frenkel–Gross locator. The repaired `B₃` row must read `14<21` without invoking a nonexistent outer automorphism; the `D₄` triality row remains an actual fixed-group example.

## R08 (P2) — The promised general hypergeometric library only plans the Bessel specialization

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:53 and 1647–1653: “hypergeometric … with rational nonresonant parameters”; target starts “For `n > m ≥ 0`, nonintegral `β_j`”.

**Claim:** §9.1 provides the general Miyatani arithmetic hypergeometric construction, but only the all-zero upper-parameter, strictly unbalanced case is planned.

**Witness:** Miy lines 64–90 allow two arbitrary parameter sequences, with `α_i−β_j∉Z`; the balanced case is on `G_m\{1}`. For `q=7`, upper `(0,1/2)`, lower `(1/3)` is admissible and absent here.

This is a route-specific restriction of the newly owned library, not a restriction imposed by the source or an imported general owner. The ownership search found the scalar Kloosterman supplier, not a general arithmetic hypergeometric owner.

**Repair:** Plan Miyatani's full rational nonresonant construction, its rank, convolution and trace compatibility, including both unbalanced directions and the balanced punctured domain. Then specialize it to zero upper parameters for the logarithmic zero spectrum and §9.2. Do not export maximal-unipotence/that zero spectrum for arbitrary upper parameters. Checks: upper `(0,1/2)`, lower `(1/3)` has rank 2 over `F₇`; upper `(0)`, lower `(1/2)` has rank 1 on `G_m\{1}`; an integral upper/lower difference is excluded. Name this broader construction as unstatable in Lean if needed, rather than introducing a stand-in.

## R09 (P2) — The stated build order contains a backward proof cycle

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:876: “compute … with the corrected local term (§6.6)”; §6.3 at 1310 needs §2.8; §6.6 at 1344 needs §6.3. Also §6.4 needs §7.2 at 1305.

**Claim:** The layers are in dependency order and no target is used in its own proof (lines 349–361).

**Witness:** The written route has `2.8→6.6→6.3→2.8`. At layer granularity there is also `6→7→6`; §7.2 itself needs only Layers 0–2 and can be moved earlier.

The roadmap-level dependency tool does not inspect this internal graph.

**Repair:** Prove the characteristic-zero adjoint rigidity in §2.8 directly from the Frenkel–Gross de Rham computation, with its own characteristic-zero inputs and corrected local terms, without invoking §6.6. Put the central/pinned symmetries before §6.4 and update all internal references. Add §2.8 to §4.1's needs for the algebraic centralizer argument. Recompute the internal graph: the displayed three-edge cycle must disappear and all layer dependencies must point backwards.

## R10 (P3) — Scalar supplier citations still use superseded design labels

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:213–221: “KM.1 (normalized-sheaf)”, “KM.2 (connection, bessel-dictionary, differential-galois)”; line 132 uses KM.4.

**Claim:** These labels identify the sections supplying the scalar objects.

**Witness:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`:471, 534, 625, 725, 747 now supplies §§1.1, 1.3, 2.1, 2.5, 2.6. Its package README contains no `KM.*` labels or former-numbering map.

The supplier is present in the board and merge order; the absence from the open-roadmap tool is not treated as absence of the package. Its design file still contains the old labels, which explains why automatic resolution does not expose the drift.

**Repair:** Cite the supplier's actual package sections throughout Scope, contracts, needs, examples and Lean docstring. Replace KM.1 normalization/monodromy by §§1.1/1.3, KM.2 connection/dictionary/Galois by §§2.1/2.6/2.5. Cite the rank-one sign directly to RD.6.48 and the actual scalar dictionary instead of KM.4. Update only the editable gap-section label in the plan if required. The scalar matrix test at odd rank must agree with §2.6's `θ^r f−(−1)^rλ^rxf=0`.

## R11 (P3) — Downstream `KB.*` citations need a former-numbering map

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`, all numbered layers; no `KB.*` alias or old-to-new map occurs.

**Claim:** The package replaces the design labels while preserving downstream references.

**Witness:** PR #1845, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:638 and 791 cites `KB.0`, `KB.1`, `KB.4`, `KB.6`, `KB.11`, with target labels such as `affine-depth` and `rigidity-local`.

The supplied overlap report says “none”, but these citations are present in the actual consumer text. They are not a reason to add that later roadmap as a supplier.

**Repair:** Add a concise former-numbering map in this README: `KB.0 affine-depth→0.2`, `level-model→0.3`; `KB.1 clean-datum→1.4`, `hecke-action→1.5`, `eigenobject→1.6`, `trace-companions→1.8`; `KB.4 bessel-isocrystal→4.1`, `log-extension→4.2`; `KB.6 rigidity-local→6.6`; `KB.11 all-prime-corollaries→11.5`, updating destinations if R09 moves them. Map layer labels as well. Resolving the exact consumer needs line against that map is the test.

## R12 (P1) — The eliminated-variable API is false at rank zero

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1909–1910: “its eliminated-variable form is `Σ_{x : Fin (k−1) → F^×} ψ(Σx_i + a/∏x_i)`”.

**Claim:** This identity holds for the total `kloostermanSum` definition, without a positive-rank hypothesis.

**Witness:** `F=F₂`, `k=0`, `a=1`, `ψ(1)=−1`: the empty product-fibre sum is `ψ(0)=1`; natural subtraction makes `Fin(k−1)=Fin 0`, so the claimed alternative is `ψ(1)=−1`.

PR #1504, `TauCetiRoadmap/CongruenceSpectralGap/README.md`:647–661 explicitly retains the rank-zero delta function; `Suggested.lean`:85–88 also defines that correct total function.

**Repair:** Add `k≥1` to the eliminated-variable API, state `R₀(a)=1` at `a=1` and `0` otherwise, and add these as README Checks. Keep the general definition and the five headline Lean theorems. At `k=1`, the repaired expression gives `ψ(a)`; at `k=0`, use the delta function rather than truncated subtraction.

## R13 (P3) — Several low-rank Checks assert the wrong object or value

**Locations:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:429–431, 596, 858–860, 967–968, 1091, 1525–1526.

**Claim:** These Checks distinguish the intended construction. They instead contain the following errors.

| Location | Computed witness | Exact repair |
| --- | --- | --- |
| §0.2, arbitrary maximal-ideal `y` | In `F₂[[t]]`, take `y=t²`: `1+y=(1+t)²`, so the determinant **is** a square. With `y=t`, the coefficient of `t` in a square is zero, so `1+t` is not a square. | Specify `y=t` a uniformizer, not an arbitrary maximal-ideal element. |
| §1.4, unshifted origin fibre “degree zero” | For `G=SL₂`, the big cell has dimension 2. The definition is `j_!A[2]`, so ordinary origin pullback is `K[2]`, in cohomological degree `−2`, not `0`. HNY lines 672–674 include the correcting inverse shift. | State the **normalized** fibre `i_γ^*A_γ[−dim Bun]`, or retain degree `−2` for the ordinary fibre. |
| §2.7 and §8.1, scalar solution versus cyclic module | For `r=3, λ=1`, `f=1+x+x²/8+…` solves `(δ³−x)f=0`, but `(δ³+x)f` has coefficient `2` at `x`. The column-horizontal first coefficient is `1−x+x²/8−…`. | Explicitly distinguish the cyclic operator's solution functional from a horizontal coefficient of the original column connection. In §8.1 do not say one series solves both equations. Use the supplier §2.6 sign dictionary. |
| §3.3, the whole Schubert variety is an affine cone | The closed quasi-minuscule Schubert variety is projective of dimension 2. The affine quadric cone has nonconstant global coordinates and is not proper. | Say **a neighbourhood of the vertex** is the affine quadric-cone chart; its punctured chart gives the nonaffineness witness. Do not identify the entire Schubert variety with `Spec K[u,v,w]/(uv−w²)`. |
| §4.3, “For `H=PGL₂`, `ρ` is not a cocharacter” | `t↦[diag(t,1)]` is a cocharacter of `PGL₂` and is half the coroot, so `ρ` is integral there. For `SL₂`, half the coroot would require `diag(t^{1/2},t^{−1/2})` and is not integral. | Use `H=SL₂` as the nonintegrality example; retain the `PGL₂` image as an example where `ρ` itself is integral. |

These repairs are tested by the displayed values. They change Checks/convention explanations, not the five Lean headlines.

## R14 (P3) — Two source locators point to the wrong material

**Locations:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:499, 1580–1581; `packages/KloostermanSheavesAndBesselIsocrystals/sources.toml`:160.

**Claim:** XZ Proposition 2.4.4 supplies affine direct-image exactness; PRW Theorem 3.2 is on pages 12–13 of the cited v2.

**Witness:** XZ lines 784–786 concern fully faithful smooth pullback with geometrically connected fibres. AC lines 817–819 give the exactness assertion. PRW line 709 marks page 14, and Theorem 3.2 begins at line 718.

**Repair:** Cite AC Proposition 1.3.13 for the affine exactness assertion, with its realizability/frame hypotheses transported by the declared operations contract. Change PRW's locator to §3.3, pp. 13–14, Theorem 3.2, p. 14, in both README and the author-recorded manifest entry. This review has not rewritten that entry. Reopening those precise source lines verifies the correction.

## R15 (P3) — The Lean-supporting definitions do not each have three discriminating Checks

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1902–1941, the five definitions in §11.1.

**Claim:** The shared four-bullet Check block satisfies the per-definition requirement.

**Witness:** Those bullets test exponential-sum identities. None computes `quadraticCharIn` at zero, a square and a nonsquare; none computes a nontrivial trace character on a non-prime field. Thus these definitions have zero dedicated discriminating Checks.

**Repair:** Add at least three concrete Checks for each definition, in prose only. For example, `quadraticCharIn F₃ ℂ` takes `0,1,−1` at `0,1,2`; in characteristic-two coefficients the last two values coincide. For `traceChar` on `F₄=F₂[ω]`, traces at `0,1,ω` are `0,0,1`, giving values `1,1,−1` for the nontrivial base character, while a trivial base character gives three ones. Add zero/positive rank and excluded-parameter controls for the sums, including R12, and document the `b=0` value of the total hypergeometric definition. Do not add these as Lean theorems or examples.

## R16 (P3) — The symmetry formula never defines its action

**Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1399: “for `(a, σ) …`, `Kl_{H, W}(ψ(φ ∘ δ)) ≅ …`”.

**Claim:** `φ∘δ` is a specified generic functional on `V`.

**Witness:** The only earlier definition of `δ` is the differential operator `x d/dx` (line 123); no map `δ:V→V` attached to `(a,σ)` is defined. XZ lines 1915–1924 specify the loop-rotation/pinned-automorphism action.

**Repair:** Define that action and its source and target before the formula, using a different symbol from the logarithmic derivation. State its effect on the affine-simple root coordinates. Check `(1,id)` acts identically, loop rotation scales the affine-root coordinate, and composition agrees with the product in the acting group. For `SL₂`, the invariant product of the two coordinates is then scaled by `a`, whereas scaling both coordinates by `a` would scale it by `a²`.

## Verified sound

All 65 numbered target subsections, their API paragraphs, Checks and needs lines were read. The previous report's numerical rows were used only for the unchanged statements those rows actually test. Its uncomputed blanket claims about shape, suppliers and sources were not treated as certification. The tables below record fresh calculations and inherited evidence separately. These tests do not constitute proofs of the deep theorems.

**Principles and shape.** The package is not a re-plan of an existing roadmap. Its characteristic-two branch and primes dividing scalar rank are retained. No copied source passage, computational algorithm target, sorry'd data, `set_option`, forbidden import or `lemma` declaration was found. The mathematical layer organization differs from the source's sequence (notably Newton bounds precede monodromy and the characteristic-two branch); no finding of source-chapter organization is raised. All 12 layers have Examples and Dependencies. The forward edges in R09, the general-library restriction in R08, and per-definition Checks in R15 prevent a clean shape verdict. No machine path, PR number or handoff narrative occurs in the reviewed README/Lean file. The title capitalization is mathematical proper names. Metadata is `topic = "math.NT"`.

**Lean elaboration and context.** The prescribed `lake env lean` command was run from the pinned content checkout on the package's `Suggested.lean`: exit 0; exactly five `declaration uses 'sorry'` warnings at lines 62, 127, 139, 150, 163; no other warning. No Tau Ceti object build was needed: the only import is `Mathlib`. A separate scratch copy with `#check @name` for every declaration also elaborated. There are eleven actual declarations (six definitions and five theorems); the supplied thirteen-entry signature ledger includes two parser false positives. No needed binder disappeared, and no file change was made. In particular:

- The signed theorem retains the complete DVR, fraction-field, characteristic-zero and nonunit-two assumptions, all coefficient nonvanishing hypotheses, every Dwork congruence, and sign independence from `a,n`.
- The characteristic-two identity retains the prime-field trace character, its nontriviality, `n≥1`, and unit parameter.
- The odd identity retains odd field characteristic and nontrivial additive character; the coefficients may be any field. The finite cyclotomic-polynomial argument in §11.1 supplies this coefficient generality.
- The convolution retains `N≥2`, and the ordinarity theorem fixes all eigenvalues before quantifying over extensions. Its prime-field scalar structures are unique, so no omitted scalar-tower assumption creates inconsistent traces. `F,L:Type` agrees with the explicit universe convention.
- `orthogonalSum` at `n=0` is a total expression with two distinguished variables; no headline applies there. `quadraticHypergeometricSum` at `b=0` is zero by the multiplicative character's zero value. `kloostermanSum` at zero rank is the delta function, exposing R12 only in the prose API.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | simp`. All five failed: the signed theorem left a coefficient-divisibility goal; the four sum/eigenvalue theorems reported no progress. The supplied library-near-match list was compared with the actual definitions below; none supplies the conclusion in one exact step. No theorem merely restates a definition, computes a small value, or mirrors a Check. No padding deletion is requested.

**Headline inventory.** The summary's Bessel F-isocrystal construction/companion, arithmetic Satake, Zhu and relative de Rham–rigid comparisons, group-valued monodromy, functoriality, companion monodromy, generic Newton ordinarity, everywhere classical/`G₂` ordinarity, characteristic-two comparison, adjoint rigidity and simple-wild parameter are named with their missing carriers in the module docstring (lines 17–41). The native-carrier consequences are present: the three exponential-sum identities, orthogonal trace-function ordinarity, and signed Dwork congruence. Scalar ordinarity is explicitly a supplier contract. No additional statable **summary headline** was found missing. R08 requires the docstring to track the corrected broader construction. The six definitions are simple native-carrier definitions supporting these five theorems, not ad hoc replacements for sheaf categories.

**Pinned declarations opened.** Paths in this paragraph are relative to the pinned libraries. Mathlib `AddChar.compAddMonoidHom`, `mulShift`, `sum_eq_ite` are in `Mathlib/Algebra/Group/AddChar.lean`:242, 463, 354; nontrivial-character orthogonality is `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240. `ZMod.algebra` is the non-instance prime-field algebra at `Mathlib/Algebra/Algebra/ZMod.lean`:47, requiring `CharP R p`. `FiniteField.trace_to_zmod_nondegenerate` and `algebraMap_trace_eq_sum_pow` are in `Mathlib/FieldTheory/Finite/Trace.lean`:37, 49; the former assumes a finite field and its prime-field algebra, not an arbitrary extension. `gaussSum` and `gaussSum_mul_gaussSum_eq_card` are in `Mathlib/NumberTheory/GaussSum.lean`:72, 200; the latter requires nontrivial multiplicative character and primitive additive character. `quadraticChar` is in `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120; `MulChar.ringHomComp` is in `Mathlib/NumberTheory/MulChar/Basic.lean`:455. These are imported operations, not proofs of the orthogonal identities.

`PowerSeries.mk`, `coeff` are in `Mathlib/RingTheory/PowerSeries/Basic.lean`:112, 77; `expand` is in `Mathlib/RingTheory/PowerSeries/Expand.lean`:33 (substitution by `X^p`, with `p≠0`). `PowerSeries.trunc` is a polynomial-valued initial truncation, whereas `dworkBlock` is a power-series interval block; no duplicate headline follows from truncation lemmas. `IsDiscreteValuationRing` at `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56 is a local PID domain **which is not a field**, with nonzero maximal ideal. `IsAdicComplete` at `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57 includes Hausdorffness and precompleteness. `IsFractionRing` at `Mathlib/RingTheory/Localization/FractionRing.lean`:52 is localization at non-zero-divisors. `PadicComplex` at `Mathlib/NumberTheory/Padics/Complex.lean`:137 is the completion of the algebraic closure; `Module.finrank` at `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61 uses the natural-number rank; the field-extension theorem has finiteness, so infinite-rank junk is excluded. `Matrix.trace` is `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43, and `LieAlgebra` is `Mathlib/Algebra/Lie/Basic.lean`:73.

Tau Ceti `FGComoduleCat` at `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95 is the full subcategory of finitely generated right comodules, finite dimensional over a field. `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` at `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138 includes the universe lift on group-valued points. Neither declaration constructs an overconvergent isocrystal on a curve. Object searches of both pinned libraries for Kloosterman objects, arithmetic D-modules and overconvergent isocrystals produced no competing construction; Mathlib's Witt-vector isocrystal is a coefficient-field object, not the missing curve category. Every own identifier in backticks is among the eleven declarations. No fully qualified name collides with the readable sibling Lean files.

**Ownership and suppliers.** Read the board package index before searching for missing owners. Compared main-branch shape with ReductiveGroupsPartII and AffineLieAlgebras. The `roadmaps grep` object search and the head texts of the five closest open roadmaps were read: PR #1002 owns the scalar rigid construction and analytic foundations; #1712 owns Hasse–Davenport; #1235 owns the étale/diamond Satake framework, not arithmetic D-module Satake; #1490 owns classical global Satake and finite-field bundle geometry; #1845 consumes Bessel objects for its automorphic anchor. No second owner of group-valued Bessel construction, the signed Dwork theorem or general arithmetic hypergeometric theory was located. The local scalar sum is an explicitly disclosed signature-supporting specialization of CongruenceSpectralGap, with a different namespace, not a second planned construction.

Resolved supplier sections against their actual texts: CongruenceSpectralGap §§4.2a–4.2b; CharacterSumsOverFiniteFields §3.3; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.14, 1.1–1.2, 1.4–1.6, 1.8–1.9, 1.12; BunGAndNewtonStrata §§1.5, 1.22 (same central projection in dominance); MotivesAndAlgebraicCycles §§6.1–6.3, 6.5; FormalConnectionsOpers F2, F4, F6; Springer Layers 8–9; DeligneWeightsAndPurity §§8.5, 8.12, 8.14, 8.19. The main ReductiveGroupsPartII sections RG2.3.3, RG2.3.6, RG2.4.1 supply local models/filtrations/Weyl components, not the HNY-specific quotient comparison. AffineLieAlgebras A7–A8 supplies the critical center; its characteristic-zero descent requirements must accompany the use over `K`, as in R03.

The cited RD headings are present: RD.0.37, RD.0.44; RD.1.11–1.19, 1.35, 1.44–1.46; RD.2.13–2.16, 2.33, 2.51; RD.3.8, 3.25, 3.33–3.37, 3.43–3.47, 3.51; RD.4.58–4.59; RD.5.8–5.9, 5.76, 5.89, 5.101–5.103, 5.112; RD.6.3–6.4, 6.23, 6.25, 6.28, 6.41–6.48, 6.51–6.52, 6.55, 6.64–6.65, 6.82, 6.94–6.95, 6.97. Their distinctions between generic radius and boundary solvability, convergent versus overconvergent restriction, and bare versus F-isocrystals are material to R01 and R04. The readable board package PadicDifferentialEquationsAndRigidCohomologyPartII MS.4.6 (README:1461) supplies the specified-map curve theorem with irreducible objects and nonzero maximal-quotient map; its MS.4.7 gives the isoclinic-quotient form. The scalar board supplier's contents exist but its design labels are stale (R10).

All seven declared gap slugs occur both in the plan and the README with a named supplier. None has supplier `none`. The relative geometry, arithmetic operations, formal-slope comparison, companion monodromy, principal-subgroup classification and all-prime scalar ordinarity remain declared contracts rather than unowned prerequisites. The cusp estimate needs R05; the scalar gap's destination label needs R10. No new gap was added in this review.

The overlap file reports no conflicting head or dropped supplier ID. Reading #1845 nevertheless finds the dropped `KB.*` consumer labels in R11. No later roadmap was made a supplier. Mechanical dependency output, from the exact requested command:

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` reports no unresolved names, but expressly says it did not check external Lean names because that service has no pinned Lake packages; the direct pin reads and elaboration above perform that check. These tools do not discharge the internal cycle, the design-label drift or mathematical applicability.

**Seeded source sample.** All fifteen selected subsections were opened against the cached legal texts, with source version/pagination checked against the manifest. No fresh source fetch was required. There is no additional author-flagged unverified locator beyond the settled uncertified works listed below.

| Target | Read locator and source lines | Outcome |
| --- | --- | --- |
| 0.2 root-depth quotient | HNY §1.2, printed p. 251, lines 426–451; XZ §4.1.1 | The affine-simple root-line quotient is supported; the arbitrary-`y` negative control needs R13. |
| 1.7 tame character | XZ §4.1.11, pp. 41–42, lines 1943–1964; §4.1.13, lines 1972–1990; HNY Remark 2.5/Definition 2.6, p. 257, lines 701–707; Definition 2.11, p. 260, lines 807–811 | Twisted component character and splitting dependence agree. Rational Kummer exponent correction is necessary: denominator four gives order four, integral exponent gives trivial monodromy. |
| 1.8 trace comparison | XZ §4.1.12, p. 42, lines 1965–1970 | Trace equality is stated; all-extension traces recover characteristic polynomials in characteristic zero. |
| 2.4 critical localization | Zhu Theorem 8/Corollary 9, pp. 9–10, lines 377–443 | Square root and flatness hypotheses retained; eigenvalue is the oper under `π(χ)`. BD §§5.5/7.8 are independently located but not read in full; Zhu is the directly read statement. |
| 2.7 Zhu comparison | XZ Theorem 4.3.3, pp. 47–49, lines 2200–2204, 2263–2289; Zhu §5, p. 23, lines 1008–1028 | Adjoint localization comparison supported. The coefficient-field descent and general central-lift uniqueness require R03. |
| 4.1 Bessel F-isocrystal | XZ §4.4.1, pp. 49–50, lines 2292–2313 | Transported Frobenius and algebraic centralizer mechanism supported; add its actual §2.8 dependency (R09). |
| 4.4 horizontal matrix | XZ §4.4.3/Theorem 4.4.4, p. 50, lines 2323–2334 | Source uses a different gauge equation. The README column equation and inverse are directly recomputed below; point degree and ordered product are retained. |
| 5.2 Newton bound | XZ Theorem 5.4.2 proof, p. 62, lines 2932–2940; HNY Lemma 2.1/Remark 2.2, p. 256, lines 639–657; VL-est Proposition 2.1, printed p. 461, lines 262–290 | Bound for the normalized datum supported; the general contract omits central normalization (R05), and uniqueness is overstated (R06). |
| 7.3 exact radius | XZ Proposition 5.1.3 proof, p. 55, lines 2544–2551 | Source is at zero and uses solution functionals. R01. |
| 7.4 integral functoriality | XZ Proposition 5.1.3(i),(ii), p. 55, lines 2527–2555 | Integral invariant and central-ratio argument supported; route depends on repairing R01. |
| 8.4 quadric realization | XZ §5.3.4, pp. 58–59, lines 2736–2773; LT Theorem 1.8, lines 262–265 (=7.10); PRW §3.3/Theorem 3.2, pp. 13–14, lines 685–729 | Quadric, deleted divisors, potential and even shift match. PRW page locator needs R14. |
| 9.1 hypergeometric objects | Miy Main Theorem, pp. 2–3, lines 64–90; XZ §5.2.1/Theorem 5.2.2, pp. 56–57, lines 2608–2629 | Bessel-specialized operator supported; general theory missing (R08). Zero spectrum cites settled unread Katz works, recorded in XZ lines 2630–2639. |
| 9.2 normalization | XZ §5.2.3, p. 57, lines 2630–2645 | Scalar and degree powers match Hasse–Davenport; corrected endpoint has exactly `n` eigenvalues. |
| 10.3 unit-root line | XZ A.6/Corollary A.7, p. 65, lines 3076–3087 | Correct connection sign, invertibility and unit-root normalization; no unsupported identification with a Bessel quotient in this subsection. |
| 10.4 two series | XZ A.11/Lemma A.12, pp. 66–67, lines 3129–3158 | Coefficients, period-two signs and the two Frobenius-compatible identities agree. |

**Adversarial computations.** `ζ` below means a primitive complex cube root, with `ζ²=−1−ζ`. Finite prime-field sums and Dwork coefficients were independently recomputed exactly using integer pairs and rational arithmetic; no floating-point test is used. The table also records structural computations where finite point counts would not test the assertion.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 half twists | `q=4,d=2`; rank two over `F₃` | `c₄⁻²=1/4`, squared `1/16=q⁻²`; `R₂(1)=−1`, normalized `1/√3` | Sound; square root is needed. |
| Repaired Hasse–Davenport contract | `F₃→F₉`, quadratic; trivial multiplicative character | `g=i√3`, `g'=3=−g²`; trivial multiplicative case `−1=−(−(−1))²` | Sound, imported from #1712. |
| 0.2 quotient and kernel Check | `SL₂`, `G_m`, `GL₂/F₂[[t]]` | Root-line dimensions `2,0`; `1+t²=(1+t)²`, while coefficient of `t` in any square is `0≠1` | Quotient cases sound; R13. |
| 0.3 level chart | `SL₂`, `PGL₂` | `dim V=2`, chart `A²`; `|Ω(PGL₂)|=2`, so two components, not one | Sound on these instances. |
| 1.1 weights/cleanness | Constant line `K(−1/2)`; `j:G_m→A¹` | Weight `1` dualizes to `−1`; stalk of `j_!K` at zero `0`, ordinary direct-image stalk has `H⁰=K` | Sound. Wrong XZ exactness locator: R14. |
| 1.2 ULA quantifiers/localization | `Spec k→A¹`; `A²` weights `(1,−1)` and `(1,1)` | First map has relative dimension `−1`, not smooth; hyperbolic objects are respectively `K[−2](−1)` and `K[−4](−2)` on both sides | Localization examples sound; ULA replacement unsupported, R02. |
| 1.3 Satake | `G_m`; minuscule `PGL₂` | Grading lattice `Z`, rank-one weight characters; `IC` on `P¹` has cohomology dimensions `1+1=2`, odd parity before sign correction | Tests retained; no duplicate arithmetic owner. |
| 1.4 clean datum fibre | `SL₂` | Ordinary fibre `K[2]` versus claimed `K[0]`; normalized fibre `K[2][−2]=K[0]` | R13. |
| 1.5–1.6 tensor eigenobject | `SL₂ Std`, unit and dual | Ranks `2·2=4`, unit rank `1`; evaluation `2⊗2→1` has target rank `1`, not `4` | Tensor dimensions and unit normalization sound. |
| 1.7 tame character | `F₅`, exponent `1/4`; nontrivial `Ω(PGL₂)` | Tame eigenvalue `i` (or inverse with opposite sign convention), integral exponent gives `1`; inversion sends `i↦−i` | Rational exponent and component action discriminate. |
| 1.8 all-power traces | `diag(1,3)` versus `diag(2,2)` | First traces `4=4`; second traces `10≠8`; determinants `3≠4` | Degree-one trace alone insufficient, as stated. |
| 2.1–2.2 parameter and tensor conventions | `SL₂×SL₃`, scale `2` | Invariant scales `2²=4`, `2³=8`; dual matrix `−Aᵗ`; tensor ranks `2·3=6` | Correct factorwise degrees. |
| 2.3 oper slice | `PGL₂`, parameter zero/nonzero | One coordinate; zero slope `0`, generic slope `1/2` | Boundary distinguished. |
| 2.4–2.5 flat localization | Test `A=K[t]`, nonflat module `A/(t)`, character `t=0` | Underived fibre `K`; derived fibre has `Tor₀=K` and `Tor₁=K` | Flatness is material; source retains it. |
| 2.6–2.7 central descent | `SL₂`, nonsquare `a` | Projective gauges agree; determinant of `cP` is `c²a`; value `1` is unattainable in `K` and attained in `K(√a)` | R03. |
| 2.7 / 8.1 scalar signs | `r=3,λ=1`, positive series | Coefficient at `x` of `(δ³−x)f` is `0`; of `(δ³+x)f` is `2` | R13; distinguish dual solutions. |
| 2.8 smaller monodromy | `B₃`; `D₄` triality | `|Aut(Dynkin B₃)|=1`, fixed Lie dimension `21`; `dim G₂=14`; triality really has order `3` | R07. |
| 3.1–3.2 specialization | Unit; `SL₂ Std` minuscule | Unit map is `1:A†→A†`; standard fibre dimensions `2→2` | Identity and rank tests sound; dimension equality alone is not used as a comparison proof. |
| 3.3 cone chart | Quasi-minuscule rank-one root system | Global Schubert dimension `2`, proper; affine cone dimension `2`, nonproper, global coordinate `u≠constant` | R13. |
| 3.4–3.5 exceptional generator | `E₈` | Nontrivial minuscule representations: `0`; adjoint dimension `248` | R04: no tensor-power-minuscule shortcut. |
| 4.1–4.2 Bessel unit/log extension | Torus; `SL₂` | Torus `N=E=0`, Frobenius `1`; `rank E₁₂=1`, `E₁₂²=0` | Unit and nilpotent residue sound. |
| 4.3 residue and cocharacters | `SL₂`, `c²=q`; `PGL₂` | `(NC₀)₁₂=c=(qC₀N)₁₂`; `ρ_PGL₂(t)=[diag(t,1)]` exists | Matrix sound; cocharacter Check R13. |
| 4.4 column Frobenius/inverse | `A=−a`, `q=3,a=1/2`; general inverse | `C=x⁻¹`, `δC=−C=(1−q)aC`; differentiating gives `δ(C⁻¹)=C⁻¹A−qA(x^q)C⁻¹` | Sound. |
| 4.5 transpose/gauge dictionary | `SL₂`, diagonal residue | `C₀=diag(c⁻¹,c)` gives `Ad_C₀N=q⁻¹N`, inverse gives `qN`; transpose reverses product order | Correct distinction between inverse and transpose. |
| 5.1 dominance | `GL₂` slopes `(0,0)` / `(−1/2,1/2)` | Polygon height at 1: `0>−1/2`; endpoints both `0` | Correct direction. |
| 5.2 general gap | `G_m`, norm character / finite-order character | Newton `1` / `0`; `ρ=0`, coroot cone `{0}` | R05. |
| 5.2 uniqueness | `G=PGL₂` | Component space dimension `2`; translations have eigenvectors `(1,1)` and `(1,−1)`, eigenvalues `±1` | R06. |
| 5.3 generic ordinarity | Rank-two log fibre | Zero-fibre slopes `−1/2,1/2`; generic dominance is at least this class and cusp bound at most it, forcing equality | Argument direction sound with repaired cusp input. |
| 6.1–6.2 generated groups | Trivial torus functor; `SL₂ Std⊗Std` | Generated trivial group dimension `0`; `2⊗2=3⊕1` contains one invariant line | Subquotient closure and torus exclusion discriminate. |
| Repaired 6.3 principal strings | `sl₃`, `G₂` | Correct `3+5=8`; printed `1+3=4`; `14/6=7/3<3` | F04 repaired. |
| 6.4 classification | `A₂` at odd `p` / `p=2` | Group dimensions `8` / `3`; even-characteristic case is postponed | No prime is discarded; order repair R09. |
| 6.5–6.6 simple wild/rigidity | `SL₂`, odd `p` | `h=2`, break `1/2`, adjoint Swan `1`; Euler term `−1+1+0=0` | Sound on this instance; `p=2` excluded from prime-to-Weyl clause. |
| 7.1 central torsor | `SL₂`, multiply Frobenius by `−1` | Eigenvalues change from `{c⁻¹,c}` to `{−c⁻¹,−c}` | Normalization removes nontrivial center. |
| 7.2 loop action | `SL₂`, `(a,id)` | Correct affine coordinate product becomes `a·u₀u₁`; scaling both gives `a²u₀u₁` | Action must be defined, R16. |
| 7.3 radius at infinity | `SL₂ Ad`, `y=1/x` | Recurrence forces every `u_k,v_k,w_k=0`; claimed nonzero solution would require dimension at least `1` | R01. |
| 7.4 integral scaling | `p=2`, rank-two series, `u=2` | Original radius `1`, rescaled radius `|2|₂⁻²=4` | Correct zero-centred scaling test; incompatible with both radii being `1`. |
| 7.5–7.6 representation/companion checks | `G₂⊂Spin₇`; central quotient | `dim Λ²(7)−7=21−7=14`; kernel of `SL₂→PGL₂` has order `2`, not `1` | Correct representation-ring and nonisomorphism controls. |
| Repaired 8.1 all-prime scalar comparison | `p=2`; `F₃,r=3` | `ψ⁻¹=ψ` at 2; at 3, `R₃(1)=−2−3ζ`, inverse character gives `1+3ζ`, its conjugate | F02 repaired; odd-rank sign remains visible. |
| 8.2 matrices | Odd `n=1`; even `n=3` | Odd first coefficient `2λ²`; halving `E` gives `λ²`; even matrix kills `e₃−e₄` whereas adding `E₃₄` gives `−e₃` | Matrix/invariant-line checks discriminate. |
| 8.3–8.6 chart and boundary | `F₂`, `n=3,4` | Chart point counts `3,9`; character sums `3,7`; toric sums `1,1`; `1+4−2=3`, `1+8−2=7` | Fresh exact count confirms corrected constant. |
| 8.4 potential/domain | `n=3`; projective rescaling | Empty `δ_l` sum; all potential numerators/denominators have equal degree; shift `2(n−1)=4` has sign `+1` | Source formula supported. |
| 8.3 normalized splitting | `SO₈/F₂` | `7/8−(−1/8)=1` | Matches invariant line. |
| 9.1 generality | `q=7`, upper `(0,1/2)`, lower `1/3`; balanced `(0;1/2)` | Differences `−1/3,1/6` nonintegral, rank `2`; balanced rank `1`, singularity at `1` | R08. |
| 9.1–9.2 zero spectrum | `n=3,m=1`; `n=2,m=0` | `α,αq,αq²` normalize to `q⁻¹,1,q`; scalar case `c_q⁻¹,c_q` | Three/two nonzero eigenvalues, correct endpoint. |
| 9.2 degree normalization | Degree two, one quadratic Gauss sum over `F₃` | `g₂=3=−g₁²`; `α₂=−3=α₁²` with `α₁=−g₁` | Base-field scalar squares correctly. |
| 9.3–9.4 odd trace/convolution | `F₃,a=1`, `n=1,2,3` | `U_n=1,7,−11`; `g(U_n−3)=2+4ζ,−4−8ζ,14+28ζ`, equal to direct `H_{2n+1}(1)`; convolution at `n=2,3` gives `4,−14` on both sides | Fresh exact checks; normalized factor is `−Q⁻¹/²`. |
| 10.1–10.2 signed congruence | `m=s=1,N=4`, Bessel data `n=1,2` | Coefficients `640/27`, `23296/243`; moduli `−16`, `−64`; quotients `−40/27`, `−364/243`, valuations `3,2≥0` | Fresh exact divisibility checks. |
| 10.1 ordinary negative control | Rank-three constant sequence | `B(4)/B(2)=1/27`; differences from `1`/`−1` have valuations `1`/`2` | Signed condition necessary. |
| 10.3 unit-root line | Geometric series, `p=2,q=4` | `η=1/(1−x)`; `f₂=1+x`; `f₄=1+x+x²+x³=(1+x)(1+x²)`; `f₄(0)=1` | Multipliers telescope and are units on the stated formal open. |
| 10.4 two series | `n=1`, coefficients through degree 2 | `F=1−8x+8x²+…`, `G=1+8x+24x²+…`; `F/G=1−16x+112x²+…`; both first reductions `1` | Period-two signs and unit ratio supported. |
| 10.4–10.5 Frobenius bridge | `h=F/G`, quotient `q^n/f_F` | `h f_G=f_F h(x^q)` by cancellation; quotient slope `n`, whereas `f_F` has slope `0`; logarithmic derivatives are opposites | Correct dual quotient, not an unscaled unit-root quotient. |
| 10.6 characteristic-two comparison | `F₂`, `n=1,2,3` | `U_n=1`, `R_{2n+1}=−1`; normalized traces both `−1/2^n` | Fresh trace checks. |
| 11.1 raw identities/headlines | `F₂`, `n=1,2,3`; `F₃` above | `1−2=−1` on both sides; odd/convolution values as above | Three Lean identities survive the tests. |
| 11.1 rank-zero API | `F₂,k=0,a=1` | Product-fibre definition `1`, eliminated formula `−1` | R12. |
| 11.2 toric slopes | `n=1,p=3,d=1,2` | Degrees `3,6`; predicted slopes `0,1,2` and `0,1/2,1,3/2,2,5/2`; half-integer quotient has `1/2,3/2,5/2` | Degree/normalization arithmetic consistent; general toric theorems remain uncertified-source dependent. |
| 11.3 ordinarity headline | `F₂,n=1,a=1`; rank-two roots `α+β=−1,αβ=2` | Eigenvalues `α²,2,β²`: power traces `−1,5`; elementary symmetric values `−1,−2,8`, valuations `0,1,3`, successive slopes `0,1,2` | Fresh small case; agrees with prior higher-rank computed rows. |
| 11.4 exceptional branch | `SL₃`, `SL₇` at 2 | Standard ranks `3,7`; monodromy dimensions `3,14`; ambient adjoint dimensions `8,48` | Standard identification does not identify adjoints. |
| 11.5 local invariant test | `A₄⊂SO₃` | Character average `(3+3·(−1)+8·0)/12=0`; even Weyl order excludes the `p∤|W|` assertion at 2 | Correct all-prime versus prime-to-Weyl distinction. |

Inherited evidence used only where the previous review supplies actual numbers: the `F₄/F₈` character-shift counterexamples; orthogonal ordinarity with elementary symmetric values at rank seven and at `p=3,n=2`; and the larger signed-congruence coefficient grid. These were not rerun in full. The small fresh calculations above cross-check their normalizations. No blanket “all seven fields checked” claim is made for this round.

## Not verifiable

- `AS89`, `Wan93`, `Wan04`, `Bal82`, `DH35`, `ESDE`, `KatzCC`: seven settled uncertified manifest entries. Their original texts were not available and were not requested again. In particular, the general all-prime toric ordinarity proof and Katz's full zero-inertia computation are not independently source-certified here; XZ's statements and small numerical tests were read.
- BD §§5.3, 5.5, 7.8: the cached text is available, but the full foundational arguments were not reverified; the localization claim was checked directly against Zhu Theorem 8/Corollary 9. This is not a missing-source request.
- A finite adversarial calculation cannot certify all the promised deep constructions. R02–R04 identify specific proof gaps rather than treating the source citation or a `sorry` build as their proof. The package is not accepted pending these repairs.

All 24 cited works have manifest entries; no new key, source entry or missing-reference request was added. No source content was copied into the repository.

## Source issues

- **Misprint** in HNY at Remark 2.5, printed p. 257: the source describes the affine factor using `I(1)/I(0)`; it should be `I(1)/I(2)`; affects nothing.
- **Misprint** in HNY at Definition 2.6, printed p. 257: the tame-character sheaf is placed on the `(0,2)` stack; it should use the `(1,2)` level and its dimension shift; affects nothing.
- **Gap** in XZ at §4.3.6, p. 49: the source makes a finite central local system extending to the affine line trivial; it should address constant coefficient-field torsors or explicitly work geometrically; affects the proof.
- **Misprint** in XZ at Lemma 4.5.5, p. 53: the source indexes principal strings by exponent minus one; it should use `Sym^{2e_i}` for the exponents `e_i`; affects the proof.
- **Misprint** in XZ at §5.2.3, p. 57: the source ends the rank-n zero spectrum at `q^{2n}α`; it should end at `q^{n−1}α`; affects nothing.
- **Error** in XZ at Proposition 5.3.5(ii), pp. 59–60: the source gives boundary constant `(q−1)q^{n−2}`; it should be `q^{n−1}−q`, giving 7 rather than 5 at `n=4,q=2`; affects a stated result.
- **Error** in XZ at (1.2.9.1), p. 6: the characteristic-two raw rank-three sum has an extra factor `−1/√q`; it should have coefficient one; affects a stated result.
- **Error** in XZ at (1.2.9.2), p. 7: the raw convolution is equated to `−(U_n−q^{n−1})/√q`; it should equal `U_n−q`; affects a stated result.
- **Misprint** in XZ at Proposition 5.3.8(i), p. 61: the normalized zero spectrum includes zero as its middle eigenvalue; it should include one; affects nothing.
- **Error** in XZ at §5.3.9 and Corollary 5.3.11(i), p. 61: the normalized trace convolution omits the cohomological sign and half twist; it should have the trace factor `−q^{−1/2}` in the roadmap's normalization; affects a stated result.
- **Gap** in XZ at Proposition A.9, p. 66: the quotient identification uses the solution line without its dual connection and normalized Frobenius; it should use `d+η dx` and multiplier `q^n/f`; affects the proof.
