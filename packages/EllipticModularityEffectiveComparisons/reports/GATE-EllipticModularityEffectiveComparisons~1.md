# GATE-EllipticModularityEffectiveComparisons~1: answers to the human review of `5778fc4`

The review (CBirkbeck, 2026-11-05T21:51:17Z) makes two findings, F01 and F02, followed by a
verification record. F01 contains three distinct points (the duplication, the conditional
Downstream-consumers edit, and the claim that some sections are extra content beyond
EllipticCurveModularityPartII), so it is answered as H01–H03; F02 is H04. The copy of the review
supplied to this job is cut off inside the verification table (after the §§3.15–3.16 row). The
visible part contains no further request.

## H01 (CBirkbeck) — answered

Confirmed by object, not only by name: EllipticCurveModularityPartII (open, head `d2cbd93`, merge
order line 186, against line 269 for this folder) states every headline of
`TauCetiRoadmap/EllipticModularityEffectiveComparisons/Suggested.lean` (mapping below). It cannot be
repaired inside this folder, because removing what EllipticCurveModularityPartII plans leaves no
target this folder owns (see H03). So no edit was made for F01, and which pull request survives is
the human decision the review describes. The facts that bear on that decision: both consumers name
EllipticCurveModularityPartII as owner, namely ErdosProgressionPowers (README lines 74, 554,
1016–1098, 1178, 2205: EC.0–EC.5 from its §§1.4–1.8, 2.2, 4.7, 5.4–5.5, 6.18) and
AdelicImagesAndModularCurves (README lines 98, 203–204, 411, 1779–1815: its §§5.0a–5.0b, 6.0b,
6.0f). `--depcheck` cannot see this overlap, because it checks only the direction of supply.

| This folder (`Suggested.lean`) | EllipticCurveModularityPartII |
| --- | --- |
| `localTerms`, `martinValue`, `newDimension` | same names, same bodies (§§1.1–1.3) |
| `martin_dimension_formula` | `dimension_comparison` (§1.3, README line 211), same statement |
| `martin_sharp_bound` | `martin_bound` (§1.4, line 227), same statement |
| `newform_integral_of_small_primes` | `rationality_of_small_prime_coefficients` (§3.1, line 351) |
| `integral_ideal_sturm` | `integral_sturm_congruence` (§4.2, line 416); there `σ` is a `ℚ`-algebra map, here a ring map: the same data for a number field |
| `kraus_prime_power_congruence` | README §4.3, line 436 (Kraus App. II Prop. 2), same hypotheses, not in its Lean |
| `four_divisible_isogeny_realization` | README §§4.5–4.6 (two-isogeny repair), not in its Lean |
| `GeometricTorsion`, `torsionModule`, `torsionRepresentation` | same names, same bodies (Layer 5) |
| `CyclicIsogenyDegree`, `GeometricallyNonCM` | `HasCyclicIsogeny`, `NonCM` (§5.0a), same bodies |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees` | `prime_isogeny_degrees` (§5.0a), `cyclic_isogeny_degrees` (§5.0b) |
| `rational_two_uniform_irreducibility`, `full_two_uniform_irreducibility` | `rational_two_irreducible` (§5.5), `full_two_irreducible` (§5.4); those also assert absolute irreducibility |
| `SplitNormalizerImage`, `split_normalizer_exclusion` | README §6.0f split-cartan-rational-points with §6.10, not in its Lean |
| `NonsplitNormalizerImage`, `proper_image_nonsplit` | `ImageInNonsplitCartanNormalizer` (§6.1), `nonsplit_of_not_surjective` (§6.10) |
| `cyclic_isogeny_integral_j` | `lemos_integral_j` (§6.11, line 915) |
| `lemos_uniform_surjectivity` | `lemos_surjectivity` (§6.18, line 1031) |

## H02 (CBirkbeck) — answered

Not applied. The repair is conditional on keeping this folder and closing EllipticCurveModularityPartII.
While both are open, the sentence in `README.md` line 1689 ("ErdosProgressionPowers cites
EllipticCurveModularityPartII, which plans the same six results …") is accurate. Deleting it now
would only hide the overlap. If the humans keep this folder, the same edit must also remove
ErdosProgressionPowers from Downstream consumers until it is re-pointed and placed after this
roadmap in the merge order (it is now at line 187, before this folder's line 269).

## H03 (CBirkbeck) — disputed

The sections that the review calls this folder's extra content are proof steps inside targets that
EllipticCurveModularityPartII already owns. They therefore do not set this folder apart, and they
cannot become a Part III either without planning those targets a second time:
- §§4.10–4.16 (cusp-only levels 39, 65, 91, 125, 169 and the 26/35/50 exclusions) are the route of
  its §5.0b, which proves exclusion of "every divisor-minimal forbidden composite degree" (line 557).
- §5.1 (Y₀(r)(ℚ) for r = 19, 43, 67, 163 and the CM corollary) is its §5.0a
  `noncm_prime_isogeny_degrees` ("degrees 19,43,67,163 force geometric CM", line 541).
- §5.4a (generalized Jacobian J₀(p)♯ and Heegner–Gross vectors) is the "Gross-vector nonvanishing
  criterion" of its §6.0f (line 741).
- §5.16a (moving the specialization cusp) is a step of its §§6.8–6.9 (formal immersion at a cusp
  over ℚ(ζ_p)⁺, and integrality of j away from p).
- §5.25a (witness bound) is the argument of its §6.17 exceptional-prime divisibility theorem: the
  same quotient character, unramified outside S, and trace zero off the Cartan.

Where these sections are more detailed, the detail belongs in a revision of
EllipticCurveModularityPartII itself.

## H04 (CBirkbeck) — applied

`README.md` lines 60, 62, 80, 82, 88, 94, 112, 118: "(the … contract)" → "(gap:<slug>)", with
the eight slugs `optimized-elliptic-weight-two`, `weight-two-local-reduction`, `mixed-cusp-charts`,
`chen-winding-comparison`, `positive-characteristic-support`, `all-embedding-frobenius`,
`modular-rank-zero`, `quantitative-abelian-periods`. The surrounding sentences are kept, which is
the form used on main (FlagVarieties). The same repair was made everywhere else the slugs occur:
the 40 in-text references in routes, *Needs:* lines and Dependencies ("the modular rank-zero
contract" → gap:modular-rank-zero, and so on), so that each points at its declaration. Five
further references now carry their slug: line 546 "from the supplier contract" →
gap:optimized-elliptic-weight-two; lines 783 and 787 "the (exact) supplier contract" →
gap:weight-two-local-reduction; lines 1427 and 1429 "the (exact) modular-rank-zero contract" →
gap:modular-rank-zero. The mathematics is unchanged.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`: "Build completed
  successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`" at lines 79,
  84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256, 265.
- Gate (after commit `2a7d4581`): `gate EllipticModularityEffectiveComparisons: set_option=0 blob=0
  latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
  mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `--depcheck --movable`: `depcheck: 240 roadmaps, 2309 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or moved line.

## Lean signatures

`Suggested.lean` is unchanged from `5778fc4` (`git diff 5778fc4 -- …/Suggested.lean` is empty). It
has no `variable` block; every binder is in each declaration's own signature. The 24 elaborated
types in the job's `signatures.md` are those of this file, with 0 binders flagged as dropped, so
the `#check @name` elaboration was not rerun. Those types were compared one by one with
EllipticCurveModularityPartII's `Suggested.lean` for the H01 table.

