# FIX-PKG-PELModuliPartII~10: repair report

Review settled: `REV-PKG-PELModuliPartII~9` (three findings, all P3). All three are right and are
applied. Files changed: `packages/PELModuliPartII/README.md` and `packages/PELModuliPartII/sources.toml`.
`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

§3.6 Route: "Compute Hom and adjoints in the rational relative Dieudonné category." → Hom and
adjoints are computed through the relative isocrystals of §0.1. Both are isoclinic of slope 1/2, of
K̆-dimensions 2 and 2n, and full faithfulness identifies V^exo with their O_L-linear maps. These
are maps of L-isocrystals of L̆-ranks 1 and n, and Dieudonné–Manin over L gives L-dimension n. §3.6
*Needs:* and the Layer 3 Suppliers line gain VectorBundlesAndIsocrystals Layer 1, “Finite
isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin
classification of finite isocrystals”.

Why this wording differs from the suggested repair: the suggestion says that "the Dieudonné–Manin
classification of K-isocrystals gives its L-dimension n". Read literally, the K-classification gives
the K-dimension 4n of all Frobenius-equivariant maps (`Hom(N_{1/2}, N_{1/2}^n) = D^n` with
`dim_K D = 4`). It does not by itself isolate the O_L-linear part. The route therefore uses the
equivalent statement over L. L/K is totally ramified, so `L⊗_K K̆ = L̆`, and σ extended L-linearly is
the q-Frobenius fixing L (the residue field is still 𝔽_q). A K-isocrystal with a commuting L-action
is therefore an L-isocrystal in the sense of the supplier heading, which is stated for an arbitrary
nonarchimedean local field E. The relative isocrystal of X₀ (K̆-dimension 2) becomes an L̆-line, and
that of 𝕏 (K̆-dimension 2n) becomes an L̆-space of rank n. Their L-slopes are twice the K-slope 1/2,
so both are of slope 1 and isoclinic. The supplier's classification (simple blocks, End of the
rank-one block of integral slope equal to L) then gives `Hom = L^n`.

Facts checked:
- X₀ is isoclinic. X₀ is formal of dimension 1 and relative height 2. Slopes (0, 1) would split its
  isocrystal into two K̆-lines, each stable under L, and L cannot act on a K̆-line of slope 0 or 1
  (its endomorphism algebra is K). So X₀ has slopes (1/2, 1/2).
- 𝕏 is supersingular by §3.3 ("Fix a supersingular framing 𝕏∈Exo(n−1,1)").
- Both cited headings exist at the supplier's head: VectorBundlesAndIsocrystals Layer 1, lines 214
  and 280 of `roadmaps show VectorBundlesAndIsocrystals`.
- VectorBundlesAndIsocrystals is earlier in the merge order, and the edge is already in the
  dependency check (0 problems below).

Pattern search: the same omission also occurs in §5.2. Its statement uses the rational fixed line
`C_Y=M(Y)[1/u]^{τ=1}` of a relative isocrystal, the same operator τ=i(u)V⁻¹ as §5.4. §5.4 names
VectorBundlesAndIsocrystals Layer 1, but §5.2's *Needs:* did not.
- §5.2 Route gains one clause: "(M(Y)[1/u],τ) is a K-isocrystal of K̆-dimension 2 and slope
  1/2−1/2=0, so its fixed space C_Y has K-dimension 2, an L-line".
- §5.2 *Needs:* gains the same two headings. Layer 5's Suppliers line already lists them.

Places checked and left unchanged:
- §§1.5, 2.3, 5.4, 5.8 and 5.9 already name the owner.
- §3.5 computes End⁰ of a dimension-one strict O-module, which EndoscopicTransferAndUnitaryTraceComparison
  §7.6 supplies (strict O-linear Dieudonné theory of dimension one; inverting ϖ gives the
  quasi-isogeny category). §3.5 already cites that section.
- §§4.4–4.6 work with absolute displays through FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10
  and §0.1. They compute no slopes.
- §6.8 uses the absolute Dieudonné modules of abelian varieties with the PadicHodgeTheory §§3.3–3.5
  supplier, not the relative isocrystals of §0.1.
- §9.1 uses absolute rational Dieudonné modules (RZ96 Lemma 6.28).

## F02 (P3) — applied

References, HLSY23 note. Old: "the cited RSZ21 Theorem 6.7(ii) and RSZ20 Theorem 4.7(ii) need ν
unramified over `F_{v₀}` … and §§7.8–7.10 keep both hypotheses."

New:
- HLSY23 §10.2 cites RSZ20 Theorems 5.2 and 5.4.
- RSZ20 Theorem 5.2(ii) gives semistable reduction at an almost self-dual place only when E_ν/ℚ_p is
  unramified.
- At a ramified place, that theorem admits a self-dual lattice only for n=2, which part (ii)
  excludes.
- Krämer semistability at a ramified place is RSZ21 Theorem 6.7(ii), for n≥3 and ν unramified over
  `F_{v₀}`.
- §7.8 treats n=2 through the charts of §5.6.

Evidence:
- HLSY23 lines 4112–4117 (pp. 78–79) cite RSZ20 Theorems 5.2 and 5.4. RSZ21 enters only through
  Definition 6.10 (line 4109) and §4.1 (line 4099).
- HLSY23 (G3) at line 4064 puts a unimodular (self-dual) lattice at every ramified place.
- RSZ20 lines 1197–1200 list the AT types. The only self-dual lattice at a ramified place is type
  (4), with n=2.
- RSZ20 line 1460 requires every place of `V_AT` to be of one of these types.
- RSZ20 lines 1510–1512: Theorem 5.2(ii) excludes type (4), and type (1) with E_ν ramified over ℚ_p.
- RSZ20 line 1596: Theorem 5.4 is the normalization at deeper split level.
- RSZ21 lines 1722–1724 and 1737–1740: the n≥3 blowup with ν unramified over F. Lines 1741–1744
  (Remark 6.8) cover n=2.

I added "Theorems 5.2 and 5.4" to the reviewer's wording because HLSY23 cites both. No other line of
the README attributes theorems to HLSY23 §10.2: the §§7.8 and 7.10 locators mention only §10.2
itself. The statements of §§7.8–7.10 do not change. §7.9 keeps "regular and semistable when E_ν/ℚ_p
is unramified", and §7.8 keeps `E_ν/F_{v₀}` unramified and its n=2 Checks on the §5.6 charts.

## F03 (P3) — applied

`sources.toml`, entry `Stacks`: `url = "https://stacks.math.columbia.edu/tag/0892"` →
`url = "https://stacks.math.columbia.edu/tag/01QL"`. `fetched_from`, `sha256` and the other fields are
unchanged, because the file read is the same chapter.

Evidence: the cached chapter has its tag 01QL at Stacks line 6. Stacks line 3862 shows that 0892 is
Lemma 38.7 (invertible modules), which the README never cites. The six cited tags are at Stacks lines
4242 (0B3G), 4244 (0C4M), 4268 (0B3H), 4273 (0C4N), 4764 (0BCL) and 4931 (01WN).

Pattern: every other manifest `url` points at the whole work (an arXiv abstract or an author or
institutional PDF), so nothing similar remains.

## Checks

- **Elaboration.** `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content
  checkout: exit 0, no output, 7.4 s. The file is unchanged: one `import Mathlib`, the module
  docstring and an empty namespace. No `TauCeti.*` import needed building.
