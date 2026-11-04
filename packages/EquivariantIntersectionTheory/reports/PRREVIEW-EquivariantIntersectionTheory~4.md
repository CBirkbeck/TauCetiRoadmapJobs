# Review of EquivariantIntersectionTheory (pull request #1685 at 1100c7d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/EquivariantIntersectionTheory/README.md` and `Suggested.lean`. The gate fails on
one rule (`blob`, four hits, R02); every other check passes, the targeted build passes, and
`lake env lean` on `Suggested.lean` at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`) reports
`sorry` as the only warning. The dependency check reports no UPWARD or CYCLE line. One blocking
finding (R01); the rest are P3.

## R01 (P2) — 3.3 claims the full Edidin–Hu Chow ring with no route and no inputs

Location: `README.md` line 275–277, "Prove Edidin–Hu, Theorem 1.3:
`A^*([M_{0,2g+2}/𝔖_{2g+1}]) ≅ ℤ[l]/(2g(2g+1) l)` for `g ≥ 2`, over an algebraically closed field of
characteristic not dividing `2g + 2`."

Claim: the roadmap proves the integral Chow ring of `[M_{0,2g+2}/𝔖_{2g+1}]` in every characteristic
not dividing `2g + 2`.

Witness: the only route the README gives for this stack is 3.4 (lines 281–299), which is stated in
characteristic `0` and computes `A¹` only: for `g = 2`, `n = 6`, `m = 5`, the slice gives
`A^*_{𝔾_m}(𝔸⁴ ∖ {Δ = 0}) = ℤ[t]/I` with `I` the image of `A^{𝔾_m}_*(Δ)`; in degree 1 the image is
`ℤ·[Δ] = 20 t` (Δ integral), which is `Pic = ℤ/20`, but in degree 2 the image is the pushforward of
`A^{𝔾_m}_1(Δ)`, which the localisation sequence of 2.2 does not compute, so nothing in Layers 0–3
yields `A² = ℤ/20`. Edidin–Hu prove the ring through the `T`-equivariant Chow rings of their
`U_w` and the `GL₃`/`PGL₂` presentation (Edidin–Hu arXiv 2208.00556v2 text, line 387 and lines
745–755, Theorem 5.8 "the proof is essentially the same as the computation ... given the
`T`-actions"), inputs that no layer, no `*Needs:*` line and no supplier section provides (2.3 gives
only `𝔾_m`, tori, `GL_n`, `μ_n`). The characteristic also drifts: 3.4 needs `m = n − 1` invertible
for the `𝔾_a`-slice and characteristic `0` for `depressedDiscr_prime`, while the target is stated
for every characteristic not dividing `2g + 2`.

Repair, tested on `g = 2`: state in 3.3 only what the routes deliver, "`Pic [M_{0,2g+2}/𝔖_{2g+1}]
≅ ℤ/2g(2g+1)` in characteristic `0`, by 3.4; this is the degree-one part of Edidin–Hu, Theorem
1.3, which holds over an algebraically closed field of characteristic not dividing `2g + 2`
(agreement, not a target)". If the full ring is wanted, add the inputs as targets with their own
`*Needs:*` lines: `A^*_{PGL₂}` or the `[X/PGL₂] ≅ [Y/GL₃]` presentation and the torus-equivariant
computation of Edidin–Hu §5, and extend 0.5 and 3.4 to the characteristics claimed.

## R02 (P3) — gate `blob` rule, process narrative and a revision pull request cited as a supplier

Location: `README.md` lines 39, 40, 41 (three `github.com/.../blob/<sha>` links, four gate hits),
line 39 "reorganised as §6.1 in its open revision", line 130 "(L2A, §6.1 in its open revision)".

Claim: the gate rule `blob` ("no link into the roadmap repository pinned to a commit") fails, and
the README cites the open revision of AlgebraicVectorBundles (a pull request that revises an
existing roadmap, which is never a dependency) and narrates its state.

Witness: gate output `blob=4 ... FAIL`; AlgebraicVectorBundles L2A on main (its README lines
306–339, "Export the affine graded-ring interface ... localization, affine-restriction and
arbitrary-base-change comparisons") already carries everything 0.3 consumes.

Repair: replace the three table cells by names, "AlgebraicVectorBundles L2A",
"SchemeAndStackFoundations §§1.15, 1.21, 1.22, 2.23, 3.4, 5.1–5.6", "SchubertGeometry S3"; delete
both "open revision" clauses (cite L2A as it is on main); no acceptance while the gate fails.

## R03 (P3) — locators: Edidin–Graham numbering, and four citations without a locator

Location: `README.md` line 239–240 "(Edidin–Graham 1998, Proposition 18, as cited by Arsie–Vistoli
in the proof of their Theorem 5.1)"; lines 234–235 "(Edidin–Graham; Totaro)"; line 185
"(Knop–Kraft–Luna–Vust)"; lines 47–48 "SchemeAndStackFoundations (the moduli stack of stable
pointed curves)"; lines 45–46 "the group-scheme layer that SchemeAndStackFoundations §1.15 cites".

Claim: the locators point to statements that are either not where they are cited or not located.

Witness: in the only legal text of Edidin–Graham, arXiv alg-geom/9603008v3, Proposition 18 is a
torus-localisation statement about `A_0` (eg1998 line 1394) and the text contains no occurrence of
`Pic`; the statements 2.1 cites as "appendix" are Lemma 12 (eg1998 line 1572) and Proposition 22
(line 1595), and hypothesis (1) is at line 145. Arsie–Vistoli cite the published numbering
(arXiv math/0301008v2 text, line 618), which is not readable legally here. Brion names the KKLV
statements: "a version of [KKLV89, Lem. 2.2, Prop. 2.3]" (brion2015 line 251–252). The moduli stack
is SchemeAndStackFoundations §4.15 (`Mbar.smooth` is `M_{g,n}`). The group-scheme supplier is
unnamed: §1.15's `*Needs:*` line cites Mathlib and Tau Ceti `CommHopfAlgCat`, not a roadmap.

Repair: cite Edidin–Graham by one numbering and say which (the arXiv one is checkable:
Definition-Proposition 1, Lemma 12 and Proposition 22 of the appendix; for `Pic^G(X) ≅ A¹_G(X)` cite
the published Proposition 18 with "published numbering" and `uncertified`); give 2.3 its locators
(Totaro, Theorem 1.1 and Definition 1.2 for the independence, and the section where `BGL_n` and
`B𝔾_m` are computed); write "Knop–Kraft–Luna–Vust, Lemma 2.2 and Proposition 2.3"; write
"SchemeAndStackFoundations §4.15"; name the group-scheme supplier (Mathlib `CommHopfAlgCat` /
`GroupSpace` as SchemeAndStackFoundations §1.15 uses them).

## R04 (P3) — 0.2 names a Mathlib input that is not at the pin

Location: `README.md` lines 110–111, "The Laurent-unit lemma over a domain and the idempotent
characterisation of connectedness are the Mathlib inputs."

Claim: Mathlib at the pin has a lemma that the units of `R[t, t⁻¹]` over a domain are `c tⁿ`.

Witness: `Mathlib/Algebra/Polynomial/Laurent.lean` at `f6090c70` has `isUnit_T` (line 228) and no
characterisation of units; the only such lemmas are `Polynomial.isUnit_iff` and
`MvPolynomial.isUnit_iff` (`Mathlib/Algebra/MvPolynomial/Nilpotent.lean` line 58). The idempotent
characterisation does exist: `PrimeSpectrum.isClopen_iff`
(`Mathlib/RingTheory/Spectrum/Prime/Topology.lean` line 1382) and `isIdempotentElemEquivClopens`
(line 1401).

Repair: make the Laurent-unit lemma a stated input of 0.2 (for a domain `R`, a unit `u` of
`R[t, t⁻¹]` has `t^N u` a unit of `R[t]`, so `Polynomial.isUnit_iff` gives a monomial), and name
`PrimeSpectrum.isClopen_iff` as the Mathlib input for connectedness.

## R05 (P3) — README shape: missing sections, `*Needs:*` lines and Checks; a backticked name that `Suggested.lean` does not declare; a consumption claim about a main roadmap

Location: whole README; line 161 "the groupoid `LinearizedLine G X`" (also lines 167, 197); line 41
"Those roadmaps consume it for their flag varieties".

Claim: the README has the upstream shape and its backticked names are declared.

Witness: there is no `## Exact supplier contracts`, `## How to read the build`, `## Downstream
consumers`, no `### Examples` or `### Dependencies` in any layer and no `*Needs:*` line on any
target; 0.3, 0.4, 1.1, 1.4, 2.1 and 2.2 define objects with no `**Checks.**` list (0.1, 0.2, 0.5, 2.4
and 3.4 have them). `LinearizedLine` occurs nowhere in `Suggested.lean` (a backticked name of the
roadmap's own is a claim that the file declares it). SchubertGeometry is on main, earlier in the
order, and its S3 (its README lines 46–53) constructs `L(λ)` "with its actual linearization,
local transition functions and sections ... tensor, dual, pullback, associated-bundle and
field/base-change laws" itself and cites this roadmap nowhere; GroupSchemesOverABase (open,
its README line 78) does cite 1.1 as the owner of `Pic^G`.