## Ownership and sources

Ownership against open pull requests was checked by object with `roadmaps grep` over the open
heads and main: Martin's dimension formula, Kraus's thresholds, integral ideal Sturm, Mazur–Kenku
degrees and Lemos's theorem. The only other owner is EllipticCurveModularityPartII.
AdelicImagesAndModularCurves consumes it and states none of them itself. No citation was added
or changed, and `needs-references.toml` was not written.

## Adversarial pass on the changed statements

The repair changes only how supplier gaps are named. The pass checks that each renamed reference
still denotes the same contract with the same hypotheses at its site.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Eight gap headers (lines 60–118) | each header vs `design/plan.json` `gaps[]` | 8 headers parsed; supplier equal 8/8; needs sentence byte-equal 8/8; slug set README = plan set (8 = 8, no extra, none missing) | sound | slugs restored |
| Reference coverage | every `gap:` token in README | 53 tokens (8 headers + 45 references): modular-rank-zero 22, optimized-elliptic-weight-two 9, mixed-cusp-charts 5, weight-two-local-reduction 4, positive-characteristic-support 4, quantitative-abelian-periods 4, chen-winding-comparison 3, all-embedding-frobenius 2; every token has a header | sound | none |
| Line 546 → optimized-elliptic-weight-two | ℓ range, level | gap: ℓ≥5, irreducible, Serre weight 2, level = full residual conductor away from ℓ; Layer 3 sites §§3.5–3.6, 3.18 use ℓ≥5 and the conductor N(E[ℓ]) | sound | reference named |
| Lines 783/787 → weight-two-local-reduction | ℓ = 11, 7, 5 | gap needs ℓ≥11 and excludes 5, 7; §3.18 uses the implication only for ℓ≥11 and keeps the reduction hypothesis at ℓ = 5, 7; at ℓ = 11 both apply | sound | reference named |
| Lines 1427/1429 → modular-rank-zero | J₀(37) = 37a × 37b up to isogeny; coefficient degree d > 1 | 37a has L(1) = 0 and rank 1, 37b has L(1) ≠ 0 and rank 0: the gap covers the winding quotient (the 37b factor) and not J₀(37), which matches the line 1681 example; the gap's needs include factors of any coefficient degree, as "possibly higher-dimensional factors" at 1429 requires | sound | reference named |
| Line 1451 → positive-characteristic-support | p = 11, r ∈ {2,3,5,7,13} | primes q ≡ ±1 mod 11 begin at 23 (10, 12, 21 are not prime), so q ≥ 2p−1 = 21 > 13 and q ∤ 6rp, as the gap requires (q > 3, q ∤ rp); dim S₂(Γ₀(r)) = 0 for r = 2, 3, 5, 7, 13 (genus 0), so the descended form vanishes | sound | wording only |
| Line 455 → all-embedding-frobenius | 11a, q = 2 | a₂ = −2 and \|−2\| ≤ 2√2 ≈ 2.83, which is the bound §1.3 consumes for every embedding | sound | none |