- **`#check @name` audit.** The file has no declarations (0 of 0), so no elaborated type could be
  compared and none changed. No finding makes any headline statable at the pins.
- **Dependency direction.** Exact output:

  ```text
  depcheck: 244 roadmaps, 2280 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolution.** `roadmaps resolve packages/PELModuliPartII/README.md` reports no
  cross-roadmap citations and no Lean names found nowhere.
- **Style.** No line of the README has an odd number of backticks. The new text has no LaTeX
  delimiters, process words or machine paths.
- **Gate failures listed in the brief:** none.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.6 route: both isocrystals isoclinic of slope 1/2 | X₀ (height 2, dim 1); 𝕏 (height 2n, dim n, supersingular) | X₀: slopes (0,1) would need L ⊂ End(slope-0 line)=K, impossible, so (1/2,1/2). 𝕏: supersingular by §3.3 | pass | new text |
| §3.6 route: L⊗_K K̆ = L̆ | L/K ramified quadratic (e=2, f=1) | residue field 𝔽_q on both sides; `[L̆:K̆]=2=[L:K]`, a field | pass | new text |
| §3.6 route: L-dimension n | n=2; n=4 | K-isocrystal Hom: K-dimension 4n = 8, 16. L-isocrystal ranks 1 and n, L-slope 2·(1/2)=1, Hom = L^n: L-dimension 2, 4 (K-dimension 4, 8, half of 4n) | pass, agrees with the Check "The L-dimension is n, not 2n" | new text |
| §3.6 wrong model: K-dimension read as L-dimension | n=2 | 4n=8 or 2n=4 against n=2 | excluded by the existing Check | none |
| §3.6 slope normalization | K-slope 1/2 under induction L→K | Ind multiplies rank by 2 and divides slopes by 2: rank n, slope 1 ↦ rank 2n, slope 1/2 | pass | none |
| §5.2 route: τ=i(u)V⁻¹ has slope 0 | Y of relative height 2, dim 1 | u²=−N(u) so v_K(i(u))=1/2; FV=π with F of slope 1/2 gives V of slope 1/2 and V⁻¹ of slope −1/2; total 0 | pass, agrees with §5.4 (n=3: K̆-dim 6, L-dim 3) | new clause |
| §5.2 route: C_Y is an L-line | n=1 | slope-0 K-isocrystal of K̆-dim 2 ≅ (K̆², σ): fixed space K², L-dim 1. A basis u·e has norm −u²(e,e), K-valuation 1 | pass, agrees with the §5.2 Check on integrality | new clause |
| HLSY23 note: RSZ20 5.2(ii) at almost self-dual places | E_ν/ℚ_p unramified; ramified | semistable; excluded (RSZ20 line 1512) | pass | note rewritten |
| HLSY23 note: self-dual lattice at a ramified place | n=2; n=3; n=4 | AT type (4) only for n=2, excluded from 5.2(ii); n≥3 not an AT type (RSZ20 lines 1197–1200, 1460) | pass | note rewritten |
| HLSY23 note: RSZ21 6.7(ii) range | n=2; n=3 | n=2: base change ramified (Remark 6.8), no blowup statement; n≥3: blowup semistable, ν unramified over F | pass; §7.8 handles n=2 by yz=u (§5.6) | none to §7.8 |
| §7.8 n=2 chart (recomputed) | yz=u over `O_{Ĕ_ν}`, E_ν/F_{v₀} unramified | maximal ideal (y,z) in dimension 2: regular | pass | none |
| Stacks url | tags 0892, 01QL | 0892 = Lemma 38.7, cited 0 times; 01QL = chapter | pass | url changed |

## Ownership and overlaps

No construction was added. The only new edges point to VectorBundlesAndIsocrystals Layer 1, and the
supplier contract (README, "From TauCetiRoadmap.VectorBundlesAndIsocrystals") already declared those
headings. I checked them at its head with `roadmaps show`. No supplier gap was needed, so
`design/plan.json` is unchanged. No notion moved down. Ownership against the open pull requests rests
on the tool index; no new object needed a search.

## For the maintainer

- No Lean name or README section id changed. No roadmap cites this one (per the review's
  `roadmaps grep PELModuliPartII`), so other roadmaps are unaffected.
- The review's "For the human reviewers" items (the RZ96 licence, and the unread published pagination
  of Zhang21 and LTXZZ22) were not acted on, as instructed.
- No suspicious instructions were found in the review text.