Repair: add the four sections and per-layer `### Examples` / `### Dependencies`; give every
target a `*Needs:*` line (for example 2.4: "Layer 1 1.4, Layer 2 2.1–2.2, SchemeAndStackFoundations
§5.3"); give 0.3, 0.4, 1.1, 1.4, 2.1 three Checks each (0.3: `k[t]` with `f = t`, degree `−1`
contains `t⁻¹`; `f = 1` gives `𝒜` back; `f = 0` gives the zero ring with every degree `⊤`); write
`LinearizedLine` without backticks or add a definition in Lean (not possible at the pin, so prose);
replace "Those roadmaps consume it" by "SchubertGeometry S3 builds the `G/B⁻` case itself; 1.4
restricted to `G/B⁻` agrees with it", keeping GroupSchemesOverABase as the consumer.

## R06 (P3) — `Suggested.lean` docstring: non-statable headlines unnamed, process wording

Location: `Suggested.lean` lines 5–23.

Claim: the module docstring names the headline theorems that are not statable at the pins and what
each lacks.

Witness: it says "not exhaustive" and "suggest Lean forms for the milestones of Layer 0", and
"`sorry` is allowed in this human-owned roadmap library: these are goals, not proofs", but names
none of `Pic [X/G] ≅ Pic^G(X)` (1.4), `Pic^G(X) ≅ A¹_G(X)` (2.4), `Pic M_{1,1} ≅ ℤ/12` (3.2), the
Arsie–Vistoli and Edidin–Hu orders (3.3), `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n−1)(n−2)` (3.4). At the pins
there is no quotient stack, no `G`-linearised sheaf and no equivariant Chow group (Mathlib
`AlgebraicGeometry` has no stacks; Tau Ceti has `LineBundleClass` only), so each of these lacks its
carrier, which the docstring must say.

