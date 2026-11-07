# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at b494946)

**Verdict:** needs changes

## R01 (P1) — The targeted build fails: Lake asks for the module form

Location: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean` line 1, `import Mathlib`.

Claim: the targeted build `lake build TauCetiRoadmap.ArakelovGeometryAndAbelianHeights.Suggested` passes with `sorry` as the only warning.

Witness: `gate … --build` at b494946 gives `build=2`. Both warnings say "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".

The warning is new because the merge of main moved the toolchain from v4.35.0-rc3 to v4.36.0-rc2.

Repair: put `module` on line 1, then a blank line, then `import Mathlib`. This is the header of `TauCetiRoadmap/CFSGBasicProperties/Suggested.lean` (lines 1–2), a module-form file on main. The file declares nothing, so it needs no `public section`. Tested: a scratch copy with this header elaborates under `lake env lean` with exit 0 and no output. The warning comes only from `lake build`: the unmodified file is also silent under `lake env lean`. Confirm the repair with the targeted build.

## R02 (P2) — Scope line 11 makes ShimuraCompactifications an upward supplier, and its section number is spliced

Location: `README.md` line 11: "general PEL toroidal and minimal compactifications belong to **ShimuraCompactifications**, which consumes the level-one principal Siegel case stated in §5; nothing here depends on it.0. The metric and exact height identity …"

Claim: ShimuraCompactifications only consumes this roadmap.

Witness: the gate's dependency check: `UPWARD: ArakelovGeometryAndAbelianHeights (#133) -> ShimuraCompactifications (#154) at README lines [11]`. Under `--movable` this roadmap moves to #154. There it follows its consumers FaltingsFinitenessAndIsogenyTheorems and ShimuraCompactifications, whose `*Needs:*` lines become UPWARD (outputs under Verified sound).

The dependency check reads "belong to **X**" as a supplier citation, the same form line 9 uses for the real supplier AlgebraicVectorBundles. That wording is the one the previous review's R04 proposed. Two things show the edge is real for the merge machinery:
- the pull request's depends-on block now lists #1053 (ShimuraCompactifications) among the suppliers that merge first;
- ShimuraCompactifications (#1053, head f51ec79) imports §2.0, §5.0a and §5.0b in its README at lines 337–345, 1488, 1917, 2314 and 2512.

The two roadmaps therefore cite each other. Separately, "§5; nothing here depends on it.0." splits the original "§5.0" in two around the inserted clause. The intended sections are §5.0a (line 1342) and §5.0b (line 1359).

Repair: replace the passage from "are targets of §5.0; general PEL" through "depends on it.0." with: "are targets of §5.0a and §5.0b. General PEL toroidal and minimal compactifications are outside this roadmap: ShimuraCompactifications, a consumer, owns them and imports the principal Siegel case of §5.0a and §5.0b." Keep the roadmap name unbolded and avoid "belong to".

Tested on a scratch copy of the README, against the board's merge order: `depcheck: 240 roadmaps, 2378 edges, 0 problem(s)`, with and without `--movable`, and no `moved:` line. This roadmap then stays at #133, before both consumers. Moving the sentence unbolded to `## Downstream consumers`, next to the FaltingsFinitenessAndIsogenyTheorems paragraph, also gives 0 problems.

## R03 (P3) — The new Pazuki locator in §2.2 does not contain the covolume identity

Location: `README.md` line 732: "[Pazuki](https://arxiv.org/abs/0907.1458v2), proof of Lemma 5.4, p. 18 (arXiv v2)".

Claim: in the proof of Lemma 5.4, Pazuki proves `‖dz₁ ∧ ⋯ ∧ dz_g‖² = det(Im τ)` for `ℂ^g/(ℤ^g + τℤ^g)`.

Witness: pazuki12 (arXiv v2) lines 814–837: Lemma 5.4 (p. 18) writes `β_σ` through theta norms and has no proof; Proposition 5.5 follows. Pazuki's metric (lines 282–289) carries `(2π)^{−g}`, giving `‖dz‖² = 1/π` on `ℂ/(ℤ+iℤ)`, not `1`.

This locator came from the previous review's R03 repair; its witness (pazuki12 line 817) is the statement of Lemma 5.4, not a proof. Pazuki's Definition 2.2 (p. 7, lines 313–316) adds `½ log det(Im τ_σ)` to the Faltings height but does not state the identity either.

Repair: delete the Pazuki item from line 732. Faltings–Chai Ch. V (proof of Proposition 4.5, p. 168) and Deligne §1.10 (p. 31) remain. Deligne's text there is the Sp(V)-invariant metric on the basis `e` of `ω` (deligne85 lines 244–249). Also add Bombieri–Gubler, which line 76 now cites, to `## References` beside the other printed sources.

## R04 (P3) — Checks and API bullets still name Lean declarations that `Suggested.lean` does not declare

Location: `README.md` line 149: "Lean names in the numbered sections specify the intended library interface, and Checks specify mathematical tests." Line 184: "- `HermitianBundle.trivial_rank`: `rank Ō_K = 1` …". Line 980: "- `AbelianVariety.faltingsHeight_11a2`: …".

Claim: Lean names in the README specify the intended interface, and Checks may carry Lean labels.

Witness: `Suggested.lean` declares nothing. 98 Check bullets open with a "`Name`:" label, and 155 API bullets name undeclared declarations. The house rules: a Check never names a Lean counterpart, and an API bullet backticks only declared names.

The worker's citation scan lists 247 such names found nowhere at the pins. This is the previous report's R01. The repair round did not take it up, and no repair report marks it as not actionable. The gate's `readme-ids-missing` counter is 0, so the gate does not catch it.

Repair:
- Delete the line-149 sentence.
- Drop the label from every Check bullet, for example "`rank Ō_K = 1`, and the zero module with the empty family of forms has rank 0".
- Write the API bullets in words, for example "the underlying projective `O_K`-module" or "the Faltings height `h(A/K)`".

The consumers cite §2.0, §5.0a and §5.0b by section number (ShimuraCompactifications line 337, FaltingsFinitenessAndIsogenyTheorems line 529). These edits leave those numbers unchanged.

## Previous findings

- R01 — not repaired: line 149 still reads "Lean names in the numbered sections specify the intended library interface, and Checks specify mathematical tests"; line 184 still opens a Check with `HermitianBundle.trivial_rank`. Raised again as R04.
- R02 — repaired: line 73 reads "`mulHeight_pow_finrank`: for a finite extension `L/K` of number fields and any finite tuple `x` over `K`, `H_rel,L(x) = H_rel,K(x)^[L:K]`". This is the name and statement in DiophantineApproximationAndTranscendence §0.2, README line 269 on main.
- R03 — partly repaired: line 76 now cites "Bombieri–Gubler, *Heights in Diophantine Geometry*, §1.5" instead of the Wu handout. Line 732 now cites Pazuki's "proof of Lemma 5.4, p. 18", a lemma with no proof that does not contain the identity. Raised again as R03.
- R04 — partly repaired: line 11 now names the owner, "belong to **ShimuraCompactifications** … stated in §5; nothing here depends on it.0.". The wording creates an upward supplier edge and splits the section number. New finding R02.

## Verified sound

**Gate.**
- The worker's `gate.md` at b494946 has every counter at 0 except `build=2`.
- My run of the gate command (configured merge order, no build) gives `depcheck=1`, with the UPWARD line quoted in R02.
- With `--build` it gives `depcheck=1 build=2`, the two module warnings of R01. Every other counter is 0: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder and source-material.
- The worker's `depcheck=0` matches the brief's check against `merge-order-moved.txt`. That order already places this roadmap after ShimuraCompactifications, which resolves this roadmap's own edge but breaks its consumers' edges.

**Dependency check output.** Consumer line numbers below are as the tool printed them on copies fetched with `roadmaps show`. Those copies carry a one-line header, so README line = printed − 1: ShimuraCompactifications 337, 1488, 1809, 1917, 1978, 2314; FaltingsFinitenessAndIsogenyTheorems 351, 437, 529, 576, 653, 784.

```text
# brief's command (merge-order-moved.txt, --movable)
depcheck: 240 roadmaps, 2379 edges, 0 problem(s)
# board merge order, --movable
moved: ArakelovGeometryAndAbelianHeights moved in the merge order from #133 to #154, right after its last supplier ShimuraCompactifications; checked as moved (the worker moves it there when it submits)
depcheck: 240 roadmaps, 2379 edges, 0 problem(s)
# board merge order, without --movable (what the gate runs)
UPWARD: ArakelovGeometryAndAbelianHeights (#133) -> ShimuraCompactifications (#154) at README lines [11]
depcheck: 240 roadmaps, 2379 edges, 1 problem(s)
# consumers (#1053 at f51ec79, #1004 at d7f9613) against merge-order-moved.txt
UPWARD: ShimuraCompactifications (#153) -> ArakelovGeometryAndAbelianHeights (#154) at README lines [338, 1489, 1810, 1918, 1979, 2315]
UPWARD: FaltingsFinitenessAndIsogenyTheorems (#150) -> ArakelovGeometryAndAbelianHeights (#154) at README lines [352, 438, 530, 577, 654, 785]
# R02 repair on a scratch copy, board merge order, with and without --movable
depcheck: 240 roadmaps, 2378 edges, 0 problem(s)
```

The `--movable` check is meant to refuse a move when a consumer comes earlier. It did not refuse this one, because both consumers are open pull requests, not roadmaps on main. That is a limitation of the check, not a false positive: the edge it reads at line 11 is created by the README's wording.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree exits 0 with no output. The file is unchanged since f2895a4: a module docstring and an empty namespace. It has no declarations, so there is no `#check @name` comparison and no one-tactic probe, and there is no padding. It has no `set_option`, a single `import Mathlib` and no `TauCeti.*` imports.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArakelovGeometryAndAbelianHeights'` is empty. The pull request's whole diff is three files in the folder (README, `Suggested.lean`, `metadata.toml`; 1870 insertions). The long list of outside files in the change summary comes from the merge of main between f2895a4 and b494946, not from the pull request.

**Changed passages.**
- Line 73 (`mulHeight_pow_finrank`) agrees with DiophantineApproximationAndTranscendence §0.2, README line 269 at main eaf17b1, in three respects:
  - the name;
  - the direction `H_rel,K(x)^[L:K] = H_rel,L(x)`;
  - the zero-tuple clause, where both sides are 1.

  The scalar form there is `mulHeight₁_pow_finrank`, which is the "(x,1)" reduction of line 73. At the pinned Mathlib:
  - the name occurs nowhere (grep), so DiophantineApproximationAndTranscendence is the right supplier;
  - `Height.mulHeight_zero` (`Mathlib/NumberTheory/Height/Basic.lean:240`) fixes the zero-tuple value at 1;
  - `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean:136`) is the scalar absolute height through `ℚ⟮x⟯`, with no tuple or extension comparison.
- Line 74 is unchanged but depends on line 73. `absoluteProjectiveTupleHeight` is defined with its `_eq` at DiophantineApproximationAndTranscendence README line 309; §0.3 `finite_setOf_absMulHeight₁_le` is at its line 364.
- Line 76: see Not verifiable.
- Line 732: Pazuki read at the locator (R03). The statement of §2.2 is unchanged and its row is carried below.
- Line 11: the ownership split itself is right. ShimuraCompactifications (#1053, f51ec79) README lines 337–345 import §2.0, §5.0a and §5.0b, extend them to general degeneration and PEL data, and prove agreement on the principal Siegel case. Only the direction of the wording is wrong (R02). ArakelovGeometryAndAbelianHeightsPartII (#1833) does not mention ShimuraCompactifications.

**Overlaps and ownership.** `overlaps.md` lists:
- no other pull request changing this roadmap;
- no dropped id cited here;
- no id that only an open revision defines.

The changed passages touch the ownership of compactifications, which I checked against the two consumers above. The other closest roadmaps (#1738, #1833, #849, #1821) are not touched by this diff; the previous report's resolution stands for them.

**Pins.** The merge of main moved the pins: toolchain v4.35.0-rc3 → v4.36.0-rc2, Mathlib 6b7abb3 → 1b1ccf4, Tau Ceti a91d3aa → 2fd255d. I re-checked headline statability at the new pins.

New at the pins:
- Tau Ceti `minimalDiscriminantIdeal` (`TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:170`);
- the affine `invariantDifferential` of a Weierstrass curve (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:130`);
- Mathlib `PeriodPair`, `weierstrassP` and `g₂` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:60, 268, 957`).

Still absent:
- Néron models and the Néron differential lattice of an abelian variety;
- hermitian bundles over `O_K`;
- the Faltings metric;
- a theorem identifying `E(ℂ)` with `ℂ/L` for a period pair.

The elliptic-curve height could therefore be written only by defining it as the discriminant–period formula of §2.9. That definition would use a hypothesised period pair, with the minimal Weierstrass differential standing in for the Néron lattice. It would be §2.9's theorem used as a definition, which is the stand-in the rules exclude. So the docstring's account that no headline is statable remains accurate. `AbelianVariety` is still over a field (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`).

