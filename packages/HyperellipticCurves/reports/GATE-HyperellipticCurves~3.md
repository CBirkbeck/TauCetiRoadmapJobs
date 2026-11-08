# GATE-HyperellipticCurves~3: answers to the incremental review of `eb3039b`

One review (CBirkbeck, 2026-11-06T22:42:51Z) of `eb3039b`. It makes two distinct points:
- F01, which the review's "Previous findings" restates as R01;
- F02.

The "Not verifiable" items are not requests. They are answered inside H01 (Schaefer 1995) and H02 (Freitag–Kiehl).

Both points were first repaired in `001f217`, the head this job started from. This job checked those repairs against the sources and the external files, and corrected two defects in them. Commit `e63cf0a` (not pushed) touches only `TauCetiRoadmap/HyperellipticCurves/README.md`; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

5.2 now states the kernel statement over every field of characteristic ≠ 2:
- README 2050–2053: "over a number field `K`" → "over a field `K` of characteristic different from two … Item (a) holds over every such field …; items (b) and (d) take `K` a number field".
- README 2058–2063: kernel exactly `2J(K)`, by the Kummer map followed by `H¹(K, J[2]) → H¹(K, Res μ₂)`, injective because `J[2] ≅ ker N` is a direct summand when the degree is odd.
- README 2091, item (c): "the local descent map has kernel `2J(K_v)`" → "is item (a) over the field `K_v`".

Those edits are from `001f217`. In this round, the locator "Poonen–Schaefer, Section 9, Theorem 9.3" became Theorems 9.4 (p. 16) and 11.3(a) (p. 23), with their Section 4 hypotheses and how small finite fields are covered (README 2064–2080). The reason: Theorem 9.3 is about the generalized Jacobian `J_m`; the description on `J` is Theorem 9.4, and the trivial kernel is Theorem 11.3(a).

Details:
- **What the sources say.**
  - Section 2 allows any field (PoonenSchaefer1997 line 118).
  - Section 4 assumes characteristic not `p`, `ζ_p ∈ k`, and `∞` not a branch point "for simplicity" (lines 255–259, 270).
  - Theorem 9.3 is on `Pic_m` and `H¹(J_m[φ])` (line 753). Theorem 9.4 is on `Pic` and `H¹(J[φ])` (line 775).
  - Theorem 11.3 says the kernel on `J(k)/φJ(k)` has order 1 when there is a rational divisor class of degree 1 and the polynomial has a factor of degree prime to `p` (lines 1089–1094).
- **Reaching the odd-degree case.** Sending a non-root `c ∈ K` to `∞` gives a sextic-type model `f̃` with a linear factor, and the old point at `∞` is rational. That needs `#K > 2g + 1`. Smaller finite fields go through an odd-degree extension, since restriction followed by corestriction is multiplication by an odd number.
- **Schaefer 1995** resolves only to a paywalled page, which the sources service classes as `uncertified`; it stays cited by its locator.
- **The ℝ Check** (README 2121–2127) now says its sign vectors are evaluations at `T = 1, 0, −1`. The vector `(−, −, +)` was correct only in that order.

## H02 (CBirkbeck) — applied differently

The review is right that `Weil/Definitions.lean` at `27cdb20` does not carry the locator "IV.1.2, Remark b". But the replacement in `001f217`, "the file … cites no text", was false:
- line 135 of that file cites Stacks Tag 03V2;
- the attribute `@[weil "def_fk401_good_reduction"]` at line 297 is, by the repository's own convention (`Weil/Attr.lean` lines 8–10; its README line 114: `fk404` = FK IV.4), a link to a Freitag–Kiehl IV.1 item.

README 2545–2549 now says this. It also attributes the locator "Freitag–Kiehl IV.1.2, Remark b), p. 257" to the sibling file `Weil/AlgebraicGeometry/Morphisms/GoodReductionInvertPrime.lean` (lines 30–31, linked at the same commit). That file proves `ArisesByGoodReduction.intro_away` and `exists_isUnit` about the same notion.

## Adversarial pass (statements added or changed at `001f217..e63cf0a`)