Repair: list the five headlines with the missing carrier of each (quotient stacks and
`Stacks.QCoh`; linearised invertible sheaves; equivariant Chow groups; `M_{1,1}`, `M_{0,n}`), and
delete the sentence about `sorry` being allowed.

## R07 (P3) — unused hypotheses in two statements; a README/Lean mismatch on `Finite σ`; a one-term corollary

Location: `Suggested.lean` line 87 (`hw`), lines 94–96 (`[Finite σ]`, `hw`, `he`), lines 133–138;
`README.md` line 135 "positive weights on a finite type `σ`".

Claim: the hypotheses are needed.

Witness: `homogeneousUnitDegrees_weighted` holds for `w = 0` (the units of `K[σ]` are the nonzero
constants whatever `w`, and a constant is weighted homogeneous of weight `0` only), so `hw` is
unused. `homogeneousUnitDegrees_away_prime` holds for `e = 0` (then every unit `c fᵐ` has degree
`0` and `zmultiples 0 = ⊥`), for negative weights (the unit computation uses only that `K[σ]` is a
UFD and `f` prime) and for infinite `σ`, so `hw`, `he` and `[Finite σ]` are unused; the README says
"finite type" for both statements while the Lean has `[Finite σ]` on one. The probe file closes
`homogeneousUnitDegrees_depressed` by one application of `homogeneousUnitDegrees_away_prime` to
`depressedDiscr_mem` and `depressedDiscr_prime` (elaborated at the pin; the only side goals are
`0 < i + 2` and `0 < m(m−1)`).

Repair: drop `hw`, `he` and `[Finite σ]` from the Lean (or keep them and say in the README that
they are the geometric setting, not hypotheses of the statements); make the README's "finite
type" match the Lean; `homogeneousUnitDegrees_depressed` may stay as the roadmap's named
computation or go, the author's choice (a corollary of the file's own statements, not of the
library).

## R08 (P3) — 1.4 slice reduction stated set-theoretically; 3.4 item 4 names a line bundle that does not exist on the stack

Location: `README.md` lines 201–203 "a section `Y ⊆ X` stable under `T` and meeting each `U`-orbit
once, `[X/G] ≅ [Y/T]`"; lines 292–294 "The tangent line at each of the other points is `O(χ)` ...
their tensor product over the `m` points ... is `O(χ^m)`".

Claim: `[X/G] ≅ [Y/T]` follows from `Y` meeting each `U`-orbit once.

