# GATE-ModularityAndLanglandsExtensionsPartII~1: answers to the human review

One review, by kim-em, against head `285d1db`. Its points are numbered in the order they appear.
Requested change 5 ("wording of the equivalence") restates the first two Correctness bullets, so it
is answered under H01 and H02. The "Dependencies and overlaps" bullet about other pull requests that
use "non-CM" asks for nothing beyond H06. All edits are in
`TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/README.md` and `.../Suggested.lean`, commit
`6a39600d` (not pushed).

## H01 (kim-em) — applied

The converse direction of the §14.5 API bullet ("π_f is CM iff `HasQuadraticSelfTwist f`") used to
read "the converse is strong multiplicity one (§R16.4.4, via AL.3.7.1)". It now names both
coordinates of the shared eigensystem of GL2AutomorphicRepresentationsAndTransfer §R16.4.4 at every
`p ∤ NM`: the trace agrees because `a_p ψ(p) = a_p`, and the determinant agrees because
`ψ(p)² = 1`; AL.3.7.1 then gives `π_f ⊗ χ ≅ π_f`. The bullet adds that traces alone do not suffice,
citing the Check in §R16.4.4: root pairs `(1, −1)` and `(2, −2)` have the same trace and determinants
−1 and −4. The docstring of `HasQuadraticSelfTwist` in `Suggested.lean` now says the same. This also
answers requested change 5.

## H02 (kim-em) — applied

"For `k ≥ 2`" is dropped from the equivalence. The API bullet now reads "for every newform `f` of
weight `k ≥ 1`", with `π_f` the cuspidal class of GL2AutomorphicRepresentationsAndTransfer §R16.6.1
for `k ≥ 2` and of §R16.6.6 for `k = 1`. The argument never uses `k ≥ 2`: at weight one,
§R16.4.4's newform adapter has `s_p = χ(p)/p`, and twisting by `ψ` sends this to `ψ(p)² s_p = s_p`.
The `Suggested.lean` docstring changes from "For weight `k ≥ 2`" to "For every weight `k ≥ 1`".

The analytic theorem keeps `k ≥ 2`, because its icosahedral weight-one Check needs it. That Check
already uses the widened direction: an icosahedral form has no self-twist on either side.

## H03 (kim-em) — applied

The §14.5 proof sketch used to say "Hence `π_f` is non-CM, and it is regular algebraic since
`k ≥ 2`". It now reads:

- `π_alg = π_f ⊗ |det|^{−(k−2)/2}` is regular algebraic (GL2AutomorphicRepresentationsAndTransfer
  §R16.4.5) and non-CM (§R16.4.6, twist invariance).
- For odd `k` the unitary `π_f` itself is not regular algebraic.
- §14.3 is applied to `π_alg`, and `Π = Sym^n π_f = Sym^n π_alg ⊗ |det|^{n(k−2)/2}` because
  `Sym^n(r ⊗ μ) = Sym^n r ⊗ μ^n` at every place.

Witness for odd `k`: the unitary weight-`k` parameter restricted to `ℂ^×` is `z^{(k−1)/2} z̄^{−(k−1)/2}`.
After the `|det|^{−1/2}` shift in the C-algebraic test its exponents are `((k−2)/2, −k/2)`. At `k = 3`
these are `(1/2, −3/2)`, which are not integral. For `π_alg` they are `(0, −(k−1))`, which are
integral.

§14.4 (level one) now states why no twist is needed there: level one forces `k` even, so `π_f` differs
from `π_alg` by an integral power of `|det|`.

The second theorem's docstring in `Suggested.lean` now says that §14.3 is applied to the regular
algebraic twist and the result twisted back. No other passage in the README claims that a unitary
`π_f` of odd weight is regular algebraic.

## H04 (kim-em) — applied differently

A new §14.5 API bullet states that `HasQuadraticSelfTwist f` holds exactly when, for some `M > 0`, a
character `ψ` with `ψ ≠ 1` and `ψ² = 1` has `HeckeRing.GL2.Newform.primitiveTwist f ψ` equal to `f` as
a function on `ℍ`. It gives both directions:

- **Forward:** `f` satisfies the hypotheses of
  `HeckeRing.GL2.Newform.level_eq_primitiveTwistLevel_and_coe_eq_primitiveTwist` at `L = NM`. The
  nebentypus condition `χ_f = χ_f ψ²` holds because `ψ² = 1`.
- **Backward:** `HeckeRing.GL2.Newform.qExpansion_coeff_primitiveTwist`.

Both declarations were checked at the pinned Tau Ceti, `Newforms/Twist.lean` lines 194 and 173. The four
Twist names are added under "From Tau Ceti" and in the *Needs:* line of §14.5.

The lemma is not added to `Suggested.lean`. That file carries only the headline theorems and the
definitions they need, and an API equivalence about the kept definition belongs in the README. The
docstring of `HasQuadraticSelfTwist` mentions it in one sentence.

Scope also now says that newform twists and self-twists are planned in ModularForms §9.2 (on main;
its inner twists `(id, ψ)` with `ψ` quadratic are "the CM case"). Tau Ceti realises them as
`primitiveTwist`, so no second theory of twists is built.

## H05 (kim-em) — applied differently

The supplier for `π_f` is GL2AutomorphicRepresentationsAndTransfer §R16.6.1, "Primitive newforms and
holomorphic cuspidal classes" (main, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md`
line 1315), with §R16.6.6 for weight one.

§R16.6.1 is exactly AutomorphicFormsOnReductiveGroups §§7.2–7.3 specialised, via
R16.1/finite-level-comparison, to Tau Ceti's `HeckeRing.GL2.Newform`. Its API also gives the Satake
parameters that §§14.4–14.5 use: `α_p + β_p = a_p p^{−(k−1)/2}` and `α_p β_p = χ(p)`.
Citing the generic adelization directly would plan that specialisation a second time.

§R16.6.1 is added to:

- the proof sketches and *Needs:* lines of §§14.4–14.5;
- the Layer 14 Dependencies;
- the GL2AutomorphicRepresentationsAndTransfer supplier contract.

## H06 (kim-em) — applied

**Conventions.** A new bullet fixes "non-CM" as the self-twist condition of §R16.4.6. That is also
the sense of ModularityAndLanglandsExtensions §§1.12 and 4.15; §4.15 reads "non-CM RAESDC `GL₂` π (no
nontrivial Hecke self-twist)". The bullet then records that AutomorphicGaloisRepresentations §§7.4–7.5
assume non-CM in the sense of its §3.15: induction from a totally imaginary quadratic extension. This
was read at that pull request's head `c24c682`, where §7.5's *Needs:* line lists §3.15. The bullet
states that the two notions agree for regular algebraic `π` over a totally real field:

- `AI_{L/F}(α) ⊗ η_{L/F} ≅ AI_{L/F}(α)` by the twist API of §R17.4.16.
- A nontrivial self-twist makes `π` a quadratic automorphic induction by §R17.4.13.
- That quadratic field is totally imaginary: `π` is discrete series at every real place, while an
  induction from a field split there has the reducible parameter `θ_w ⊕ θ_{w′}`.

**Scope and other edits.** Scope says which roadmap uses which formulation. The *Needs:* lines of
§§13.3, 13.7 and 14.2 (the users of AutomorphicGaloisRepresentations §§7.4–7.5), the Layer 13 and 14
Dependencies, and the supplier contract now cite §§R17.4.13 and R17.4.16.

**On "no merged roadmap states Labesse–Langlands".** This is contradicted on main: §R17.4.13
(GL2AutomorphicRepresentationsAndTransfer README line 2663) states that a cuspidal `π` with a
nontrivial self-twist is `AI_{E/F}θ` for a quadratic `E`.

**Negative control.** A weight-one dihedral form induced from a real quadratic field (mixed-signature
character, projective image `D_n` with `n ≥ 3`) has a quadratic self-twist. Its parameter at
infinity is `1 ⊕ sgn` (§R16.6.6), so it is not CM in the sense of §3.15. This is why the comparison
assumes regular algebraic `π`.

## H07 (kim-em) — applied

"How to read the build" now says that the two Layer 14 definitions and their elementary API need only
Mathlib and Tau Ceti and can be built first. The definitions are `symPowerEulerFactor` and
`HasQuadraticSelfTwist`; the API is the symmetry, the modulus enlargement, the comparison with
`primitiveTwist` and the Checks on them. The same sentence says that:

- the comparison with the non-CM condition needs only the automorphic suppliers named in §14.5;
- the analytic theorems need §§14.2–14.3.

## H08 (kim-em) — disputed

AutomorphicLFunctionsAndLocalFactors AL.3.6.1 on main
(`TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` line 1745) does more than give
absolute convergence of `L^S(s, π × π^∨)`. Its statement ends with the Cauchy–Schwarz step: the
finite standard Euler product of every unitary cuspidal `π` of `GL_n`, `n ≥ 2`, converges absolutely
for `Re s > 1`. AL.2.4.1 (line 1364) points to AL.3.6.1 for this sharp boundary.

So the citation in §14.4 is to a stated consequence of the supplier, and writing the argument out
again would plan it a second time. No change was made.

The step itself checks: with `a(p^m) = Σ_i α_{p,i}^m`,

    Σ_{p,m} |a(p^m)| p^{−mσ}/m ≤ (Σ_{p,m} |a(p^m)|² p^{−mσ}/m)^{1/2} · (log ζ(σ))^{1/2},

and the right-hand side is finite for `σ > 1`.

## H09 (kim-em) — applied

References entry nt26:

- old: "Ann. of Math. 203 (2026)"
- new: "Ann. of Math. 203(1) (2026), 283–347, doi:10.4007/annals.2026.203.1.4"

Checked: the DOI resolves to Project Euclid's Annals volume 203, issue 1 page for "Symmetric power
functoriality for Hilbert modular forms". The journal's page for 2026/203-1/p04 gives pp. 283–347
and the same DOI.

## H10 (kim-em) — applied

The locator was checked. nt21 line 89 is footnote 1 to Theorem B on p. 2. It defines "does not have
CM" as the absence of a quadratic Hecke character `χ` with `π ≅ π ⊗ χ`.