**Sources read this round.**
- pazuki12 (arXiv v2): lines 280–320 (§2.2, Definitions 2.1–2.2, pp. 6–7); lines 560–575 (Theorem 3.4(v), p. 13); lines 741–845 (Lemma 5.2, Proposition 5.3, Lemma 5.4 and Proposition 5.5, pp. 17–19).
- deligne85: lines 225–257 (§1.10, p. 31).
- DiophantineApproximationAndTranscendence README at main: lines 47, 269, 289, 309 and 364.
- The Cambridge Core page of Bombieri–Gubler (chapter list only).

**Adversarial table.** New rows for the changed statements come first. They are followed by the previous report's rows, marked (r1), for every statement this diff leaves untouched; the §2.2 row is carried because the statement is unchanged and only its source changed.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Line 73 `mulHeight_pow_finrank`: `H_rel,L(x) = H_rel,K(x)^[L:K]` | ℚ ⊂ ℚ(i), x = (1,2); ℚ ⊂ ℚ(√2), x = (1,½); zero tuple; L = K; wrong model: absolute normalisation without the power | H_ℚ(1,2) = 2. Over ℚ(i): one complex place of multiplicity 2, max(1,2)² = 4, finite part 1, so 4 = 2². H_ℚ(1,½) = H_ℚ(2,1) = 2. Over ℚ(√2): two real places with max 1; at 𝔭 = (√2), N𝔭 = 2 and v_𝔭(½) = −2, so max = 2² = 4; product 4 = 2². Zero tuple: 1 = 1^{[L:K]} (`mulHeight_zero`). L = K: exponent 1. The wrong model gives 2 ≠ 4 | correct; matches DiophantineApproximationAndTranscendence §0.2 line 269 |
| Line 74: absolute height independent of the field | (1,2) via ℚ and ℚ(i); (1,½) via ℚ and ℚ(√2) | 2^{1/1} = 2 = 4^{1/2}; 2 = 4^{1/2} | correct |
| Line 732 locator for `‖dz₁∧⋯∧dz_g‖²_Fal = det Im τ` | τ = i, g = 1; general g; Pazuki's normalisation | Faltings normalisation: (i/2)(−2i)·1 = 1 = Im i. General g: i^{g²}(−2i)^g(−1)^{g(g−1)/2}/2^g = 1, giving det Im τ. Pazuki (lines 282–289): (i/2π)(−2i)·1 = 1/π, in general π^{−g} det Im τ. Lemma 5.4 (lines 817–835): `β_σ = −½ log(2^{g/2} Σ_e ‖θ‖²(τ_σ, rz+e))`, no proof | statement correct; the locator does not carry it → R03 |
| Line 11, direction of supply | board order; moved order; both consumers; repaired copy | UPWARD #133 → #154; move #133 → #154; then ShimuraCompactifications #153 → #154 and FaltingsFinitenessAndIsogenyTheorems #150 → #154 are UPWARD, six lines each; repaired copy: 0 problems over 2378 edges | defect → R02 |
| Line 11, section reference | headings | "§5; … it.0." against `### 5.0a` (line 1342) and `### 5.0b` (line 1359) | split → R02 |
| `Suggested.lean` build | `lake env lean` on the file; module-form copy; `gate --build` | exit 0, no output; exit 0, no output; `build=2`, the Lake module warning twice | defect → R01 |
| Conventions: `‖α‖²_Fal = (i^{g²}/2^g)∫α∧ᾱ > 0` | g=1, ℂ/(ℤ+iℤ); g=2, E×E; general g | g=1: dz∧dz̄ = −2i dx∧dy, (i/2)(−2i)=1; g=2: α∧ᾱ = 4·vol, i⁴/4·4(Im τ)² = (Im τ)² > 0 while (i/2)²·4(Im τ)² = −(Im τ)²; general: i^{g²}(−2i)^g(−1)^{g(g−1)/2}/2^g = 1 | correct; Faltings's printed `(i/2)^g` (faltings83 lines 109–124, image p.351; p.354) is negative for g ≡ 2,3 mod 4 as the README says (r1) |
| Conventions: `h_Del = h_Fal + (g/2)log π`, `h_un = h_Fal − (g/2)log 2` | g=1 | ‖·‖²_Del = π^{−g}‖·‖²_Fal (deligne85 image p.26: `(1/(2π)^g)∫|α∧ᾱ|`); shift = −½ log c per embedding over [K:ℚ] embeddings: +0.5724, −0.3466 | correct; gaudronremond14 line 1906 `h_F = h − ½ log π` agrees (r1) |
| §1.3 degree | ℚ(i), 𝔞=(1+i), s=1+i; weight nonexample | index 1, Σ_σ log‖s‖ = 2·½log 2 → deg = −log 2; once per place: log 4 − log 2 ≠ 0 | correct; faltings83 image p.354 has `Σ ε_v log‖p‖_v` with ε_v ∈ {1,2} (r1) |
| §1.3 rescaling | rank r, c; rank 0 | det norm e^{−rc}: Δdeg = r[K:ℚ]c; zero bundle 0, no slope | correct (r1) |
| §1.4 independence | ℚ, s→2s; ℚ(√2), a=1+√2 | log 2 − log 2 = 0; finite 0, log|1+√2|+log|1−√2| = log 1 = 0 | correct; pinned `NumberField.prod_abs_eq_one` (ProductFormula.lean:98) (r1) |
| §1.5 dual, lattice index | L=𝔞s; ℤ ⊂ ½ℤ | ‖s^∨‖=‖s‖⁻¹, deg^ L^∨ = log N𝔞 + Σlog‖s‖ = −deg^ L; 0 and log 2 | correct (r1) |
| §1.6 base change | (ℤ,2|·|) to ℤ[i] | −2 log 2 = 2·(−log 2); `Ideal.absNorm_algebraMap` (RelNorm.lean:486) | correct; yuanzhang18 line 67 (r1) |
| §1.7 principal divisors, `O(D)` | (2) over ℚ; general (𝔞,λ) | log 2 − log 2 = 0; O((2)) = ½ℤ with 2|·|, ‖½‖=1, ‖2‖=4; deg^ O(𝔞,λ) with s ∈ 𝔞⁻¹: log|Ns| + log N𝔞 + Σλ_v − log|Ns| | correct; matches szpiro85 image p.14 Prop 1.1 (`exp(−λ_σ/ε_σ)`) and gilletsoule90 image p.131 §3.4.3 (r1) |
| §1.8 Green sign, vertical fibre | ℂ, z; Spec ℤ | dd^c(−log|z|²) = −δ₀; d̂iv(p) = (V_p, −2log p) so (V_p,0) ≡ (0, 2log p), both of degree log p | correct; gilletsoule90 lines 1235–1239 (r1) |
| §1.9 ĉ₁ | (ℤ, r|·|); FS on ℙ¹ | (0, −2 log r) of degree −log r = deg^; −log(|z|²/(1+|z|²)) + log|z|² = log(1+|z|²) smooth | correct (r1) |
| §1.10 point height | [1:2], FS, over ℚ and ℚ(i); Green shift c | ½ log 5 both ways (cycle doubles, degree doubles); shift ½·c·d·[K:ℚ] | correct; zhang21 lines 2390, 2405 (r1) |
| §1.11 stack degree | [Spec O_E/(ℤ/2)], Φ≡2 | ½·[E:ℚ]·2/2 = [E:ℚ]/2 | correct; aghmp18 lines 3337–3345 (p.80) (r1) |
| §1.12 sup height | [a:b] coprime | log max(|a|,|b|) = `mulHeight_eq_max_abs_of_gcd_eq_one` (Height/NumberField.lean:502) | correct (r1) |
| §1.13 ampleness | O(−1) at [1:2]; roots of unity | −log 2, unbounded below; h=0 for infinitely many without a degree bound | negative controls hold (r1) |
| §1.14 `deg^ = Height.logHeight` | finite and infinite parts; [1:1], [1:0] | ∏ᶠ_𝔭 max|x_i|_𝔭 = N(𝔟)⁻¹ (`absNorm_mul_finprod_finitePlace_eq_one`, NumberField.lean:199); Σ_v mult(v) log max (`mulHeight_eq`, :127); FS − sup ∈ [0, ½[K:ℚ]log(n+1)]: 0 vs ½log 2; 0 vs 0 | correct (r1) |
| §1.15 norm | N_{ℚ(i)/ℚ}(1+i); half-class torsion in ℚ(√2) | module 2ℤ, ‖2‖ = |1+i||1−i| = 2, degree −log 2 = deg^(𝔭); ½(a,−a) is nonzero 2-torsion in ℝ²/ℤ(a,−a) | correct (r1) |
| §2.1 sesquilinearity | ℂ/(ℤ+iℤ) | ⟨i dz,dz⟩ = (i/2)∫dz∧(−i dz̄) = −i; ⟨dz,i dz⟩ = i | correct (r1) |
| §2.2 covolume | ℤ+τℤ; ℤ^g+τℤ^g; basis (Ω₁|Ω₂) | det[[1,Re τ],[0,Im τ]] = Im τ; det Im τ; |det Ω₁|² det Im τ | correct (r1) |
| §2.3 isogeny norms | [n] | deg n^{2g}, [n]^*α = n^gα, norm² ×n^{2g} | consistent; raynaud85 image p.205 `∫|u^*ω∧u^*ω̄| = d∫|ω∧ω̄|` (r1) |
| §2.4/§2.9/§3.1 11.a2 | τ ≈ ½+1.14939i, Δ_min = −11⁵ | q ≈ −7.30·10⁻⁴, |Δ| ≈ 7.43·10⁻⁴, y⁶ ≈ 2.306; 12·deg = 11.9895 + 6.370 − 22.055 = −3.696; h ≈ −0.3080 | matches LMFDB −0.30800984 (stable = relative, semistable) (r1) |
| §2.4 model nonexample 27.a3 | X=4x, W=8y+4 | W² = 64(y²+y)+16 = X³+16; dX/(2W) = dx/(4y+2) = ω_N/2; index 2 → +log 2 | correct (r1) |
| §2.5 product sign | g,h | i^{(g+h)²} = i^{g²}i^{h²}(−1)^{gh}; reordering costs (−1)^{gh} | cancels, isometry (r1) |
| §2.6 duality identity | E, α=[n]; Tate curve q=π⁵ | n² = deg; pairing 5, both lines ℤ·dt/t | consistent; raynaud85 image p.207 Thm 2.1.1 (r1) |
| §2.7/§2.10 Deligne norm | dz on ℂ/(ℤ+iℤ) | (2π)⁻¹·2 = 1/π; ‖dz⊗dz‖² = 1/π² | correct; yuanzhang18 lines 401–416 (Lemma 2.1, p.12) (r1) |
| §2.9 formula | derivation | 12 log#(ω̄/O_Kω) = log NΔ_min − log|NΔ_ω|; |σΔ_ω|‖ω‖¹² = (2π)¹²|Δ(τ)|y⁶; sum gives −12[K:ℚ]log 2π | correct; double-count nonexample 12 log 2π (r1) |
| §3.3/§3.4 | 27.a3; K(A[12]) | correction a positive multiple of (log 3)/[L:ℚ]; level 3 away from 3, level 4 away from 2 | correct; deligne85 image p.27 `h ≥ h_geom`, equality iff semistable (r1) |
| §3.6 | K(A[15]); #GL₂(ℤ/12) | [K′:K] ≤ #GL_{2g}(ℤ/15); 96·48 = 4608; (log p)/[K′:ℚ] ≤ h − h_st | matches deligne85 image p.35 Lemme 1.23 verbatim in content (r1) |
| §4.1 different | [n] on g-dim; μ_p and ℤ/p quotients | Fitt₀ = (n^g), Ann = (n) for g>1; (p) vs (1) | correct; raynaud85 image p.204 §1.3 (r1) |
| §4.2 isogeny formula | derivation; [n] | deg^𝒜 = deg^ℬ + log#(O_K/𝔡) − ½[K:ℚ]log d; g log|n| − g log|n| = 0 | matches faltings83 line 394 (Lemma 5, p.358) and raynaud85 image p.205 Prop 1.4.1 (r1) |
| §4.3 dual differents | μ_{p^n}; E/F, [p]; coefficient comparison | n v(p) + 0 = v(p^n); #coker = #E[p](F)p^{[F:ℚ_p]}; log_q h¹(M_{K_r}) = v(d)r + O(1) | raynaud85 image p.207: `𝒟_u𝒟_{u′} = (d)` with no semistability hypothesis; p.211 sequence (5) (r1) |
| §4.4 bounds | d = p^n; rationality | m = 2k − [K:ℚ]n, |m| ≤ [K:ℚ]n; v_p ∈ [−[K:ℚ]v_p(d), [K:ℚ]v_p(d)] | raynaud85 image p.207 Cor 2.1.4; bpr13 lines 655–665 (p.971) (r1) |
| §4.5 tower | G = A[ℓ^∞] good; zero subgroup | h_G/2 − Σ[K_v:ℚ_ℓ]g/[K:ℚ] = g − g = 0; 0 | faltings83 line 467 (p.359); raynaud85 lines 774–790 (Def 4.1.1, p.219), 805–808 (Cor 4.1.3, p.220) (r1) |
| §4.6/§4.7 components | E = ℚ; sign of §4.7 | h(A,id) = (h_YZ(A)+h_YZ(A^t))/2; deg N(𝒳) − deg N(𝒴) = log#coker f^* − log#coker f^{t*} | yuanzhang18 lines 440–461 (pp.13) (r1) |
| §5.0b g = 1 | ℙ¹_ℤ, m = 12 | ω¹² ↔ O(1) via (E₄³ : Δ); stabilizer characters have order dividing 3 in char 2 (j=0) and 4 in char 3 (j=1728), so ω¹² is invariant | correct (r1) |
| §5.1/§5.3 | cusp; E_deg×E | Im τ = −(1/2π)log|q|; g=2, r=3, 2g−r=1 | deligne85 lines 332–361 (Lemme 1.18, exponent |log|z||^{2g−r}); szpiro85 lines 545–558 (Thm 3.2, p.26) (r1) |
| §5.4 | discriminant section | ‖Δ‖ = (2π)¹²|Δ_Mathlib|(Im τ)⁶, consistent with §2.9 | correct (r1) |
| §5.7 theta at τ = i | half-characteristics vs Mumford | θ₂ = θ₄ = 2^{−1/4}θ₃, θ₁₁ = 0: [1:a:a:0]; θ_{0,0}(4i) = (θ₃+θ₄)/2, θ_{½,0} = (θ₃−θ₄)/2, θ_{¼,0} = θ_{¾,0} = θ₂/2: [1+a:a:1−a:a]; ℓ² norms 1+√2 vs 2+2√2; finite part ¼log 2 both (v_𝔭(a) = −1 at the prime over 2); FS difference ½ log 2 | correct; pazuki12 lines 389–392 (G = S_{r^{2g}} ⋉ μ_{r⁴}), 432–452 (r1) |
| §5.7 nonexamples | sup vs ℓ²; (1/5)[[3,4],[−4,3]] | ≤ ½ log r^{2g}; [1:0] → [3:−4], heights 0 vs log 5 | correct (r1) |
| §5.8 constants | m, M, C(g), C₁, C₂, c(g); g=2 | m = g(¼log 4π − ½r^{2g}log r); M = (g/4)log 4π + g log r + (g/2)log(2 + 2^{1+g³/4}/3^{1/4}); C(g) = (8g/π)(1+2g²log 4g); C₁ = 6r^{2g}log r^{2g}; C₂ = 1000r^{2g}(log r^{2g})⁵; g=2: 2^{1+2} = 8 | all match pazuki12 lines 73–107 and image p.2; c(g) at lines 850–860 (r1) |
| §5.8 origin identity | Lemma 5.2 at P = 0; β examples | 0 = h_Θ − ½h_F − (g/4)log 2π + (Σβ_𝔭 log N𝔭 + Σβ_σ)/[K:ℚ]; β_σ(1,1,0,0) = −½log 2, (1,2,0,0) = −½log 5; Prop 5.3(ii) ≤ (g/2)r^{2g}log r | pazuki12 lines 769–785, 603–608, 800 (r1) |
| §5.9 | j = 0; j = −1; GR constant; 11.a2 | q = −e^{−π√3} = −0.004333, |Δ| ≈ 0.004807, y⁶ = 0.4219, U = 0.002028; h_Fal = −(1/12)log U − log 2π = −1.3211, Deligne −0.7487; y = 0.8944: U ≈ 0.002024, −1.3210; B = 1194(2π/log 1194)⁶e^{1/9}(2π)¹²: ½log π + (1/12)log B = 0.5724 + 2.3776 = 2.950; h(j)/12 = 1.5516 ≥ −0.308 | matches gaudronremond14 lines 1894–1933; bpr13 line 659 (r1) |
| §6.1–§6.2 Zarhin | E; dimension | Z(E) = E⁸, dim 8; 4h + 4h = 8h | PDERC RD.5.116 (line 12165 at #1002); moretbailly85 lines 7296–7300 (Lemme 1.1, p.205); deligne85 image p.35 Rem 1.22 (r1) |
| §6.3 | #GL₂(ℤ/12); 2·3^{4g²} | 4608; g=1: 96 ≤ 162 | PELModuli M6.8 (line 3981 at #966) (r1) |
| §6.5 Bost | normalizations | −(g/2)log 2π = −0.919g; −(g/2)log(2π²) = −1.490g > −1.5g; j=0 minimum −0.749 > −0.919 | gaudronremond14 lines 1995–1996 (Thm 8.1), 2177–2178 (Cor 8.4); gaudronremond14b line 1792 (−3g/2, p.2101); tsimerman18 lines 98–100 (r1) |

**Library declarations opened at the pins this round.**
- Mathlib: `Height.mulHeight_zero` (`Mathlib/NumberTheory/Height/Basic.lean:240`); `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean:136`); `PeriodPair` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:60`), `PeriodPair.weierstrassP` (`:268`), `PeriodPair.g₂` (`:957`).
- Tau Ceti: `minimalDiscriminantIdeal` (`TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:170`); `invariantDifferential` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:130`); `AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`).

