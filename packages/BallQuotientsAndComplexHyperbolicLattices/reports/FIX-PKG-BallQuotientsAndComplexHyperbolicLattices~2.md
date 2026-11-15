# FIX-PKG-BallQuotientsAndComplexHyperbolicLattices~2

Repair of the three findings of `REV-PKG-BallQuotientsAndComplexHyperbolicLattices` (all P3). Files changed: `packages/BallQuotientsAndComplexHyperbolicLattices/README.md` and `packages/BallQuotientsAndComplexHyperbolicLattices/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## REV-PKG-BallQuotientsAndComplexHyperbolicLattices/F01 (P3) — applied

Verified: MilneSVI line 1686 to line 1689 is Theorem 3.12 (Baily–Borel), with no Shimura datum and no decomposition. The datum is Definition 5.5 (line 2381 to line 2392, conditions SV1–SV3). The decomposition over representatives of `G(ℚ)₊\G(𝔸_f)/K` with `Γ_g = gKg⁻¹ ∩ G(ℚ)₊` is Lemma 5.13 (line 2486 to line 2495). It matches the README's `Γ_a = 𝐆^ad(ℚ)₊ ∩ aK_f a⁻¹`.

The README also says "finite disjoint union". That finiteness is Lemma 5.12 (line 2475), which the suggested repair left out, so I added it.

Changes:
- §11.3: "MilneSVI line 1686 to line 1689" → "MilneSVI Definition 5.5, line 2381 to line 2392, for the Shimura datum, Lemma 5.12, line 2475, for the finiteness of the double cosets, and Lemma 5.13, line 2486 to line 2495, for the decomposition".
- References MilneSVI bullet: added "Definition 5.5, Lemmas 5.12 and 5.13".
- `sources.toml` MilneSVI `locator`: added "; Definition 5.5, Lemmas 5.12 and 5.13 (pp. 54-57)". The page markers are at line 2350 (p. 54) and line 2473 (p. 57).

Pattern search: I checked every other MilneSVI locator in the README against the text, and all are correct:
- line 1682 to line 1684: projective varieties and nonsingular varieties
- line 1686 and line 1722 to line 1727 (§11.4): Theorem 3.12 and Remark 3.13
- line 1690 to line 1694
- line 1722 to line 1724: Remark 3.13(a)
- line 1734: the second "(c)" of Remark 3.13
- line 1742 to line 1744: Theorem 3.14
- line 1746 to line 1748: Lemma 3.15
- line 1764 to line 1769
- line 1770 to line 1774: Corollary 3.16
- line 1775 to line 1780

The only line-1686 citation left is §11.4's Theorem 3.12, which is correct there.

## REV-PKG-BallQuotientsAndComplexHyperbolicLattices/F02 (P3) — applied

Verified: "waived" is the manifest `status` of `GarlandRaghunathan1970` (`sources.toml`), a process decision.

Changes:
- §6.1 (2): "… that every lattice is admissible, waived; Raghunathan1972 …" → "… that every lattice is admissible; Raghunathan1972 …".
- References: "Theorems 0.7 and 4.10 (waived)." → "Theorems 0.7 and 4.10."

The citation keeps its locator, and the status stays in `sources.toml`.

Pattern search: `grep -i waive` over README, `Suggested.lean`, `metadata.toml` and `design/plan.json` now finds nothing. The word "uncertified" (25 occurrences) is kept. The review explicitly does not raise it, roadmaps on main use it, and it tells the reader something about the citation (it is cited by its locator without the text) rather than about how the citation was settled. I did not write "uncertified" in place of "waived" for GarlandRaghunathan1970, because that would misstate the manifest status.

## REV-PKG-BallQuotientsAndComplexHyperbolicLattices/F03 (P3) — applied

Verified: in §10.5's Checks, the bullet just before is the cocompact Γ (X_Γ compact), and the one before that is Γ(2) (X_Γ = ℙ¹ ∖ {0, 1, ∞}). Only the first Check, the image of Γ₀(2), has X_Γ ≅ ℂ*.

Change: "For the same Γ, the nodal cubic …" → "For the image of Γ₀(2) of the first Check, the nodal cubic …"; the rest of the bullet is unchanged.

Pattern search: I searched every Check bullet for anaphoric references ("same Γ", "this Γ", "previous", "above"). The only other hit is §5.1's horoball bullet, line 476, "modulo the same lattice", and its antecedent is in the same bullet. No other edit was needed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §11.3 citation: (𝐆^ad, X) satisfies MilneSVI Definition 5.5 | n = 1, 𝐆^ad = PGL₂, h₀(z) = [diag(1, z/z̄)] = [diag(z̄, z)] | Ad h₀(z) on the off-diagonal entries: z/z̄ and z̄/z, so types (−1,1), (1,−1); on the diagonal, (0,0): SV1 holds. h₀(i) = [diag(1, −1)] = [J], and conjugation by J is g ↦ (gᴴ)⁻¹ on U(1,1), the Cartan involution: SV2 holds. 𝐆^ad is ℚ-simple and h₀ is nontrivial: SV3 holds. | the citation supports the claim | locator replaced |
| §11.3 citation: Lemmas 5.12–5.13 give the finite decomposition | 𝐆^ad = PGL₂, K_f = PGL₂(Ẑ) | GL₂(𝔸_f) = GL₂(ℚ)₊·GL₂(Ẑ), since det gives 𝔸_f^× = ℚ_{>0}·Ẑ^×. GL₂ → PGL₂ is onto on ℚ_p- and ℤ_p-points (Hilbert 90, Pic ℤ_p = 0), so \|C\| = 1. Γ_1 = PGL₂(ℚ)₊ ∩ PGL₂(Ẑ) = PSL₂(ℤ), and Sh = PSL₂(ℤ)\ℍ is one component, while X = ℍ^± has two (n = 1 count of §11.3). | agrees with Lemma 5.13 and with §11.3's n = 1 component count | none further |
| §11.4 citation of Theorem 3.12 (line 1686) | the arithmetic quotient's Zariski-open embedding | line 1686 to line 1689 is exactly that statement | correct where it stands | none |
| §6.1 (2) and References, GarlandRaghunathan1970 | text after the deletion | locator "Theorems 0.7 and 4.10" kept in both places, and the status is kept in `sources.toml` | no mathematical change | process word deleted |
| §10.5 fourth Check, Γ = image of Γ₀(2) | genus, elliptic and cusp data | index p + 1 = 3; ν₂ = 1 + (−4/2) = 1; ν₃ = 1 + (−3/2) = 1 − 1 = 0; cusps Σ_(d\|2) φ(gcd(d, 2/d)) = 2 with widths 1 + 2 = 3; g = 1 + 3/12 − 1/4 − 0 − 2/2 = 0, so X_Γ = ℙ¹ minus 2 points = ℂ*. [[1, −1],[2, −1]] ∈ Γ₀(2) has trace 0 and fixes (1 + i)/2: ((−1 + i)/2)/i = (1 + i)/2. | the instance has X_Γ ≅ ℂ* | Check re-anchored |
| §10.5 fourth Check, nodal cubic y²z = x²(x + z) | normalization t ↦ (t² − 1, t(t² − 1), 1) | node = images of t = ±1; C ∖ node ≅ ℙ¹ ∖ {±1} ≅ ℂ*, adding one point. The punctured neighbourhood of the node is two punctured discs (about t = 1 and t = −1), one in each end of ℂ*. y/x satisfies (y/x)² = x + 1 and is not in the local ring, so C is not normal. (S*_Γ)^an = ℙ¹ adds 2 points ≠ 1. C is projective, hence compact Hausdorff. | the Check holds; only normality fails among §10.5's hypotheses | none further |
| §10.5 theorem against the re-anchored Check | Y = nodal cubic | the theorem assumes Y normal, and Y is not, so it does not apply: no conflict | consistent | none |

## Checks run

- **Elaboration**: `lake env lean packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean`, run from the content checkout, exit 0. The output is seven warnings, all "declaration uses `sorry`" (lines 101, 131, 160, 169, 175, 184, 208), and nothing else. No `TauCeti.*` import is used, so nothing needed building.
- **`#check @name` comparison**: one scratch file (the file's body plus `#check @name` for all 16 declarations), elaborated once with exit 0. The 16 elaborated types are:
  - definitions: `indefiniteUnitaryGroup`, `projectiveUnitaryGroup`, `ballMap`, `ballDist`, `IsParabolic`, `IsLattice`, `IsCuspPoint`, `conjugationMap`, `IsNeat`
  - theorems: `biholomorphic_ball_iff`, `margulis_lemma`, `IsLattice.exists_finset_cuspPoint_orbits`, `IsLattice.compactSpace_quotient_iff`, `IsLattice.isFinitelyPresented`, `selberg_lemma`, `IsLattice.exists_neat`

  They agree with `scratch/signatures.md` and with the README statements. No binder was lost, since the file has no section `variable`s. No change, because `Suggested.lean` was not edited.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2245 edges, 0 problem(s)`, so there is no UPWARD and no CYCLE line.
- **Citation resolver** (`roadmaps resolve` on the README): "Lean names found nowhere: None." The repair added no cross-roadmap citation.

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name, section number or target id changed. Other roadmaps' citations of this one are unaffected.
- Ownership: the repair adds no construction, so there was no new ownership question. The ownership checks of the package stage stand, against the open heads indexed by the roadmaps tools.
- No new source was fetched, and `needs-references.toml` was not written. MilneSVI was already certified in the manifest; only its `locator` field grew.
- No suspicious instruction was found in the review text.