| statement | instances | values computed | result | change |
| --- | --- | --- | --- | --- |
| 5.2(a): kernel exactly `2J(K)`, any field of char ≠ 2 | `y² = x³ − x` over `𝔽₃` (`#K = 3 = 2g + 1`, below the bound needed to apply Poonen–Schaefer directly) | `E(𝔽₃) = {O, (0,0), (1,0), (−1,0)} ≅ (ℤ/2)²`; at `T = 1, 0, −1`, using `f'(e)` at the point's own root: `(0,0) ↦ (−1, −1, 1)`, signs `(n, n, s)`; `(1,0) ↦ (2, 1, 2)`, `(n, s, n)`; `(−1,0) ↦ (1, −1, 2)`, `(s, n, n)`; the three images are distinct and nontrivial, and their product is `(s, s, s)` | image order 4 = `#J/2J`, kernel `0 = 2J(𝔽₃)`; holds where the cited theorem needs the odd-extension step | odd-extension clause added |
| same, over `ℝ` | `y² = x³ − x` | `(2, √6)`: `x − T = (1, 2, 3)`, signs `(+,+,+)`; `(−1/2, √(3/8))`: `(−3/2, −1/2, 1/2)`, signs `(−,−,+)`; `J(ℝ) ≅ ℝ/ℤ × ℤ/2`, `#J(ℝ)[2]/2^g = 4/2 = 2` | image order 2 = `#J(ℝ)/2J(ℝ)` | coordinate order stated in the Check |
| `J[2] ≅ ker N` is a direct summand of `Res μ₂` (odd degree) | `g = 1`, `F₂³` | `ker N = {000, 110, 101, 011}`, dimension 2 = `dim J[2]`; diagonal `111` has `N = 1`, so it is not in `ker N`; even-degree contrast `F₂⁴`: `N(1111) = 0`, no splitting | holds exactly for odd degree, consistent with the nontrivial index `[ker(x − T) : 2J(K)]` that EffectiveDiophantineMethods §3.23 allows for sextics | none |
| coordinate change to Poonen–Schaefer's setting | `f = x³ − x`, `c = 2` over `ℚ`, `x' = 1/(x − c)`, `y' = y/(x − c)^{g+1}` | `f̃ = x'^4 f(2 + 1/x') = 6x'^4 + 11x'^3 + 6x'^2 + x' = x'(x'+1)(2x'+1)(3x'+1)`; leading coefficient `6 = f(2)`; roots `0, −1, −1/2, −1/3 = 1/(θ − 2)` | degree `2g + 2`, linear factor `x'`, `∞` not a branch point; Theorem 11.3(a) applies | text written |
| target identification `(K × L)^×/(□·K^×) ≅ L^×/L^{×2}` | `(a, b) ↦ b/a` | kernel `{(a, a t²)} = (a, a)(1, t²)`, i.e. diagonal times square; even-model value `(1/(x − c), −(x − T)/((x − c)(T − c)))` ↦ `−(x − T)/(T − c)`; on `Σ n_P P` with `Σ n_P = 0` the factor `(−1/(T − c))^{Σ n_P} = 1` | maps agree on `J(K)` | "constant factors cancel" |
| odd-degree extension descent | `K = 𝔽₃`, `K' = 𝔽₂₇` | `[K' : K] = 3` odd, `#K' = 27 > 3`; `cor∘res = 3` kills nothing in 2-torsion `H¹`; `P ∈ J(K) ∩ 2J(K')` ⇒ `res κ_K(P) = 0` ⇒ `κ_K(P) = 0` ⇒ `P ∈ 2J(K)` | kernel and identification descend | clause added |
| 5.2(c) as item (a) over `K_v` | `ℚ₂` (g = 2), `ℚ_p` odd, `ℝ`, `ℂ` | `2^{g[K_v:ℚ₂]} = 4`; `|2|^{−g} = 1`; `#J(ℝ)[2]/4`; `16·2^{−4} = 1` | agrees with the heights roadmap's §1.17 index | none |
| Provenance: `ArisesByGoodReduction` attribution | `Weil/Definitions.lean` lines 293–305, 135; `Weil/Attr.lean` 8–10; repository README 114; `GoodReductionInvertPrime.lean` 30–31, 70, 111 | "Stacks, Tag 03V2" present at line 135; the label is a Freitag–Kiehl link by convention; "Chapter IV, 1.2, Remark b), p. 257" present in the sibling file | "cites no text" refuted | wording replaced |
| Provenance: the other "the file(s) cite" claims | `FiniteFlatDiscriminantBranchSupport.lean` 19, 31; `FiniteFlatTraceDiscriminantGluing.lean` 21, 51; `ProjHyperellipticDoubleCover.lean` 119; `CharpolyIntegrality.lean` 15 | Tag 0BVH, Tag 0BVH, Tag 01VP, "FK IV.1, Theorem 1.2" found as stated | correct | none |

Context and generality: no Lean statement changed. The README's generality for item (a) is "every field of characteristic ≠ 2". The sources cover it as follows:
- Poonen–Schaefer directly when `#K > 2g + 1`;
- the odd-degree extension step when `K` is finite and smaller;
- characteristic 2 is excluded.

## Signatures

`Suggested.lean` is unchanged. The mechanical check was still run:
- `#check @name` for all 35 declarations was appended temporarily and elaborated with the targeted build;
- the file was then restored byte for byte (sha256 compared) before committing.

All 35 types printed, with the binders the README states, for example:
- `2 ≠ 0` on `Model.isSmooth_iff_separable`;
- `[IsDomain R] [IsDiscreteValuationRing R] [IsFractionRing R K]` on `Model.exists_isMinimal`;
- `[IsPrincipalIdealRing O]` on `Model.exists_isGlobalMinimal`;
- the exponent `(2g+1)(2g+2)` in `CoordChange.Δ_smul`.

Nothing changed.

## Ownership, citations, sources

- No construction, target, supplier or cross-roadmap citation was added. `scratch/overlaps.md` lists nothing that changes or drops ids of this roadmap.
- Citation leads: the 18 listed are the 12 external declaration names of the Provenance section (checked at their commits in GATE~2 and the review), `Model.weierstrassForm` (declared at `Suggested.lean` line 135), and five LMFDB knowl identifiers. None is a defect.
- Sources:
  - Poonen–Schaefer was read from the author's page (`PoonenSchaefer1997`, author version; its numbering is the one the README cites as "author version").
  - Schaefer 1995 resolved to a paywalled page and is `uncertified`.
  - This roadmap has no `sources.toml`, and this job may edit only `README.md` and `Suggested.lean`, so no manifest was written.
  - No `needs-references.toml` was produced.
- Nothing in the review or the fetched files was treated as an instruction; nothing suspicious was found.

## Build and gate

- `lake build TauCetiRoadmap.HyperellipticCurves.Suggested`: `Build completed successfully (9102 jobs).` The only warnings are the 16 `declaration uses 'sorry'`.
- Depcheck output: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Gate (`--base origin/main`, on `e63cf0a`): `gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