Witness: the isomorphism `G ×^T Y → X`, `[(g, y)] ↦ g·y`, is an isomorphism of schemes exactly when
the action map `U × Y → X` is one; "meeting each orbit once" is bijectivity on points. In 3.4 the
inverse is `p ↦ (a₁/m, p(x + a₁/m))` with `a₁` the coefficient of `x^{m−1}`, which needs `m`
invertible (characteristic `0` as stated). The `m` roots of a point of `U` are unordered, so "the
tangent line at each of the other points" is not a line bundle on `[U/Aff]`; the tensor product
over the roots is (the fibre `⊗_i T_{r_i}ℙ¹` descends, with `Aff`-weight `a^m`).

Repair: state the slice hypothesis as "the action map `U × Y → X` is an isomorphism" and say in
3.4 item 4 that only the tensor product over the roots is a line bundle on `[U/Aff]`, with its
weight computed on the fibre.

## Verified sound

**Gate and build.** Gate at `1100c7d`: every scanner 0 except `blob=4` (R02); `depcheck=0`,
`build=0`. `lake env lean Suggested.lean` at the pins: nine `declaration uses sorry` warnings, no
error. The dependency check:

```
depcheck: 205 roadmaps, 1660 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap folder contains `README.md`, `Suggested.lean`,
`metadata.toml` only; the pull request changes nothing outside the folder.

**Elaborated signatures.** `#check @` of all fifteen declarations in the probe file (elaborated at
the pin) agree with the README statements of 0.1–0.5: `exists_isUnit_mem_of_connected` carries
`[GradedAlgebra 𝒜] [DirectSum.Decomposition ℳ] [SetLike.GradedSMul 𝒜 ℳ]` and the idempotent
hypothesis; `eq_map_mulLeft_of_isUnit_mem` carries the same three instances; `awayGrading`
carries `f ∈ 𝒜 e`; nothing lost a section binder. Generality README = Lean except the `Finite σ`
mismatch of R07.

**One-tactic probe (padding).** Each of the nine sorried theorems was tried with
`first | rfl | simp | infer_instance | decide` on a copy at the pin: none closes. The m = 2 witness
`depressedDiscr K 2 = −4 · a₂` closes with `Polynomial.discr_of_degree_eq_two` and `simp; ring`, so
the README Check of 0.5 agrees with Mathlib's `discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`
line 935, sign chosen so real-rooted polynomials have nonnegative discriminant; line 955 gives
`coeff 1² − 4 coeff 0 coeff 2`). No declaration restates a definition or mirrors a Check.

**Library declarations opened at the pin.** `Polynomial.discr` (Resultant/Basic.lean 935),
`discr_C` (943), `discr_of_degree_eq_one` (948), `discr_of_degree_eq_two` (955);
`MvPolynomial.weightedGradedAlgebra` is a `def` with `@[instance_reducible]`, not an instance
(`RingTheory/MvPolynomial/WeightedHomogeneous.lean` 696), which the file does not need since
`awayGrading` and `homogeneousUnitDegrees` take a bare family; `HomogeneousLocalization.Away`
(`RingTheory/GradedAlgebra/HomogeneousLocalization.lean` 599) with `Away.mk` taking `x ∈ 𝒜 (n • d)`,
the degree-zero part 0.3 identifies; `SetLike.GradedSMul` (`Algebra/GradedMulAction.lean` 109);
`PrimeSpectrum.isClopen_iff` (Topology.lean 1382); `LaurentPolynomial.isUnit_T` (Laurent.lean 228);
`MvPolynomial.isUnit_iff` (Nilpotent.lean 58). Tau Ceti: `LineBundleClass`
(`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`); no linearisation, stack or equivariant Chow
carrier at either pin.

**Cross-roadmap citations resolved on main (`929496d`).** SchemeAndStackFoundations §1.15 (torsors,
`Gm S`, `picEquiv`, README line 2502), §1.21 (`actionQuotient G X`, `actionQuotient.torsorEquiv`,
`.torsor`, lines 2964–2966), §1.22 (`Stacks.QCoh`, `QCoh.presentationEquiv` for `[U/R]`, lines
2991–2995), §2.23 (`EquivariantModules X Γ act` for a discrete group, line 4563), §3.4
(`LineBundleClass`, line 4789), §§5.1–5.6 (`ChowGroup κ X k`, pushforward, pullback, localisation,
`c₁`, Chern classes, Gysin maps, products on smooth varieties, lines 6567–6921), §4.15 (`M̄_{g,n}`,
`Mbar.smooth`, line 5725). AlgebraicVectorBundles L2A (lines 306–339). SchubertGeometry S3 (lines
46–53). GroupSchemesOverABase (open pull request) cites this roadmap's 1.1 as the owner of `Pic^G`
(its README lines 78, 490). The two names the resolver flagged, `QCoh.presentationEquiv` and
`actionQuotient.torsorEquiv`, are README targets of SchemeAndStackFoundations, not pinned
declarations: fine. Ownership: `roadmaps grep` over the 440 open pull requests and main for
"equivariant Chow", `Pic^G`, linearised invertible sheaves, `ShiftClassGroup`, Totaro, `M_{1,1}`
Picard: no second owner; SchubertGeometry at its open revision builds the `G/P⁻` case (its lines
402–433), consistent with the boundary table.

