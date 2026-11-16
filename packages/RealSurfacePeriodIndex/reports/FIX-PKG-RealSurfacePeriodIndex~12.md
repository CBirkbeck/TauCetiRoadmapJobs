# FIX-PKG-RealSurfacePeriodIndex~12

Review settled: `REV-PKG-RealSurfacePeriodIndex~11` (three findings). Its "For the human reviewers" section lists no finding and changed nothing.

## F01 (P2) — applied differently

Verified: README §2.8 steps 1–2 ran through the three clauses of B19 lines 244–247 (p. 69) in the same order. Old: "Apply §2.7 with two consecutive large integers … Their function fields are splitting fields of degrees dn and (d+1)n …". New: an argument of my own, through the generic fibre of p_b. It is a reduced finite ℂ(S)-scheme of length dn, so a product of fields L_i whose degrees add up to dn. Each L_i splits α, so ind(α) divides dn. Then gcd(dn, (d + 1)n) = n. Two new Checks were added, and §2.1 was added to *Needs:*.

Why this differs from the suggested repair: that repair needs T_b to be connected (ampleness, a Lefschetz-type connectedness theorem the roadmap does not have). The decomposition of the generic fibre does not need connectedness: a smooth T_b gives a reduced fibre, and §2.1 supplies the length dn. The longest runs shared with B19 are the unchanged statement of the theorem and formulas such as `ind(α) | (d + 1)n` (a 6-token sweep of the section against the whole of B19).

## F02 (P3) — applied

Verified: EKM line 4161 (Lemma 19.4, p. 80) assumes a complete DVR and proves that an isotropic residue form makes the form isotropic. EKM lines 4168–4174 (Lemma 19.5, p. 80) hold over any DVR and give the converse, which §§0.7, 1.5, 7.9 use. Lemma 19.10 is on p. 81 and Exercise 19.15 on p. 82 (line 4311). Old locator: "EKM, Lemma 19.4, Lemma 19.10 and Exercise 19.15, pp. 80–82". New locator: Lemma 19.4 and Lemma 19.5 (p. 80), each with the direction it proves, plus Lemma 19.10 and Exercise 19.15 (pp. 81–82) for the Witt-ring form. Steps 1 and 2 now cite 19.4 and 19.5. In `sources.toml` the EKM locator now reads "Lemmas 19.4, 19.5, 19.10; Exercise 19.15".

## F03 (P3) — applied

Verified: B19 Theorem 0.12 (lines 138–139, p. 66) covers every field of transcendence degree 2 over ℝ. README §7.8 states it in that generality, and B19 lines 1305–1307 (p. 95) derive 0.10 and 0.13 from it. Changes:
- §7.11 and §7.13 now read "not necessarily finitely generated". Their standing lines are restated. The steps were reordered so that §7.11 runs §7.8 → isotropy, with Artin–Lang only for K = ℝ(S). Step 2 of §7.13 now says "K(t) has transcendence degree 2 and is nonreal".
- The del Pezzo consequence now holds over K.
- §7.11 and §7.13 gained three Checks each.
- A sentence was added to the Conventions.
- In Lean, `[Algebra.EssFiniteType ℝ K]` was removed from `not_anisotropic_of_not_isSemireal` and `exists_common_zero_of_not_isSemireal`. Their docstrings and the module docstring's Conventions paragraph were updated to match.

Pattern search: `Algebra.EssFiniteType` is kept on the other five declarations that carry it.
- de Jong, the norm bound, Theorem 0.3 and Theorem 0.4 keep it. Their routes go through projective models (§§2.8–2.10, 7.4, 7.6), and B19 states them for surfaces.
- `exists_anisotropic_hasZeroTotalSignature` needs it. Over an algebraic closure of ℝ(x, y) every form of dimension ≥ 2 is isotropic, so no anisotropic four-dimensional form exists there, and the statement would be false without finite generation.

## Checks run

- `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean` (from the content checkout): exit 0, only eight `declaration uses sorry` warnings (lines 82, 91, 103, 114, 125, 135, 145, 158).
- `#check @name` for all nine declarations, run in one scratch copy: every elaborated type matches its README statement.
  - `not_anisotropic_of_not_isSemireal` and `exists_common_zero_of_not_isSemireal` now have exactly `[Field K] [Algebra ℝ K]`, `trdeg = 2` (resp. `= 1`), `¬IsSemireal K`, `[FiniteDimensional K V]` and `5 ≤ finrank`.
  - The other seven are unchanged, keeping `[Invertible 2]`, `[FiniteDimensional K V]` and `[Algebra.EssFiniteType …]` where the README has them. No binder was lost.
- Dependency check, whole output:

      depcheck: 257 roadmaps, 2442 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- Wording: a sweep for runs of 6 or more tokens shared between the edited sections and B19 (resp. EKM for §0.10). The only shared runs are the unchanged theorem statement of §2.8, formulas, and stock phrases ("when C is the anisotropic conic", "⟨1⟩ is anisotropic over").

