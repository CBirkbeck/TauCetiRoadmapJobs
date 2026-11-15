<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6899854892 -->
Review (claude) of ee4760c

Verdict: needs_changes

1. **F01** (P2) §2.7(a): an étale morphism of schemes need not have finite geometric fibres

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:449`: "an étale morphism of schemes locally of finite presentation over `A` (Mathlib `AlgebraicGeometry.Etale`) induces an étale map of arc-stacks".

   **Claim.** Every étale morphism of schemes locally of finite presentation over `A` gives a map of arc-stacks that is étale in the sense of README:447, that is, finitary with every geometric fibre "a finite disjoint union of copies of `Marc(C)`".

   **Witness.** `⨿_{n∈ℕ} Spec A → Spec A` is étale (Mathlib `Etale`, Morphisms/Etale.lean:39, tested on affine opens of the source). Its geometric fibre is `⨿_{n∈ℕ} Marc(C)`: infinitely many copies. The route at README:461 assumes a finite étale `C`-algebra.

   **Exact repair.**

   1. At README:449 replace the clause by: "and a quasi-compact étale morphism of schemes locally of finite presentation over `A` (Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.QuasiCompact`) induces an étale map of arc-stacks; without quasi-compactness the induced map is finitary with discrete, possibly infinite, geometric fibres".
   2. At README:461 replace "over a geometric point `C` a finite étale `C`-algebra is a finite product of copies of `C`" by "over a geometric point `C` the fibre is a quasi-compact étale `C`-scheme, hence a finite disjoint union of copies of `Spec C`", and add after the citation of the étale coordinates: "the charts `V → 𝔸ⁿ_A` are morphisms of affine schemes, hence quasi-compact".
   3. Add a Check to §2.7: "Quasi-compactness is needed in (a): `⨿_{n∈ℕ} Spec A → Spec A` is étale, and its arc-stack `⨿_{n∈ℕ} Marc(A) → Marc(A)` has countably infinite geometric fibres, so it is not étale in the sense above, although it is a disjoint union of open immersions and its free motive `⊕_{n∈ℕ} ℤ` exists by case 3."
   4. Add Mathlib `AlgebraicGeometry.QuasiCompact` (Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean) to the Mathlib contract and to the *Needs* line of §2.7.

   **Repair tested.** On the witness: the map is not quasi-compact (the preimage of `Spec A` is an infinite disjoint union), so the repaired clause no longer applies to it. For a quasi-compact étale `g`, the fibre over a `C`-point is quasi-compact and étale over an algebraically closed field: finitely many copies of `Spec C`. The first clause of (a) is unaffected: `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:98) gives an affine `V`, and `V → 𝔸ⁿ_A` over affine `Spec A` is a map of affine schemes. No other statement uses the unrestricted clause: §§8.5, 9.1, 9.5 and 10.6 use only "smooth without boundary".

2. **F02** (P3) A cited supplier declaration does not exist

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:84` and `:917`: "KTheoryFiniteLocalFields §1.5 (`perfect_positiveK_uniqueDivisible`: the positive K-groups of a perfect `𝔽_p`-algebra are uniquely `p`-divisible)".

   **Claim.** KTheoryFiniteLocalFields declares `perfect_positiveK_uniqueDivisible` in its §1.5.

   **Witness.** `roadmaps grep --fixed 'perfect_positiveK_uniqueDivisible'`: "no match on main or in any open roadmap pull request". KTheoryFiniteLocalFields at its open head, README:277–279 (§1.5), states the fact in prose only; its `Suggested.lean` has no such name.

   **Exact repair.** Cite the section, not a name. At README:84: "KTheoryFiniteLocalFields §1.5 (for every perfect commutative `𝔽_p`-algebra `A` and `n ≥ 1`, multiplication by `p` on `K_n(A)` is an automorphism; `K₀` is excluded)". At README:917: "*Needs:* §7.6; KTheoryFiniteLocalFields §1.5 (unique `p`-divisibility of the positive K-groups of perfect `𝔽_p`-algebras); gap:padic-k-integers-oc; gap:einfty-fracture-square."

   **Repair tested.** §1.5 at that head says: "For every perfect commutative 𝔽p-algebra A prove that multiplication by p on Kₙ(A), n≥1, is an automorphism", which is what §7.7 uses for `K(k)^∧_p ≃ ℤ_p`. The other 31 backticked supplier names were each found in the supplier's README (list under Verified sound).