**Sources at their locators (seeded sample, all fifteen targets).**
- 0.1–0.4: Mathlib only, as above.
- 0.5: `Polynomial.discr` as above; m = 2 and m = 3 Checks recomputed (`−4a₂`, `−4a₂³ − 27a₃²`,
  weights 2 and 6).
- 1.1: Mumford–Fogarty–Kirwan Ch. 1 §3 (Definition 1.6: `φ : σ^*L ≅ p₂^*L` with the cocycle
  condition) is paywalled: uncertified, see below.
- 1.2: no external source; checked by computation (table).
- 1.3: brion2015 lines 105–116 (arbitrary field, `G` a connected smooth group scheme of finite
  type, `Ĝ` the character group as an étale sheaf), Proposition 2.10 at lines 253–255: the sequence
  `0 → O(X)^{*G} → O(X)^* → Ĝ(X) → Pic^G(X) → Pic(X) → Pic(G × X)/p₂^*Pic(X)` for `X` a reduced
  `G`-scheme, exactly as the README restates it (dropping the first two terms). With
  `O(X)^* = k^*` the map to `Ĝ(X)` is zero, and for `X` normal with `O(X)^* = k^*` the field `k`
  is separably closed in `k(X)`, so `X` is geometrically connected and `Ĝ(X) = X^*(G)`: the
  README's second sequence follows. The first sequence (finite constant group) is standard
  (kernel of the forgetful map = `H¹(G, O(X)^*)`).
- 2.1: eg1998 (arXiv v3) line 143–146, hypothesis (1): "`X_red` is quasi-projective and the action
  is linearized with respect to some projective embedding" (equivalent to the README's "with a
  `G`-linearised ample invertible sheaf", a power of which gives the equivariant embedding);
  Definition-Proposition 1 at line 168–170 with `A^G_i(X) = A_{i+l−g}(X_G)` and the codimension
  condition "more than `n − i`" at line 160; Bogomolov's double fibration at line 179; existence
  of `(V, U)` for every `i`: Lemma 12 of the appendix (line 1572); the mixed space as a principal
  bundle quotient: Proposition 22 (line 1595) with quasi-projectivity from [GIT, Prop 7.1] (line
  1604–1606).
- 2.2: eg1998 §2.3–2.4 (Propositions 1–3 at lines 229–399) for pushforward, pullback, Chern classes
  and the localisation sequence; Proposition 2 (line 278) for `A^i_G(X) = A^G_{n−i}(X)` on smooth
  `X` of dimension `n` (Convention 4).