So the footnote supports the self-twist definition, not the comparison with Fourier coefficients. In
§14.5 the locator moves from the equivalence to the definition ("the self-twist condition of nt21 p.
2, footnote 1"). The equivalence now points to its argument in the API (H01).

## Build

`lake build TauCetiRoadmap.ModularityAndLanglandsExtensionsPartII.Suggested`:

- `Build completed successfully (18830 jobs).`
- The only warnings are the two intended `declaration uses 'sorry'`, at lines 103 and 123.

**Signature check.** I put `#check @name` for all four declarations into one scratch file and
elaborated it once. The elaborated types are identical to the pre-edit signatures: only docstrings
changed in `Suggested.lean`. Each type still matches its README statement:

- `HasQuadraticSelfTwist : {N} → [NeZero N] → {k : ℤ} → Newform N k → Prop`;
- both theorems keep `hk : 2 ≤ k`, `hn : 1 ≤ n` and the `hαβ` hypotheses;
- no section binder is lost.

## Gate

`gate ModularityAndLanglandsExtensionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--depcheck … --pr 2449`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. There
is no UPWARD or CYCLE line.

`roadmaps resolve` on the README finds no cross-roadmap citation or Lean name found nowhere.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `HasQuadraticSelfTwist f` ⇔ `π_f` CM (`k ≥ 1`) | `y² = x³ − x` (N = 32, k = 2), ψ = χ₋₄; Δ; weight-one `η(z)η(23z)`, ψ = (−23/·); M = 1, 2 | a₃ = 0: 0·(−1) = 0; a₅ = −2: (−2)·1 = −2, so both sides hold. Δ at 3: 252·(−1) = −252 ≠ 252, so both sides fail. Weight one at p = 5, inert ((−23/5) = −1): a₅ = 0 = 0·(−1), so both sides hold. M = 1, 2 have no ψ ≠ 1. | holds | weight bound dropped (H02) |
| Determinant coordinate in the converse | ψ(p) = −1: roots (α, β) ↦ (−α, −β); root pairs (1, −1), (2, −2) | det αβ unchanged; traces 0 = 0, dets −1 ≠ −4 | trace alone fails; both coordinates needed | spelled out (H01) |
| `HasQuadraticSelfTwist` ⇔ `primitiveTwist f ψ = f` | `y² = x³ − x` ⊗ χ₋₄; Δ ⊗ χ₋₄; ψ = 1 | odd p: χ₋₄(p)·a_p = a_p, so the twist is f. Δ: a₃ ↦ −252, so the twist is not Δ. ψ = 1: `coe_primitiveTwist_one` gives f, excluded on both sides by ψ ≠ 1. Forward nebentypus: χ_f ψ² = χ_f iff ψ² = 1 on units. | holds | API bullet (H04) |
| `π_alg = π_f ⊗ |det|^{−(k−2)/2}` regular algebraic; unitary `π_f` not, for odd k | k = 2, 3, 12 | k = 2: shift 0, so π_alg = π_f. k = 3: unitary exponents (1/2, −3/2) are non-integral; π_alg gives (0, −2). k = 12: shift −5 is integral, so π_f is regular algebraic. | holds | proof sketch (H03) |
| `Sym^n(π ⊗ |det|^t) = Sym^n π ⊗ |det|^{nt}` | n = 1, 2 with Satake pair (a, b), twist c | n = 2: (ac)², (ac)(bc), (bc)² = c²(a², ab, b²) | holds | added (H03) |
| Satake parameters of `π_f` are `α_p p^{−(k−1)/2}` and `β_p p^{−(k−1)/2}` | Δ at p = 2 | sum −24·2^{−11/2} ≈ −0.530; product 2^{11}·2^{−11} = 1 = χ(2), matching §R16.6.1 | holds | §§14.4–14.5 |
| Level one forces k even | −I ∈ SL₂(ℤ) | f = (−1)^k f, so k is odd only if f = 0 | holds | §14.4 |
| Self-twist ⇔ not induced from a totally imaginary quadratic field (regular algebraic, F totally real) | `y² = x³ − x`; real-quadratic dihedral weight one; twist by `|det|^t` | AI_{ℚ(i)/ℚ} ⊗ χ₋₄ = AI: both sides hold, ℚ(i) totally imaginary. Real-quadratic case: parameter at ∞ is 1 ⊕ sgn, not discrete series, so it is excluded by the hypothesis. AI(θ) ⊗ |·|^t = AI(θ·|N|^t). | holds; hypothesis needed | Conventions (H06) |
| AL.3.6.1 gives `Re s > 1` for the standard product | GL₁ trivial; `n ≥ 2` cuspidal | ζ(σ) diverges at σ = 1 (AL.3.6.1 Check), so the boundary cannot move left; Cauchy–Schwarz bound finite for σ > 1 | holds | none (H08) |
| nt26 citation | DOI resolution; Annals page | 203(1), 283–347 | holds | References (H09) |

## Ownership, overlaps and sources

**Ownership.** The comparison of CM predicates is not stated by any other roadmap. I searched the
roadmaps on main and the open heads (`roadmaps grep` for self-twist near "totally imaginary", "CM
field" or "imaginary quadratic"). The hits were:

- ComplexMultiplicationAndExplicitReciprocity and CMRankZeroConverse: elliptic-curve isogenies;
- ModularIwasawaMainConjecturesPartII: consumes AutomorphicGaloisRepresentations §3.15.

None of them is this comparison. It is recorded here as a convention, assembled from
GL2AutomorphicRepresentationsAndTransfer §§R17.4.13 and R17.4.16, and declares nothing in Lean.

ModularForms §9.2 (main) owns newform twists and self-twists, and is now cited in Scope. No
declaration of `Suggested.lean` was added or renamed.

**Overlaps.** None from `roadmaps overlaps`. No open pull request changes this roadmap, and no cited
id is dropped. Every supplier section added (GL2AutomorphicRepresentationsAndTransfer §§R16.4.5,
R16.6.1, R16.6.6, R17.4.13, R17.4.16; ModularForms §9.2) is on main. No later roadmap is cited.

**Sources.** No text was missing, so there is no `needs-references.toml`. The roadmap folder has no
`sources.toml`, and this job may edit only the README and `Suggested.lean`. So the nt26 issue, page
and DOI data (H09) are not written to the manifest here.

**Suspicious text.** None in the review comment.