No new definition, construction or supplier was introduced, so no new ownership question arises. Ownership against open pull requests was not re-searched for these edits, since they add no object. No cross-roadmap citation changed.

## Gate failures

- tex=3: README §2.8 proof step 1 had three TeX-style subscripts with braces outside code spans: `B_{d+1}(ℂ)` (twice) and `p_{b′}*α`. All three are now inside backticks, which is the house form the rest of the README uses for braced subscripts. Nothing else in the line changed. A sweep of the whole README, with code spans removed, now finds no `_{`, `^{`, backslash command or `$`. The dependency check was rerun after this edit: `depcheck: 257 roadmaps, 2442 edges, 0 problem(s)`. `Suggested.lean` was not touched, so its elaboration result above still holds.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.8 new step 2 (generic fibre) | α = 0, n = 1, d = 1 | binary form of degree 1, length 1, one field L₁ = ℂ(S) of degree 1; gcd(1, 2) = 1 = ind(0) | holds | — |
| §2.8 | Enriques, n = 2 | degrees 2d, 2d + 2; gcd = 2; per = 2 divides ind, so ind = 2 | holds | Check updated |
| §2.8 | one degree only, Enriques, d = 2 | ind divides 4, which allows 4 | the pair d, d + 1 is needed | new Check |
| §2.8 | nonreduced member 2T₀, T₀ ∈ \|H\|, α = 0 | generic fibre length 2, one field of degree 1, sum 1 ≠ 2 | smoothness is needed for the sum formula | new Check |
| §2.8 | could r = 0? | nonzero binary form of degree dn ≥ 1 has length dn ≥ 1, so r ≥ 1 | holds | — |
| §0.10 directions | ⟨1, y₁, −y₂, −y₁y₂⟩ over ℂ((y₁))((y₂)) | residue forms ⟨1, y₁⟩, ⟨−1, −y₁⟩, then ⟨±1⟩ over ℂ; Lemma 19.5 twice gives anisotropy | holds | locator |
| §0.10 directions | ⟨1, −1⟩ ⊥ t⟨1⟩ over ℝ((t)) | residue ⟨1, −1⟩ isotropic; Lemma 19.4 gives zero (1, 1, 0) | holds | — |
| §0.10, Lemma 19.4 hypothesis | ⟨u_i⟩ with units, char k ≠ 2 | polar form diag(2u_i), invertible over R | the nondegeneracy hypothesis is met | — |
| §7.11 / `not_anisotropic_of_not_isSemireal` | algebraic closure of ℝ(x, y) | trdeg 2, −1 = i², not finitely generated; ⟨a, b⟩ has zero (√(−b/a), 1) | holds without finite generation | new Check |
| same | ℝ(x, y, z \| x² + y² + z² = −1) | (1, x, y, z, 0) is a zero of ⟨1, 1, 1, 1, a⟩ | holds | — |
| same, nonreality dropped | ℝ(x, y), ⟨1, 1, 1, 1, 1⟩ | signature 5 at every ordering, anisotropic | hypothesis needed | new Check |
| same, trdeg 3 | ℂ(x, y, z), ⟨1, x⟩⊗⟨1, y⟩⊗⟨1, z⟩ | dimension 8; Springer three times in ℂ((x))((y))((z)) gives anisotropic | trdeg 2 needed | new Check |
| same, degenerate q | ⟨1, 0, 0, 0, 0⟩ | e₂ is a radical vector, q(e₂) = 0 | isotropic, holds | — |
| §7.13 / `exists_common_zero_of_not_isSemireal` | algebraic closure of ℝ(x), N = 5 | two quadrics in ℙ⁴ meet (dimension ≥ 2) | holds without finite generation | new Check |
| same | K nonreal, trdeg 1, not finitely generated | trdeg K(t) = 1 + 1 = 2; −1 = Σ squares in K ⊂ K(t) | step 2 holds | step 2 restated |
| same, nonreality dropped | ℝ(x), q₁ = ⟨1, 1, 1, 1, 1⟩ | q₁ has no nonzero zero | hypothesis needed | new Check |
| same, trdeg 2 | ℂ(x, y), q₁ = ⟨1, x, y, xy, 0⟩, q₂ = ⟨0, 0, 0, 0, 1⟩ | q₂ = 0 forces x₅ = 0; ⟨1, x, y, xy⟩ anisotropic | no common zero, trdeg 1 needed | new Check |
| `exists_anisotropic_hasZeroTotalSignature` (kept binder) | algebraic closure of ℝ(x, y) | every form of dimension ≥ 2 isotropic, so no anisotropic form on K⁴ | finite generation needed | kept |

## For the maintainer

- No Lean name changed. The two edited theorems are now strictly more general, so every consumer that cites them by name still applies.
- `sources.toml` gained no entry. The EKM locator changed (Lemma 19.5 and Exercise 19.15 added).
- `design/plan.json` is unchanged. No new supplier gap was needed.