- 2.4: not verifiable in the legal text (R03); Arsie–Vistoli's use of it at line 618–625 of the
  arXiv math/0301008v2 text confirms the statement as used ("`Pic(H_sm) = A¹_{GL_{n+1}/μ_d}
  (A_sm)`", and `A^G_{−1}(Spec k) ≃ Pic^G(Spec k)` by their "[Ed-Gr98, Theorem 1]").
- 3.1: by computation (table).
- 3.2: fo2010 lines 44–48, Theorem 1.1: `ℤ/12 × Pic(𝔸¹_S) → Pic(M_{1,1,S})`, `(i, L) ↦ λ^i ⊗ p^*L`,
  an isomorphism when `S` is a `ℤ[1/2]`-scheme or reduced; Lemma 2.4 (line 110) `λ` generates.
  Matches the README, including `Pic(𝔸¹_k) = 0` for a field.
- 3.3: Arsie–Vistoli (arXiv math/0301008v2 text) Corollary 4.2 at line 410 (`H_sm(n,r,d) ≅
  [A_sm(n,rd)/(GL_{n+1}/μ_d)]`), Corollary 4.7 at line 503 (hyperelliptic curves of genus `g`),
  Theorem 5.1 at line 522–525 (over a UFD whose fraction field has characteristic not dividing
  `2rd`, cyclic of order `r(rd−1)^n gcd(d, n+1)`), Remark 5.5 at line 706–708: for `n = 1`,
  `r = 2`, `d = g + 1` the order is `2(2g+1) gcd(g+1, 2)`, which is `4g + 2` for `g` even and
  `8g + 4` for `g` odd, under characteristic not dividing `4(g+1)`: as the README states.
  Edidin–Hu (arXiv 2208.00556v2 text) lines 63–64: `g ≥ 2`, algebraically closed field,
  characteristic not dividing `2g + 2`; Theorem 1.3 at lines 86–88:
  `A^*([M_{0,2g+2}/S_{2g+1}]) = ℤ[l]/(2g(2g+1) l)`; Theorem 5.8 at line 746–749 names the generator
  `l = −l₁ + (g+1) l₂`. The hypotheses are as the README states; the route is the matter of R01.
- 3.4: hua2026 lines 163–167 (the slice route exactly as items 1–4, including "`T_∞ℙ¹` has
  weight `∓1`" and "`[L]` pulls back to `±(n−2)` times the generator and has order `n − 1`"), line
  190 (the author's note that odd `n` is not in the literature); the README says "not refereed"
  and rests the theorem on items 1–4, which the table recomputes.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `homogeneousUnitDegrees`, `mem_..._iff` | nonzero ring, trivial grading; zero ring; `k[t,t⁻¹]` with `deg t = 1`; `deg t = 2`; inverse of a homogeneous unit | units lie in `𝒜 0` only: `⊥`; zero ring: `0 = 1 ∈ 𝒜 d` for all `d`: `⊤`; `t^n` of degree `n`: `⊤`; degree `2n`: `2ℤ`; `u ∈ 𝒜 d`, `u⁻¹ = Σ v_e`, `1 = Σ u v_e` forces `v_e = 0` for `e ≠ −d`: set already a subgroup | all four Checks and the iff correct | none |
| 0.1 `eq_map_mulLeft_of_isUnit_mem` | `u ∈ ℳ c`; `x ∈ ℳ n`, `u⁻¹x = Σ a_d`; zero ring | `⊇`: `𝒜(n−c)·ℳ c ⊆ ℳ n` by `GradedSMul`; `⊆`: `x = Σ u a_d`, `u a_d ∈ ℳ(c+d)`, uniqueness in `ℳ` kills `d ≠ n − c`, `u` a unit kills `a_d`; zero ring: both sides `⊤ = ⊥` | true, `ℳ ≅ A(−c)` as stated | none |
| 0.2 `exists_isUnit_mem_of_connected` | `1 = Σ m_e`; prime `p`; `A = k × k`; zero ring | `ρ_ℳ(a) = ρ_𝒜(a) u(t)` with `u(t) = Σ m_e t^e`, `u(t)·Σ ρ_𝒜(m_e) t^{−e} = 1`, so `u` a unit of `A[t,t⁻¹]`; mod `p` a unit of a Laurent ring over a domain is a monomial: exactly one `m_e ∉ p`; `D(m_e)` disjoint open cover, connected ⇒ one `D(m_c) = Spec A` ⇒ `m_c` a unit. `k × k`: units `(a,b)`, `a,b ≠ 0`, never in `k×0` or `0×k`: no generator; gradings `ℤ²` vs `ShiftClassGroup = ℤ`. Zero ring: hypothesis true (`0 = 1`), conclusion true (`0 ∈ ℳ c`) | proof route sound; negative control correct | Laurent-unit lemma is not in Mathlib (R04) |
| 0.3 `awayGrading`, `_isInternal` | `f = 1`, `e = 0`; `f = 0`; `f = t ∈ k[t]`, degree `−1`; injectivity | `f = 1`: `A_f = A`, grading `𝒜`; `f = 0`: zero ring, every degree `⊤ = ⊥`, internal; `t⁻¹ = 1/t` with `1 ∈ 𝒜(−1 + 1·1)`: degree `−1` nonzero; `Σ a_d/fⁿ = 0 ⇒ f^N Σ a_d = 0` with `f^N a_d ∈ 𝒜(d + (n+N)e)` distinct ⇒ each zero | grading, negative degrees present | none |
| 0.4 `homogeneousUnitDegrees_weighted` | `w = 0`; `w` negative; `σ = ∅` | units of `K[σ]` = `K^*` = `𝒜 0 ∖ 0`: `⊥` in every case | true; `hw` unused | R07 |
| 0.4 `homogeneousUnitDegrees_away_prime` | `σ = {x}`, `w = 1`, `f = x`; `f` of weight `e = 0` (a nonzero constant is not prime, so vacuous); `f = x`, `w = 3`; `f = x², not prime` | units of `K[σ]_f` are `c f^m` (UFD, `f` prime): degrees `me`: `zmultiples e`; `w = 3`: `3ℤ`; `f = x²`: units `c x^{2m}` still give `2ℤ` but `x²` is not prime, hypothesis excludes nothing false | true; `hw`, `he`, `Finite σ` unused | R07 |
| 0.5 `genericDepressed`, `depressedWeight` | `m = 2, 3` | `X² + a₂`, `X³ + a₂X + a₃`; weights `2`, `2,3` | matches README | none |
| 0.5 `depressedDiscr_mem` | `m = 1`; `m = 2`; `m = 3` | `m = 1`: `discr X = 1`, weight `0 = 1·0` (holds, hypothesis `2 ≤ m` harmless); `m = 2`: `−4a₂`, weight `2 = 2·1`; `m = 3`: `−4a₂³ − 27a₃²`, weight `6 = 3·2` (`Π_{i<j}(r_i−r_j)²`, roots of weight `1`) | true | none |
| 0.5 `depressedDiscr_prime` | `m = 2`, char `0`; `m = 2`, char `2`; `m = 3`; general `m` | `−4a₂` prime (4 a unit); char 2: `−4a₂ = 0`, not prime, so `CharZero` needed; `a₃² + (4/27)a₂³` irreducible; general: Tschirnhaus `X ↦ X − a₁/m` identifies the depressed discriminant with the generic one, irreducible in char `0` | true with the stated hypothesis | none |
| 0.5 `homogeneousUnitDegrees_depressed` | `m = 2`; `m = 3` | `2ℤ`; `6ℤ` (README Check) | true; one-term corollary | R07 |
| 1.2 injection `ShiftClassGroup ↪ ker` | `A(d) ≅ A(e)`; `k × k` | an iso `A → A` is `×u`; `𝒜(n+e) = u𝒜(n+d)` at `n = −d` gives `u ∈ 𝒜(e−d)`: injective; `k × k`: image misses `(k×0 in 0, 0×k in 1)`: not surjective | as stated (iso iff connected, 0.2) | none |
| 1.3 sequences | `G` finite constant; `G` connected, `X` normal, `O(X)^* = k^*`; `k` not algebraically closed | kernel of `Pic^G → Pic` = linearisations of `O_X` mod `Aut(O_X) = O(X)^*`: `H¹(G, O(X)^*)`; Brion 2.10 with `χ = 0` on constants: `0 → Ĝ(X) → Pic^G(X) → Pic(X)`; `X` normal with `O(X)^* = k^*` ⇒ `k` separably closed in `k(X)` ⇒ geometrically connected ⇒ `Ĝ(X) = Ĝ(k) = X^*(G)` | true over any field | locator (R03) |
| 1.4 `Pic [X/G] ≅ Pic^G(X)`; change of group; slice | `G = 1`; `H = G`, `Y = X`; `Y = pt` | `[X/1] = X`, `Pic^1 = Pic`; `G ×^G X = X`; `G ×^H pt = G/H`, `Pic^G(G/H) = X^*(H)` (one-dimensional `H`-modules) | consistent | slice hypothesis (R08) |
| 2.1 `A^G_i(X) = A_{i+l−g}(X ×^G U)` | `G = 1`; `G = 𝔾_m`, `V = k^l` weights 1, `X = pt` | `G = 1`: `A_i(X × U)` with `codim(V∖U) > n − i` = `A_i(X)` (homotopy); `𝔾_m`: `A_{i+l−1}(ℙ^{l−1}) = ℤ` for `i ≤ 0`, `0` for `i > 0`: `A^*_{𝔾_m} = ℤ[t]` | consistent with 2.3 | none |
| 2.3 `A^*_{μ_n} = ℤ[t]/(nt)` | `n = 1`; `n = 2`, `k = ℂ` | `μ_1 = 1`: `ℤ[t]/(t) = ℤ`; `(𝔸^N∖0)/μ_2` is the complement of the zero section of `O(−2)` on `ℙ^{N−1}`: `ℤ[t]/(2t, t^N) → ℤ[t]/(2t)` | consistent | locator (R03) |
| 2.4 Check `A^*_{𝔾_m}(𝔸ⁿ∖0) = ℤ[t]/(tⁿ)` | `n = 1`; `n = 2` | `𝔾_m/𝔾_m = pt`: `ℤ`, `Pic = 0` (README says `ℤ` for `n ≥ 2` only: correct); `ℙ¹`: `Pic = ℤ` | correct | none |
| 3.1 `Pic [(𝔸ⁿ∖D)/𝔾_m] = ℤ/e` | `n = 1`, weight `w`, `D = {x = 0}`; `e` via 0.4 | `(𝔸¹∖0)/𝔾_m` with weight `w` is `Bμ_w`: `Pic = ℤ/w = ℤ/e`; localisation: `A¹_{𝔾_m}(𝔸ⁿ) = ℤt`, image of `A^{𝔾_m}_{n−1}(D) = ℤ[D] = ±e t` (`D` integral): `ℤ/e`; 0.4 route: `Pic(k[σ]_f) = 0`, `ShiftClassGroup = ℤ/e` | agree in both descriptions | none |
| 3.2 `M_{1,1}`, `ℤ/12` | weights; generator | `4a³`, `27b²` both weight `12`; `(x,y) ↦ (t²x, t³y)` scales `dx/y` by `t⁻¹`: `λ = O(χ^{∓1})`, a generator | matches Fulton–Olsson | none |
| 3.3 Arsie–Vistoli orders | `g = 2`; `g = 3` | `2·5·gcd(3,2) = 10` (Vistoli's `Pic M₂`); `2·7·gcd(4,2) = 28 = 8·3 + 4` | formula as stated | none |
| 3.3 Edidin–Hu | `g = 2`, `n = 6` | `2g(2g+1) = 20 = 5·4 = (n−1)(n−2)` | agrees in degree 1 only via the roadmap's route | R01 |
| 3.4 items 1–3 | `n = 3`; `n = 4`; `n = 5`; `n = 6` | `m = 2`: `U₀ = Spec k[a₂]_{a₂}`, weight `2`: `Bμ₂`, `ℤ/2`; `m = 3`: `ℤ/6`; `m = 4`: `ℤ/12`; `m = 5`: `ℤ/20`; slice needs `m` invertible: `a₁ ↦ 0` by `x ↦ x − a₁/m` | Checks correct | R08 wording |
| 3.4 item 4 | `T_∞`; product of all `n` | `y = 1/x`, `x ↦ ax + b` gives `y ↦ y/(a + by)`, derivative `a⁻¹`: `O(χ⁻¹)`, class `−1`; roots: `∂/∂x ↦ a ∂/∂x`, product weight `a^m`; all `n`: `m − 1`, order `m(m−1)/(m−1) = m = n − 1` (`m = 2`: order of `1` in `ℤ/2` is `2`) | correct | R08 wording |
| 3.4 Check `n = 4` gerbe | weights `(4,6)` vs `(2,3)` | `t ↦ t²` on `𝔾_m`; `χ^d ↦ χ^{2d}`: `ℤ/6 → ℤ/12` is `×2`, injective, index `2` | correct | none |
| Convention 5 | quasi-affine `X` | `O_X` ample iff quasi-affine, trivial linearisation; every Layer 3 scheme is open in affine space | correct | none |

**Counts.** 15 Lean declarations checked by `#check`; 9 one-tactic probes, 0 closed; 1 Check
witness proved at the pin; 11 Mathlib and 1 Tau Ceti declarations opened; 10 SchemeAndStackFoundations
sections, 1 AlgebraicVectorBundles layer, 1 SchubertGeometry section and 1 GroupSchemesOverABase
row resolved; 6 sources read at their locators (eg1998, brion2015, fo2010, hua2026, Arsie–Vistoli,
Edidin–Hu); 3 sources not readable (below); 25 table rows.

## Not verifiable

- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, Ch. 1 §3 (1.1): Springer, paywalled;
  recorded `uncertified` as `mfk1994`. The definition cited is standard and the README restates it
  correctly from memory of the published text, but the page was not read.
- Knop–Kraft–Luna–Vust 1989 (1.3): Birkhäuser DMV Seminar, paywalled; recorded `uncertified` as
  `kklv1989`. Brion's attribution (brion2015 line 251) supplies the locators.
- Mumford 1965, *Picard groups of moduli problems* (3.2): no legal copy found by the sources
  service; listed in `needs-references.toml`. Fulton–Olsson's Theorem 1.1 covers the statement
  used.
- Edidin–Graham, published numbering (Proposition 18, "Theorem 1" as Arsie–Vistoli cite it): the
  Invent. Math. text is paywalled; the arXiv v3 text has different numbering and no equivariant
  Picard statement (R03).
- Totaro 1999: the arXiv text (totaro1999) was read for Theorem 1.1 and Definition 1.2; the
  explicit `A^*_{GL_n}` and `A^*_{μ_n}` lines were not located in the extraction, so 2.3's
  attribution to Totaro is unverified at a locator (R03 asks for one).

## Source issues

- none