3. **F03** (P3) "No projective-space scheme" is false at the pins and contradicts §0.8

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:40`: "Mathlib at the pin has no projective-space scheme, so §0.8 glues `ℙⁿ` from affine charts."

   **Claim.** The pinned libraries have no scheme `ℙⁿ`, and §0.8 constructs it by gluing.

   **Witness.** Mathlib `AlgebraicGeometry.Proj` (ProjectiveSpectrum/Scheme.lean:855); Tau Ceti `TauCeti.SymmetricAlgebra.projToSpec` (ProjectiveSpectrum/SymmetricAlgebra.lean:57), `TauCeti.AlgebraicGeometry.projectiveLine` (ProjectiveLine.lean:139), `TauCeti.puncturedAffineSpace` (PuncturedAffineSpace.lean:78). README:228 takes "the arc-stacks of the corresponding schemes over `ℤ`": no gluing.

   **Exact repair.**

   1. Replace the sentence at README:40 by: "The scheme `ℙⁿ_ℤ` of §0.8 is `AlgebraicGeometry.Proj` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean) of the symmetric algebra of `ℤ^{n+1}`, in the form Tau Ceti provides."
   2. Add a bullet to "From Tau Ceti": "`TauCeti.SymmetricAlgebra.projToSpec` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/SymmetricAlgebra.lean): for a commutative ring `R` and an `R`-module `M`, the structure morphism `Proj(Sym M) → Spec R`, proper when `M` is finite (the instance at line 115 of that file); `TauCeti.AlgebraicGeometry.projectiveLine` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveLine.lean) with its two open charts `Spec R[X] → ℙ¹_R`; and `TauCeti.puncturedAffineSpace` (TauCeti/AlgebraicGeometry/PuncturedAffineSpace.lean), the open subscheme `𝔸^ι_R ∖ 0` whose `A`-points are the unimodular vectors. These are the schemes `ℙⁿ`, `ℙ¹` and `A² ∖ {0}` whose arc-stacks §0.8 forms."
   3. Add the three names to the *Needs* line of §0.8 and to the Layer 0 *Dependencies*.

   **Repair tested.** The four declarations were opened at the pin (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) at the lines given. With them §0.8's sentence "the arc-stacks of the corresponding schemes over `ℤ`" has a carrier for `ℙⁿ` and `A² ∖ {0}`; `GL_n` and `GL_n/G_m^n` have affine presentations and need none.

Three findings: one P2 and two P3; one blocking. All three findings of round 6 are repaired. The new §§0.8 and 2.7 survive the adversarial pass except for one missing hypothesis (R01). R02 and R03 are one-sentence corrections of supplier citations. No file of the package was changed by this review.

## Verified sound

### Previous findings

| Round-6 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): arc-stacks of schemes and analytic spaces, and their free motives, never constructed | README:224–250 (§0.8): "For general `Y`, let `Y^arc` be the colimit, in arc-sheaves of sets, of `V ↦ V^arc` over the affine opens"; README:439–471 (§2.7): "an object of `Deff_mot(X)` corepresenting the functor `M ↦ Γ(Y, f^* M)` … when one exists"; README:975 (§8.5) now states smoothness for maps "smooth without boundary in the sense of §2.7"; README:1195 names the functor `M(X) ↦ ℤmot[X^arc]`. | Repaired, in two sections instead of one; the split is forced by §1.1 and §2.5 needing affine space before Layer 2. One new defect in the added text: R01. |
| F02 (P3): "no K-theoretic carrier" | README:44: "Tau Ceti at the pin has no Banach-ring site, no motivic category and no K-theory spectrum. Its low-degree K-theoretic carriers, the exact Grothendieck group `TauCeti.ExactK0` …" | Repaired. `ExactK0` at Exact.lean:179, `StableGeneralLinearGroup` documented at Stable.lean:31, `AlgebraicK1` at Stable.lean:314; GeneralAlgebraicKTheory's README cites `TauCeti.ExactK0` 14 times (first at its line 52). |
| F03 (P3): manifest lacked the published version | `sources.toml`, entry `Scholze`: `venue = "J. Amer. Math. Soc. 39 (2026), 697-764"`, `doi = "10.1090/jams/1068"`, and the new `version_note`. | Repaired. Key, hash and provenance unchanged. |

No finding of the last repair report was marked not actionable. No maintainer note was left for this roadmap.

**Repair-pattern audit.** The pattern of F01 (an object used but not constructed) was searched for in the rest of the file: `G̃_{m,k}` (§11.1) is now tied to §0.8 in its *Needs* line; `A⟨T⟩₁`, `A⟨Δⁿ⟩` (§§2.1, 2.2) and `A((T))_{1/2}` (§0.3) are defined where they appear; `X♭` is defined in §4.9; `MG_k`, `MG_C` in §§11.3, 11.5. The pattern of F02 (a claim that a library lacks something) was rechecked at the pin for every such sentence; one more instance failed (R03). The sentences "no Berkovich spectrum, no Banach-ring site, no stable or presentable ∞-category of sheaves and no algebraic K-theory spectrum" hold: a search of the pinned Mathlib for `Berkovich` finds nothing, of Tau Ceti only comments in the adic-space files, and `KTheory`/`AlgebraicK` match only Stable.lean and a cyclic-cohomology pairing file.

### Principles, shape and policy

- 13 layers, 82 numbered targets, 82 *Needs* lines, 52 Checks blocks, 32 API blocks, 13 *Examples* and 13 *Dependencies* subsections. Each of the 31 targets that define an object has at least three Checks; the 30 targets without a Checks block are theorems with hypotheses and a locator.
- No route-specific shortcut: residue characteristics 2 and 3, archimedean points, trivially normed fields and non-separated curves are all treated. No algorithm, no sorry'd data, no `set_option`.
- A search of the README for process words, pull-request numbers, job ids, machine paths, HTML anchors, LaTeX delimiters, "optional", "deferred" and "for later" returned nothing. The manifest has no local path.
- The README does not say it follows a source and no layer is named after a source's section.

### Source sample (all 15 seeded targets, read at the locator)

No locator is flagged unverified by the author other than BLR, settled as uncertified.

| Target | Lines read | Result |
|---|---|---|
| 1.6 | Scholze 1067–1094 (Props 4.24–4.25, pp. 25–26) | Left adjoint with projection formula for finitary maps; `j_! = j_♯`; excision triangle; the `|2|` decomposition on p. 26. Agrees. |
| 2.1 | Scholze 1107–1142 (Defs 5.1–5.2, Lemma 5.3, Cors 5.4–5.5, pp. 26–27) | Test on all Banach rings over `X`; bound 3; geometric-point test; closure under colimits. Agrees. |
| 2.6 | Scholze 1351–1364 (Thm 5.14, p. 32) | The factorization is a hypothesis; base change and projection formula. Agrees. |
| 3.2 | Scholze 1365–1372 (§5.2, Def. 5.15, p. 32) | Nonarchimedean locus; sheaf quotient. Agrees. |
| 4.8 | Scholze 1649–1668 (Cor. 6.6, Thm 6.7, p. 39) | `|n| ≥ 1` everywhere; `|p|_A < 1` on the norm; pointwise `|p| ≥ 1`. Agrees; the README's norm-versus-pointwise remark is its own and correct. |
| 4.9 | Scholze 1669–1685 (Prop. 6.8, pp. 39–40) | `|p| < 1` everywhere; `ℤ[1/p]`-linearity; trace splitting. Agrees. |
| 5.3 | Scholze 1707–1722 (Thm 7.1, Remark 7.2, pp. 40–41), 224 (Thm 1.9, p. 6) | Every small arc-stack; the unit map is an equivalence. Agrees. |
| 8.1 | Scholze 2095–2108 (Def. 9.1, p. 50), 235–238 (Def. 1.11, p. 6) | Colimit and limit descriptions; sequence model; full faithfulness. Agrees. |
| 8.2 | Scholze 2132–2180 (Prop. 9.3, pp. 51–52) | `f_♯ ≅ f_* ⊗ ℤ(1)[2]`; unit from `O(Δ)`; counit from reduced cohomology. Agrees. |
| 9.2 | Scholze 2274–2299 (proof of Prop. 10.3, pp. 54–55) | Factorization through a quasi-compact subset; tensor products of compact morphisms. Agrees. |
| 9.8 | Scholze 2359–2388 (Props 10.8–10.10, pp. 56–57) | Arc-sheaf; Tate generation on strict bases only; rigidity under the hypotheses of Prop. 10.3. Agrees. |
| 11.2 | Scholze 2467–2473 (Prop. 11.4, p. 59) | Fibre `ℚ(−1)[−1]`; the module structure factors through the augmentation. Agrees. |
| 12.2 | Scholze 2630–2640 (after Cor. 12.2, p. 63) | Perfectoid Tate algebras without norm; covers on rank-one points; `Spa(R, R°) → Spa(R, R⁺)` a cover. Agrees. |
| 12.3 | Scholze 2641–2652 (Prop. 12.3, p. 63) | `n` prime to `p`; overconvergent image; three compatibilities. Agrees. |
| 12.4 | Scholze 2653–2666 (Prop. 12.4, pp. 63–64) | Spatial diamond of finite cohomological dimension; colimit-preserving right adjoint; compact generation of the ambient category only. Agrees. |

Also read for the repaired passages: Scholze 157–162 (p. 4), 240–243 (p. 6), 1095–1103 (Example 4.26, p. 26), 1286 (Lemma 5.11, p. 30), 2181–2203 (construction of the six operations, Props 9.4–9.5, Cor. 9.6, p. 52), 2440–2466 (pp. 58–59). All locators of §§0.8, 2.7 and 8.5 are on the pages stated. Proposition 9.5 defines étale maps as finitary maps with finite geometric fibres, which is the definition at README:447.

### Adversarial table

Computed instances. "Retain" means no edit.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.8 universal property of `ℤ⟨T⟩_r` | `B` Banach, `|b| ≤ r`; `n = 0` | `|a_ν b^ν| ≤ |a_ν · 1_B| r^{|ν|} ≤ |a_ν| r^{|ν|}`, with `|1| ≤ |−1|² ≤ 1`; `n = 0` gives `ℤ`, so `A⁰_X = X × Marc(ℤ) = X`. | Retain. |
| §0.8 `Y^arc(B) = Hom_A(Spec B, Y)` | `Y = ⨿_ℕ Spec A`, `B = C`; `Y = Spec K[ε]/(ε²)` | `ℕ × Hom(A, C)`; `|ε|² = |ε²| = 0`, so one point. | Retain. |
| §0.8 open immersions | `W = ∪ D(g_α) ⊂ Spec B′`, `B′` strict | `{x : g_α(x) ≠ 0}` is open in `M(B′)`; an open of `Spec B″` containing all closed points is everything; `M(B′) → M(B)` is a quotient map. | Retain. |
| §0.8 `(Y^an)^arc ≃ Y^arc` | `Y = A¹_K`, radius `r` | A multiplicative seminorm bounded on `K ⊗̂ ℤ⟨T⟩_r` has `|n| ≤ 1`, so it is ultrametric and bounded by the Gauss norm: the uniform completion is `K{r⁻¹T}`. | Retain. |
| §0.8 doubled origin | `T₁ = T₂ = ϖⁿ` | `|ϖ|ⁿ → 0`; limit `(0, 0)` lies outside `{T₁ = T₂ ≠ 0}`. | Retain. |
| §2.7 case 3 | `Y = Y₁ ⊔_{Y₀} Y₂` | `Γ(Y, M) = Γ(Y₁, M) ×_{Γ(Y₀, M)} Γ(Y₂, M)`, so `ℤmot[Y] = cofib(ℤmot[Y₀] → ℤmot[Y₁] ⊕ ℤmot[Y₂])`. | Retain. |
| §2.7 `ℤmot[ℙ¹_X]` | Two charts | `cofib(ℤ ⊕ ℤ(1)[1] → ℤ ⊕ ℤ)` with `(1, −1)` on `ℤ`, `0` on `ℤ(1)[1]`: `ℤ ⊕ ℤ(1)[2]`. Same value at README:758, 989, 1122, 1201. | Retain. |
| §2.7 non-existence | Skyscrapers `F_n` at `1/n` on `[0, 1]` | Stalk at `0` of `∏ F_n` is `∏ℤ/⊕ℤ ≠ 0`; `∏ (F_n)₀ = 0`. | Retain. |
| §2.7(a), étale clause | `⨿_ℕ Spec A → Spec A` | Geometric fibre `⨿_ℕ Marc(C)`: infinite. | Fails: R01. |
| §2.7(a), smooth clause | Affine `V → 𝔸ⁿ_A` étale | A map of affine schemes is quasi-compact; fibre over a `C`-point is finite. | Retain. |
| §2.7(c) | `Y ⊂ ℙ^N`, `C` geometric | `d(D^N) ≤ 3N` by `N` steps of `+3`; closed immersion `+0`; ordered Čech complex on `N + 1` closed pieces has length `N`: `3N + N = 4N`. `ℙ¹_ℂ`: `2 ≤ 4`. | Retain. |
| §2.7 closed disc not smooth without boundary | `D = Marc(C⟨T⟩₁)` | If charts existed, `f^!ℤ ≅ ℤ(1)[2]` on each, and a `±1`-torsor on the contractible Berkovich disc is trivial; then `ℤ = f_♯ ℤ = f_*(ℤ(1)[2]) = ℤ(1)[2]`, false rationally (`(Ḡ_m ⊗ ℚ)[1] ≠ ℚ`). | Retain. |
| §8.5 smooth without boundary ⇒ cohomologically smooth | `A¹_X ⊂ ℙ¹_X → X`; open; étale chart | §8.2 holds over every `X`; `j^! = j^*`; `g^! = g^*` for étale `g`. Scholze line 240 states it at this generality. | Retain. |
| §1.6 | `A = Cont([0, 1], ℂ)`, `U = (0, 1]`; points `ℂ`, `ℚ₃`, trivial norm | Stalks `0 → ℤ → ℤ` at `0`, `ℤ → ℤ → 0` at `t > 0`; `|2| = 2 > 1`, `|2| = 1`, `|2| ≤ 1`. | Retain. |
| §2.1 | `ℂ⟨T⟩₁`; nonarchimedean `C`; `G_m` | `2 + 0 = 2`; `1 + 2 = 3`; `1 + aT` is a unit of `C⟨T⟩₁` outside `C^×`. | Retain. |
| §2.6 | `n = 0`, `f = id`; `A¹_X → X` | `f_♯ = id`; `f_♯ ℤ = ℤmot[A¹_X] = ℤ`. | Retain. |
| §3.2 | `C = ℂ_p`: `1 + p`, `p`, a Teichmüller unit `ζ ≠ 1` | Classes: trivial; nontrivial (`|p| ≠ 1`); nontrivial (`|ζ − 1| = 1`). Extension of `ℚ` by `𝔽̄_p^×`. | Retain. |
| §4.8 | `ℤ₂` with `‖x‖ = 2^{−⌊v/2⌋}` | `‖2‖ = 1`, `‖4‖ = 1/2`, spectral radius `2^{−1/2} < 1`. | Retain. |
| §4.9 | Characteristic-`p` perfectoid field; `ℂ_p`, `n` prime to `p` | Only untilt is itself; `μ_n` is the `n`-torsion of `C^×/(1 + C_{<1})` on both sides. | Retain. |
| §5.3 headline | Complex point; `X = ∅`; `M = ℤ` at a geometric point of exponent `p` | Identity functor; `0 → 0`; both sides have `π₀ = ℤ[1/p]`. | Retain. |
| §6.3 headline | `ℙ²`, eigenvalues `1, 2, 4` | `(ψ−2)(ψ−4)/3`: `1, 0, 0`; `−(ψ−1)(ψ−4)/2`: `0, 1, 0`; `(ψ−1)(ψ−2)/6`: `0, 0, 1`. | Retain. |
| §7.6 headline | Residue characteristic `0`; `C = ℂ_p` | `p = 1`, nothing inverted; `π₀ = ℤ[1/p]`. | Retain. |
| §8.1 | `ℤ(−1)` | `M_n = ℤ(n − 1)`, `M₀ = Hom(ℤ(1), ℤ) = Hom(ℤ(1), M₁)`. | Retain. |
| §8.2 | Complex point | `f_♯ ℤ = ℤ ⊕ ℤ[2]`; `(ℤ ⊕ ℤ[−2])[2] = ℤ[2] ⊕ ℤ`. | Retain. |
| §9.2 | `{|T| < 1} ⊂ {|T| < 2}`; identity of the open disc | Factors through `{|T| ≤ 1}`; no quasi-compact factorization. | Retain. |
| §9.6 headline | `[0, 1]` | `RΓ(j_! ℤ) = 0`, `j_! ℤ ≠ 0`: rigid, not compactly generated. | Retain. |
| §9.8 | Two complex points | `DMT = D(ℤ)² = Dmot`. | Retain. |
| §10.6 headline | `ℙ¹_k`; `k = 𝔽̄_p`, `ℤ(−j)` | `ℤ ⊕ ℤ(1)[2]` both sides; `ℚ[0]` for `j = 0`, else `0`. | Retain. |
| §11.2 | Finite levels of the pro-torus | `cofib(ℤ → g_{n*} ℤ) = ℤ(−1)[−1]`; colimit along multiplication by `n` prime to `p`, with `p` invertible: `ℚ(−1)[−1]`. Two-step filtration. | Retain. |
| §11.8 headline | `A = ℚ ⊕ ℚ(1)` | `N ≠ 0`, `N² = 0`. | Retain. |
| §12.2 | `R⁺ = R°`; `(C, C⁺)` of rank 2 | Identity; `Spa(C, O_C) → Spa(C, C⁺)` hits 1 of 1 rank-one points and 1 of 2 points. | Retain. |
| §12.3 headline | Constant sheaf; `j_!` from the rank-one point; `n = 1` | `id`; `0 → ℤ/n`; `0`. | Retain. |
| §12.4 | `X = Spa(C, O_C)` | `Y = X`, `R ∘ I = id` on `D(ℤ/n)`. | Retain. |
| R02 | Open head of KTheoryFiniteLocalFields | 0 occurrences of the name; §1.5 has the statement. | Fails: R02. |
| R03 | Pinned Mathlib and Tau Ceti | `Proj`, `projToSpec`, `projectiveLine`, `puncturedAffineSpace` exist. | Fails: R03. |

For the targets not listed, the rows of the round-6 table that carry computed values were relied on; the whole README was reread in this round.

### Pinned libraries

Content checkout at `1a19c9f`. Opened at the pin, with the hypotheses the README states:

- Mathlib: `CategoryTheory.GrothendieckTopology` (Sites/Grothendieck.lean:72), `NormedField` (Analysis/Normed/Field/Basic.lean:155), `IsUltrametricDist` (Topology/MetricSpace/Ultra/Basic.lean:47), `SSet.Quasicategory` (AlgebraicTopology/Quasicategory/Basic.lean:41), `continuousCohomology` (RepresentationTheory/Homological/ContCohomology/Basic.lean), `PowerSeries.IsRestricted.subring` (RingTheory/PowerSeries/Restricted.lean:90), `AlgebraicGeometry.Scheme` (Scheme.lean:40), `LocallyOfFinitePresentation` (Morphisms/FinitePresentation.lean:46), `Etale` (Morphisms/Etale.lean:39), `Smooth` (Morphisms/Smooth.lean:59), `AffineSpace` (AffineSpace.lean:43), `QuasiCompact` (Morphisms/QuasiCompact.lean:41).
- Tau Ceti: `Subring.unitClosedBall` (Analysis/Normed/Ring/Ultra.lean:84), `TauCeti.unitBallIdeal` and `mem_unitBallIdeal` (UnitBall.lean:90, 101), `isPrincipalIdealRing_isRestricted_subring` (Weierstrass/Ideal.lean:115), `cohomologicalDimensionAt`, `strictCohomologicalDimensionAt` (CohomologicalDimension/Basic.lean:146, 151), `cohomologicalDimensionAt_le_of_isClosed` (ClosedSubgroup.lean:80), `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one` (Strict.lean:181), `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (EtaleCoordinates.lean:98; its charts are `𝔸(ULift (Fin n); S)`, as its docstring says).

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output: no error, no warning, no `sorry`. The file is one `import Mathlib`, one module docstring and an empty namespace.
- The Summary's nine headline families (cancellation; `Kmot` finitary with its Adams splitting; the explicit K-cofibre; torsion and tilting; six operations and proper base change; rigidity; the étale comparison; the monodromy equivalence; the overconvergent comparison) are each named in the module docstring with the missing carrier. None is statable at the pins: each needs `Dfin`, `Deff_mot`, `Dmot`, a K-theory spectrum or v-stacks.
- The one-tactic padding probe and the `#check @name` binder audit have no input: zero declarations, nothing compared, nothing changed.
- No backticked name in the README is presented as a Lean declaration of this roadmap.