**Cross-roadmap citations resolved this round**, for the changed passages:
- DiophantineApproximationAndTranscendence on main: §0.2 `mulHeight_pow_finrank` (line 269) and `absoluteProjectiveTupleHeight` (line 309); §0.3 `finite_setOf_absMulHeight₁_le` (line 364).
- ShimuraCompactifications at #1053 f51ec79: lines 337–345, 1488, 1917, 2314 and 2512.
- FaltingsFinitenessAndIsogenyTheorems at #1004 d7f9613: line 529.

The worker's citation scan finds no unresolved cross-roadmap citation.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry*, §1.5 (line 76). The DOI resolves to Cambridge Core, which shows only the chapter list ("1 – Heights, pp. 1–33") behind a "Get access" prompt, and I found no legal open copy. The section-level locator is therefore cited by locator alone (uncertified). The two facts it supports, relative-height scaling and invariance of the absolute height, are standard, and DiophantineApproximationAndTranscendence §0.2 supplies both.
- Faltings–Chai, Ch. V, proof of Proposition 4.5, p. 168 (line 732, unchanged): paywalled, as in the previous report.
- Deligne §1.10, p. 31 (line 732, unchanged): the cached OCR loses the displayed value of `⟨e,e⟩` (deligne85 lines 246–249). The surrounding text is legible: it describes the metric on `ω` trivialised by the basis `e`, Sp(V)-invariant and unique up to a factor. The value `det(Im Z)` rests on the previous report's reading of the page image.

## Source issues

- none