### Duplication, suppliers and order

- `roadmaps resolve` on the README lists nothing. It missed the name of R02, so every supplier citation was resolved again by hand against the supplier as it is now (main, or the open head):
  - headings found, one each: AnalyticStacks §§0.4–0.6, 0.9, 0.10, 1.1, 1.5; GeneralAlgebraicKTheory §§3.2, 8.3, 8.10, 10.10, 13.4, 13.5, 13.8; GeneralAlgebraicKTheoryPartII §1.2; SchemeKTheoryOperations §§2.6, 3.1, 3.3, 3.4, 3.8, 6.4, 6.8, 6.11 and Layer 5; KTheoryFiniteLocalFields §§1.5, 1.6, 2.1, 6.5; RefinedTraceMethods §§4.10, 4.20; MotivicEtaleKTheory §2.2; EtaleCohomologyFoundations §§F.2.1, F.2.3, F.3.0; DiamondEtaleCohomology §§C0.19, C0.24, C2.2, C2.12, C4.5, C4.13, C4.14, C6.1, C9.8; DiamondSixOperations §§S2.4, S4.2, S4.3; DiamondsAndVStacks §§D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3; PerfectoidSpaces §§P1.4, P1.19, P1.22, P1.27, P2.3, P2.7, P2.12, P2.13, P3.20; MotivesAndAlgebraicCycles §§4.1–4.3, 4.6, 4.9, 4.11, 4.15, 4.18; AdicCoefficientsAndComparisons Layer L5; ProfiniteCohomology §10.2 and Layer 11; SchemeAndStackFoundations §2.16; CharacteristicClasses §C5 (the Euler integral of `G/T` equals `|W|`, its lines 1378–1382); RepresentationTheory/LieGroups Layer 8 ("Borel-Weil, flag manifolds, and Bruhat"); MorseNovikov (the Lefschetz fixed-point formula, its line 1192); EnhancedDerivedSheaves §§E0.4, E1.3, E2.1, E2.3, E2.4, E2.6, E2.7, E3.2, E3.4 and Layers E5:abstract, E5:presentability, E5:descent, E5:animation, E5:spectra-comparison; TropicalAndBerkovichArithmetic §§0.13, 0.14, 0.16, 0.17, 0.19, 0.20, 0.21, 0.22, 0.25, 2.16.
  - names found in the supplier README: the 21 EnhancedDerivedSheaves names of README:60, `IsCutoffCardinal`, `vTopology_subcanonical`, `Perf.Spd` (44 occurrences in DiamondsAndVStacks; the worker's lead is refuted), `FiniteCor`, `PST`, `ShNisTr`, `smoothAlterationPair`, `classGroupAddEquivLineBundleClass`, `pointedCurvePicard_representable`, `multiplication_isogeny`, `Spectrum`. One name not found: R02.
  - content read: TropicalAndBerkovichArithmetic §0.16 says `ℤ` with its absolute value is initial, and §0.21 covers trivially valued `K`; SchemeKTheoryOperations §2.6 (its line 747) has the vanishing of negative K-groups for regular noetherian schemes; KTheoryFiniteLocalFields §2.1 is rigidity for henselian pairs.
- Declared gaps: the nine slugs agree between the README and `design/plan.json`, each with a named supplier and section. Each `needs` sentence names one construction with its hypotheses. None is provided today: EnhancedDerivedSheaves on main has no Breen–Deligne resolution, no fracture square and no covering-dimension statement, and its §E2.7 says repleteness "is not claimed to suffice"; SchemeKTheoryOperations has no homotopy K-theory and no valuation-ring statement; KTheoryFiniteLocalFields §2.1 has no extension of algebraically closed fields and its §6.5 treats local fields, not `O_C`; TropicalAndBerkovichArithmetic §0.20 has Čech acyclicity for finite modules, not effective descent. GeneralAlgebraicKTheoryPartII declares its own gaps for `KH` on the same supplier section, with the same definition `|K(A[Δ^•])|`: one owner, no conflict.
- The overlap report lists no conflicting head, no dropped id, no revision-only id and no second copy.
- Ownership against open pull requests was checked with `roadmaps grep` at the 477 open heads and on main, by object: "Banach arc", "arc-site of Banach", "ball-invariant", `Dmot(`, "motivic nearby", "arc-stack", `Marc(`, "rigid-analytic motiv", `DM_et`, "tale motiv", "h-motives", "transfer-free", "free motiv": no match. "Berkovich moti" matches only bibliography lines and TropicalAndBerkovichArithmetic's own sections; "motivic K-theory" matches a Morel–Voevodsky representability target of SchemeKTheoryOperations and two prose lines, none of them `Kmot`. This roadmap is the owner of the Banach arc-site, `Deff_mot`, `Dmot`, `Kmot` and `DM_et(k, ℤ)`.

Dependency check output:

```text
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is at line 381 of the merge order.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, VStackSheavesAndLisseCategories, DiamondsAndVStacks, AdicSpacesPartIV; nothing shared. ArcTopologyAndDescent owns the scheme arc-site and this roadmap the Banach arc-site; AnalyticStacks (its line 1302) hands the monodromy-operator identification to this roadmap and owns the comodule description.

### Copyright and arrangement

- **Wording.** 21 passages were set beside Scholze at the locator: the 15 sampled targets and §§0.8, 2.7, 8.5, the routes of §§4.10, 5.3 and the module docstring of `Suggested.lean`. The longest shared runs are theorem statements that can be written one way: 9 words in §2.6 against Scholze line 1356, 9 words in §4.8 against Scholze line 1658, 8 words in §12.3 against Scholze lines 2646–2647. The three-step route of §11.2 has the order of the proof at Scholze 2470–2473, which the argument forces, in different words. §§0.8 and 2.7 have no counterpart in the source, which uses these objects without constructing them.
- **Arrangement.** Scholze's contents (lines 11–28, 284–2587): sections 2–12. Against the layers: `Layer 0 ↔ §§2–3, part of §4, and §0.8 with no counterpart`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cors 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. Not one to one: three splits, one merge, two transfers and two sections of the roadmap's own. The order 0 < 1 < … < 6 and 8 < 9 < 10 < 11 is forced by the *Dependencies* lines; Layers 7 and 8 are parallel, and Layer 12 needs only Layers 0, 4 and 9.
- **Reuse.** No table, figure or list of exercises is taken over. The nine corrections are the roadmap's own computations.

Source independence: 21 passages compared with 1 source (Scholze; CD, Bachmann, vanDerPut and Vakil were outside this round's sample), none shared beyond forced statements of at most 9 words; largest share Scholze, 96 of 116 locators; contents compared with Scholze: independent (order forced by dependencies except the free placement of Layers 7, 8 and 12).

## Not verifiable

- BLR §9.2 (Proposition 3, Example 8, Proposition 10): settled as uncertified; not read and not requested.
- The nine supplier gaps are contracts for future work. Their declaration, owner, hypotheses and present absence from the supplier were checked; their truth was not, except that the replete Postnikov statement is the one Scholze's proof of Theorem 4.20 invokes.
- CD, Bachmann, vanDerPut and Vakil locators were not reread this round; the round-6 table records the lines read for CD and vanDerPut.
- `library-matches.md` and `signatures.md` are empty because the file has no declaration.

## Source issues

- **Gap** in Scholze at §1, p. 4, Lemma 5.11, p. 30, and Corollary 9.6, p. 52: the source says affine spaces, projective lines and analytic spaces are arc-stacks with free motives, without constructing them; it should define the arc-stack of a scheme or analytic space; affects nothing.
- **Gap** in Scholze at Corollary 9.6, p. 52: the source says a smooth analytic space over any Banach field is cohomologically smooth, citing Berkovich's notion, which exists only over nonarchimedean fields; it should give an intrinsic notion for archimedean fields; affects a stated result.

The entries of the earlier rounds' lists (the nine corrections E1–E9 of the README) were not rechecked against the text in this round and are not repeated.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ee4760cc176d86f2c3f9a17f2dbb9cd6b6d597f9", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~7", "model": "fable", "worker": "chris-x88"} -->
