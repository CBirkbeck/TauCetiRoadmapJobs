<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17003#issuecomment-6899969087 -->
Review (claude) of fb0bf80

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The four findings of round 1 are repaired, the repaired passages and the rest of the package
survive the adversarial pass, `packages/NashBlowups/Suggested.lean` elaborates with `sorry` as its only
warning, the dependency check is clean and every library and cross-roadmap citation resolves at the pins
and at the current heads. Maintainer notes: none. Declared supplier gaps: none (README, "No gap is
recorded"; `design/plan.json` has `gaps = []`), so the acceptance is unconditional.

## Round 1 findings, one by one

| Id | Status | Repaired passage (as it stands now) |
|---|---|---|
| F01 (fibre of `y² = x²z`) | repaired | §2.2, second Check: "`X* ≅ Bl_0 𝔸²_{u,v}` … the reduced fibre `ν⁻¹(0)_red ≅ ℙ¹` … The scheme-theoretic fibre is not `ℙ¹`: it is cut out by `(u, v²)`"; Layer 2 Examples: "the reduced fibre `ν⁻¹(0)_red ≅ ℙ¹` (nobile1975, Example 4, lines 319–324)". |
| F02 (`isIso_lift_iff` without route) | repaired | §2.4: "for `X` in the Setting, a surjective `π : X₁ → X` … Route (the statement is this roadmap's own): … `IsClosedImmersion.comp_iff` … `isIso_of_isClosedImmersion_of_surjective`"; the `*Needs:*` line now lists §§1.2, 1.3, 2.1, 2.2 and both lemmas. |
| F03 (two unrecorded works credited) | repaired | Scope: "(§1.2; nashModificationNotes2024, Section 3)"; §2.4: "(nashModificationNotes2024, Section 2, lines 153–162; §1.3)". No personal attribution to an unrecorded work remains in the README. |
| F04 (printed page of the Alper locator) | repaired | §0.4: "lines 2985–3007, printed p. 62"; the same wording in the `cited_for` string of `alperModuli` in `packages/NashBlowups/sources.toml`. Checked: folio 61 at alperModuli line 2975, Theorem 1.4.5 at line 2979, folio 62 at line 3020. |

The repair commit changes only these passages (36 lines of the README, one string of the manifest);
`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## Verified sound

**Adversarial pass on the repaired text, and the repaired patterns elsewhere.**

- F01 pattern (a scheme-theoretic fibre called `ℙ¹`): recomputed every fibre claim. §0 Examples, fibre of
  `Gr_1(Ω)` of the cusp over the origin: `Ω ⊗ κ(0) = k²`, so `ℙ¹_k`, reduced. §1.2 Check 2: `F ⊗ κ(0) = k²`,
  `ℙ¹_k`. §§1.2, 1.3, 1.5 exceptional fibres of blowups of regular points: `Proj gr_m = ℙ^{r−1}`, reduced.
  §6.1 "has a `ℙ¹` over the origin": a statement about the support. None needs a change.
- F02 pattern (an own statement with neither locator nor route): every `Prove`/`Define` paragraph has a
  source locator, a route, or both (§0.3 openness from pinned inputs; §1.1 locators and "Route for (1)";
  §7.1 induction from §§2.5 and 6.4; §7.2 route through §§2.4, 2.6, 6.3).
- F03 pattern (a credited work missing from the manifest): the names left in the README are Hironaka and
  Spivakovsky (`hironaka1983`, `spivakovsky1990`), Nobile (`nobile1975`), Seidenberg (cited to `hamann2003`),
  Kunz (EnhancedDerivedSheaves §E1.6), Duarte and Núñez-Betancourt, Castillo et al. (both recorded), and
  Plücker, Gauss, Whitney, Serre as names of objects. The manifest's `cited_for` strings of
  `nashModificationNotes2024` still describe two passages by the names the notes use for them; they
  describe the source, the `teissier1982` entry's `version_note` says which work is meant, and no README
  statement leans on them. A remark, not a finding.
- F04 pattern (printed pages): the README has no other printed-page locator.

**Adversarial table** (values computed by me this round; the sampled targets, the headline theorems and the
repaired passages).

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | §2.2 Check, `y² = x²z`, char `≠ 2` | charts `u = vw`, `v = us`; Gauss map on the normalisation | `(u, uv, v²)` satisfies `y² = x²z`; partials `(−2xz, 2y, −x²)` pull back to `u·(−2v², 2v, −u)`, base ideal `(u, v)`; chart 1: `[−2v : 2 : −w]` recovers `v, w`; chart 2: `[−2us² : 2s : −1]` with `x = u` recovers `u, s`: closed immersion, `X* ≅ Bl_0 𝔸²`. Fibre ideal `(u, v²)`: `(vw, v²) = (v)·(w, v)`, `v` nilpotent and nonzero; `(u)` reduced | holds as repaired |
| 2 | §2.4 `isIso_lift_iff` | `𝔸¹ ⊔ 𝔸¹` with one line; cusp/ℚ with `𝔸¹`; `Bl_0 𝔸² → 𝔸²`; `X = ∅` | one line: classifying map closed, image misses the other line, lift not iso (π not surjective); cusp: `k[t², t³, 3t/2] = k[t]`, closed immersion, lift iso; blowup: lift `= π`, not injective, both sides false; `∅`: both true. Route: `ν(q(y)) = π(y) = ν(z)` and `ν` injective over `X_sm` give `q(y) = z`; `comp_iff` at the pin needs only `[IsClosedImmersion g]` | holds, both directions |
| 3 | §0.1 comparison map | `t ↦ (t², t³)` in char 0 and 2; identity; closed point of `𝔸¹` | `dx ↦ 2t dt`, `dy ↦ 3t² dt`; char 2: `0`, `t² dt`; `dx ↦ dx` (zero map excluded by `c_f(f*dh) = d(f*h)`); `k·dx → 0` surjective, not injective | holds |
| 4 | §0.3 `X_sm^{(d)}` | `𝔸² ⊔ 𝔸¹`; cusp/ℚ; `k[ε]/(ε²)` | `X_sm^{(2)} = 𝔸²`, `X_sm^{(1)} = 𝔸¹`, `X_sm^{(0)} = ∅`; complement of the origin; fibre of `Ω` is `k·dε` (rank 1) with `X_sm = ∅` | holds |
| 5 | §0.7 predicate | `∅`; `𝔸¹`, `d = 0, 1, 2`; `k[ε]/(ε²)`; cusp/𝔽₂ and /ℚ; `𝔸²`, `d = 1`; node | true for all `d` (`E = 0`); true, true, false (`1 < 2`); `d = 1` iff char 2 (`Ω = k·dε` of length 1 against `k[ε]` of length 2 otherwise); `d(y² − x³) = x² dx` in char 2, `dy ↦ 1` works, `c·x² = 0 ⇒ c = 0`; over ℚ `b = (3t/2)a`, no unit; kernels `O dy ≠ O dx`; `ya + xb = 0` forces `a ∈ (x)`, `b ∈ (y)` | definition determines the notion; "`Ω` locally free" excluded by cusp/𝔽₂ |
| 6 | §1.1 setting | `𝔽_p(t)[y]/(y^p − t)`; `k[ε]/(ε²)`; `𝔸² ⊔ 𝔸¹`; reduced `X` with dense `X_sm` | field, `Ω = K·dy ≠ 0`, `X_sm = ∅`, not geometrically reduced; not reduced; `X_sm ≠ X_sm^{(2)}`. Forward: associated points of `X_{k'}` lie over generic points of `X`, inside `(X_sm)_{k'}`, reduced. Converse: `p` bijective, `W' = p⁻¹(p(W'))`, descent of smoothness | holds, both directions; reducedness of `X` is used |
| 7 | §1.2 Nash modification | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`; ideal of `0 ∈ 𝔸²` | section with closed image, `N ≅ X`; `Proj k[x][A, B]/(xB)`, closure of `[1 : 0]` over `D(x)` is `V(B) ≅ X`, fibre of `Gr_1` is `ℙ¹`; `Proj Sym(x, y) =` blowup, fibre `ℙ¹` | holds; whole Grassmannian excluded |
| 8 | §1.3 universal property | identity of `X`; `Spec k →` origin with `(a, b) ↦ b`; `Bl_p X → X`, `r ≥ 2` and `r = 1` | `q = π_N⁻¹`; point `[0 : 1] ∉ N = V(B)`, `h⁻¹(U) = ∅`; `q = h` not iso; `m_p` invertible, `Bl_p X = X` | holds; density needed |
| 9 | §1.5 locality, flat base change | `V ⊆ U`; `g = U ↪ X`; `g = {0} ↪ 𝔸²` | `π_N⁻¹(V) ≅ V`; both sides `U`; `I ⊗ k = k²`, `N({0}, k², 1, ∅) = ∅` against fibre `ℙ¹` | holds; flatness needed |
| 10 | §2.1 Nash blowup | smooth; cusp char 0/≥5; node; `Spec k`, `d = 0` | `ν` iso, `L = Ω`; `ν*Ω = k[t]dx ⊕ k[t]e/(t³e)` with `e = 2dy − 3t dx`, quotient `[1 : 3t/2]`; `J = (x, y)`, `X* = 𝔸¹ ⊔ 𝔸¹`; `X* = X` | holds |
| 11 | §3.3 hypersurfaces | cusp in char 0/≥5, 2, 3; node; `x^p − y^q` in char `p`; `n = 0`; `n = 1`, `f = x` | `(2y, 3x²) = (y, x²)`, `(x²)`, `(y)`; `(x, y)`; `f_x = 0`, `f_y = −q y^{q−1}`, principal nonzerodivisor, curve `t ↦ (t^q, t^p)` singular for `p, q ≥ 2`; `J = 0`, `Bl = ∅ ≠ Spec k`; `J = (1)`. Sign: `df ∧ dx_1…^j…dx_n = (−1)^{j−1} ∂_j f · dx_1 ∧ … ∧ dx_n` | holds; `n ≥ 1` needed |
| 12 | §4.4 / `…_of_charZero` | `∅`; cusp/ℚ; node/ℚ; `ℚ[ε]/(ε²)`, `d = 0`; `𝔸² ⊔ 𝔸¹`, `d = 2`; cusp/𝔽₂ | both true; both false; both false; right true, left false (reducedness); left true, right false (pure dimension); right true, left false (characteristic). Route step 4: `∂_i g(x) = (∂g/∂X_i)(x)`, a stable prime contracts to `0`, `trdeg κ(P) ≥ d`, `P` minimal, `M_P = 0` against `P ⊇ Ann M` | holds; every hypothesis used |
| 13 | §4.5 Nobile's theorem | cusp/ℚ; node; cusp char 2 | singular, `ν` not iso; `X* = 𝔸¹ ⊔ 𝔸¹ ≠ X`; singular with `ν` iso | holds; characteristic needed |
| 14 | §5.1 `p`-monomial operators | `d = 1`, `p = 2`; `d = 1`, `p = 3`; `d = 0`; cusp char 3 | `φ_0 = id − x∂`, `φ_1 = ∂`; `M⁻¹ = [[1, −x, x²], [0, 1, −2x], [0, 0, 1]]`, `φ_0(x²) = x² − 2x² + x² = 0`, without `1/α!` the diagonal entry is `2`; `φ_∅ = id`; orders of `Σ r_i³ x^i` are `≡ 0, 2, 1 mod 3` with `ord r_i³ ∈ {0, 6, 9, …}`, never `3`. `∂_d^{α_d}(x^β)` uses only `∂_i(x_j) = δ_ij` | holds; no commutation needed |
| 15 | §5.3 route, step 3 | `ρ_Q ∘ ψ_Q` | `ρ(Σ r_α^p x^α) = Σ_γ σ(r_γ^p) e_γ = Σ r_γ e_γ`; surjection of free modules of rank `p^d` | holds |
| 16 | §5.4 / `…_of_isNormalScheme` | `d = 0`; cone `z² = xy`, `p = 2`, `d = 2` and `d = 1`; `𝔽₂[ε]/(ε²)`; `x^p + y² + t` over `𝔽_p(t)` | both true; `d = 2`: `ya + xb = 0` with a unit coordinate forces `y ∈ (x)`, false in `k[y, z]/(z²)`, both false; `d = 1`: `dz ↦ 1` exists, singular (pure dimension `d` needed); right true, left false; `Ω = (R dx ⊕ R dy)/(2y dy)`, `dx ↦ 1`, regular not smooth | holds; every hypothesis used |
| 17 | §6.1 normalised Nash blowup | cusp char 0, 2; node; `y² = x²z` in char `≠ 2` and `2` | `𝔸¹`, `𝔸¹` (with `X* ≅ X`); `η = id`; `X̄* = X* = Bl_0 𝔸²`; char 2: partials `(0, 0, x²)`, `J = (x²)`, `X* = X` | holds |
| 18 | §6.3 separable base change | `ℚ(i)`; `ℚ(u)`; `x^p + y² + t`, `k' = k(t^{1/p})` | `𝔸¹_{ℚ(i)}`; `𝔸¹_{ℚ(u)}`; `u^p + y² = 0`, `s ↦ (−s², s^p)`: `−s^{2p} + s^{2p} = 0` for odd `p`, `x = −s² − t^{1/p}`, bijective and not iso | holds; separability needed |
| 19 | §6.4 criteria for `ν̄` | cusp char 2; smooth; regular curve over `𝔽_p(t)` | `ν` iso, not normal, `ν̄` not iso; both iso; `ν̄` iso, not smooth. Route: `ν ∘ (η ∘ ν̄⁻¹) = id` | holds, both directions |
| 20 | §7.3 never-resolves | `m = 0`; cusp char 2, `m = 1`; smooth `X` | hypothesis trivial, conclusion false for cusp/ℚ; no `X^{(i)}` smooth, `Y_1 = 𝔸¹`; hypothesis fails. Induction: `Y_{2m} ⊇` open `≅ Y_m ⊇` open `≅ X` | holds; `m ≥ 1` needed |
| 21 | Convention: quotients | line `y = 2x`; §0.4 Check 1; §3.1 cusp char 3 and 2 | `[1 : 2]` (conormal: `[2 : −1]`); `[1 : 0]`; `[1 : 0]`, `[0 : 1]` | consistent in all four places |

Sections outside the sample (§§0.2, 0.4–0.6, 2.3, 2.5–2.7, 3.1, 3.2, 4.1–4.3, 5.2, 6.2, 7.1, 7.2) were
recomputed as well and agree with the round 1 table (rows 4–8, 11–19 there): for instance §0.2 Check 2
(`Ω_{X'/k}` free on `dτ, du`, `dy ↦ dτ + du`, against `du` over `k'`), §4.2 (`D(a⊗b − ab⊗1) = ∂a·db + a·d(∂b)`),
§4.3 (`x²∂y ∈ J ⇒ (x∂y)² ∈ J`), §3.1 (`3/2 = 4` in `𝔽_5`).

**Sources: the seeded sample.** All 15 sampled targets read at their locators in the cached texts:
§0.1 stacksNormalization line 2900 (Lemma 33.8, 01UV); §0.3 stacksAlgebra line 17618 (Lemma 140.3, 00TT, items
(1)–(3) at 17621–17623); §0.7 nashModificationNotes2024 lines 170–171 and 179–181, duarteNunezBetancourt2020
lines 152–156, stacksAlgebra lines 905 (0583) and 4466 (00L2); §1.1 stacksVarieties lines 2112 (056V, reduced
`X`, as the target says), 2084 (056T), 296 (04KS); §1.2 nashModificationNotes2024 lines 216–225,
gonzalezSprinberg1982 lines 85–90; §1.3 nashModificationNotes2024 lines 226–229 and 153–162,
gonzalezSprinberg1982 lines 94–98; §1.5 stacksNormalization lines 421 (01R8, item (3)) and 2198 (081I);
§2.1 gonzalezSprinberg1982 lines 79–98, duarteNunezBetancourt2020 line 127, castilloDuarteLeytonLiendo2026
lines 13–21; §2.4 nashModificationNotes2024 lines 153–162; §3.3 nobile1975 lines 129–133 and 136–141
(the source's curve `y² − x^q` in characteristic `q`), castilloDuarteLeytonLiendo2026 lines 33–35;
§4.5 nobile1975 lines 143–146 and 60, nashModificationNotes2024 line 143, duarteNunezBetancourt2020 lines 136
and 140–141; §5.1 duarteNunezBetancourt2020 lines 271–283, nashModificationNotes2024 lines 394–407;
§6.1 castilloDuarteLeytonLiendo2026 lines 20–21, gonzalezSprinberg1982 lines 60–69, stacksNormalization lines
6498 (035N) and 6521 (035P); §6.3 stacksNormalization lines 6332 (035K), 6566 (035Q(3)), 6636 (0H7D),
stacksVarieties line 2256 (0C3N); §6.4 nashModificationNotes2024 lines 515–517, stacksNormalization line 6636.
Numbers, tags and hypotheses agree; where a source is narrower (algebraically closed field, varieties, one
direction) the README says so and gives its own route. Beyond the sample: stacksNormalization 2918, 2926,
2953, 6570; stacksVarieties 1049, 1064, 2130; stacksAlgebra 4671, 15590, 17647, 17720–17726, 21510, 21516;
hamann2003 56–64; nobile1975 29, 42–44, 105, 202–203, 314–324; castilloDuarteLeytonLiendo2026 58–67;
alperModuli 2975–3020. The author flagged no locator as unverified. All 15 manifest entries cover every
work the README cites.

**Elaboration.** `lake env lean` on `packages/NashBlowups/Suggested.lean` from the content checkout:
`declaration uses sorry` at lines 71 and 87, nothing else. `import Mathlib` and four `TauCeti.*` modules,
each used; no `set_option`, no sorry'd data, no `lemma`, one module docstring, a docstring on each of the
3 declarations.

**Signatures.** `#check @name` for the 3 declarations in one scratch file: the definition takes `k`
(`CommRing`), `X` over `Spec k`, `d : ℕ`; the first theorem `Field`, `CharZero`, `IsReduced`,
`LocallyOfFiniteType`, `IsPureDimensional d`; the second `Fact p.Prime`, `CharP k p`, `PerfectField`,
`IsNormalScheme`, `LocallyOfFiniteType`, `IsPureDimensional d`. They equal README §§0.7, 4.4, 5.4; no
binder is lost; nothing changed.

**Padding probe (both sorried theorems).** Ten tactics each on a scratch copy (`simp`, `rfl`,
`infer_instance`, `exact Iff.rfl`, `simp [HasLocallyFreeQuotientOfDifferentials]`,
`constructor <;> intro h <;> infer_instance`, `aesop`, `decide`, `tauto`, and an `exact` with the identity
quotient): 20 attempts, 20 failures. Neither restates a definition, mirrors a Check or treats a boundary
case; the one `def` has a real body on pinned carriers.

**Headline theorems** (README Summary): triviality criterion §2.5; Nobile's theorem §4.5; Duarte and
Núñez-Betancourt §5.4; criteria for `ν̄` §6.4; never-resolves principle §7.3; with them the blowup and
hypersurface descriptions §§3.2–3.3. Each needs `ν : X* → X`, and the module docstring names each with the
missing carrier (the Grassmannian of a quasi-coherent sheaf on a non-affine base;
`Module.Grassmannian.scheme`, `TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`, is over an affine
base). The two differential forms, which need no `ν`, are stated. No statable headline is absent, none goes
through a stand-in. The 3 backticked names the README gives as its own are the 3 declarations; the other
own names are italic, as the Conventions say.

**Library declarations at the pins.** All 41 fully written file paths the README cites exist; every backticked
library name of the README occurs at the pins (a sweep of its 165 backticked identifiers leaves only this
roadmap's names, other roadmaps' names, source keys and mathematical symbols). Opened this round, with file and line:
`IsClosedImmersion.comp_iff` (`Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:242`, `[IsClosedImmersion g]`
only); `isIso_of_isClosedImmersion_of_surjective` (`…/Morphisms/ClosedImmersion.lean:409`);
`ext_of_isDominant_of_isSeparated` (`…/Morphisms/Separated.lean:289`, `[IsReduced X]`);
`Smooth` (`…/Morphisms/Smooth.lean:59`), `Scheme.Hom.smoothLocus` (300, stalk map formally smooth, needs
`LocallyOfFinitePresentation`), `dense_smoothLocus_of_perfectField` (361); `Scheme.Hom.support_ker`
(`…/IdealSheaf/Basic.lean:844`, quasi-compact); `Hom.image` (`…/IdealSheaf/Subscheme.lean:658`);
`normalizationDesc` (`Mathlib/AlgebraicGeometry/Normalization.lean:371`), `normalizationPullback` (576) with
the instance for smooth `g` (598); `Algebra.IsTranscendentalSeparable`
(`Mathlib/FieldTheory/TranscendentalSeparable.lean:72`); `KaehlerDifferential.tensorKaehlerEquiv`
(`Mathlib/RingTheory/Kaehler/TensorProduct.lean:238`, `B ⊗[A] Ω[A⁄R] ≃ Ω[B⁄S]`);
`KaehlerDifferential.kerCotangentToTensor` (`Mathlib/RingTheory/Kaehler/Basic.lean:801`);
`TauCeti.IsPureDimensional` (`TauCeti/Topology/PureDimension.lean:52`: every irreducible component has
Krull dimension `d`; no nonemptiness, no finiteness); `FiniteLocallyFreeSheaf.FixedRank`
(`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:71`, a full subcategory by constant rank);
`IsModification` (`…/Morphisms/Modification/Basic.lean:53`, proper, dense open with dense preimage, no
integrality); `IsNormalScheme` (`…/Scheme/Normal.lean:84`), `isDiscreteValuationRing_stalk` (203, locally
Noetherian); `IsRegular.isNormal` (`…/Scheme/Regular/Scheme.lean:175`); `LinearMap.bijective_of_depth`
(`TauCeti/RingTheory/Depth/Bijectivity.lean:120`, Noetherian ring, no finiteness of the source);
`kerCotangentToTensor_bijective_of_formallyEtale` (`TauCeti/RingTheory/Kaehler/Conormal.lean:76`);
`powRingHom_finite` (`TauCeti/Algebra/CharP/Frobenius/Finite.lean:62`, perfect `R`);
`relativeDifferentialsStalkEquiv` (`…/Differentials/Stalk.lean:288`); `relativeDifferentialsHomEquiv`
(`…/Differentials/Basic.lean:101`); `isFiniteLocallyFree_relativeDifferentials`
(`…/Differentials/LocallyFree.lean:54`, smooth over `Spec R`); `isIso_normalizationDesc_iff`
(`…/Normalization/IsIso.lean:114`); `isPureDimensional_pullback_Spec_map_iff_of_field`
(`…/Scheme/KrullDimension.lean:263`); `blowup_hom_ext`, `blowupLift`
(`…/Blowup/UniversalProperty.lean:297, 372`), `isIso_blowupToBase_iff` (`…/Blowup/ExceptionalDivisor.lean:203`).

**Cross-roadmap citations resolved now.** On main: SchemeAndStackFoundations §0.7 (README line 1049), §0.11
`field_extension_descent` (1372), §0.17 (1669), §0.23 (2163), §0.30 (2681), §4.11 `IsModification.Witness`
(6839), §4.13 `regularLocus_eq_smoothLocus` (6987), all also present at the head of the open revision that
touches that roadmap; EnhancedDerivedSheaves §E1.6 `isRegular_of_frobenius_flat` (line 800; kept at both
open revisions of that roadmap); ResolutionOfSingularitiesCharacteristicZero §2.15 (510);
DiophantineApproximationAndTranscendence §5.6 `lieDerivativeOneForm`, `exists_lieDerivativeOneForm`
(3692–3693). At open heads, both new roadmaps earlier in the merge order:
AlgebraicModuliForArithmeticGeometry §1.3 `coherentGrassmannian` (line 612: arbitrary base, universal
quotient, unique classifying maps, base change, `Gr_1 ≅ P`, properness over `Spec R`, the affine-points
bullet) and `plucker` (663), §5.4 `DMNormalization.stack` (8677, with the scheme case as Mathlib's
normalisation of the generic points), `DMNormalization.finite` (8701), `DMSchematicClosure.stack` (8711,
`Scheme.Hom.image`, flat base change); DerivedDeRhamCohomology §0.23 (line 451: the two-sided statement in
prose, and `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` at 472). The worker's two
unresolved names are these two; they resolve there.

**Supplier order.** Output of the dependency check: `depcheck: 246 roadmaps, 2244 edges, 0 problem(s)`. No
UPWARD or CYCLE line. Every `*Needs:*` line names a section of this roadmap, a pinned declaration or one of
the six suppliers; none is on the never-cite list; no supplier drift.

**Duplication audit.** By object, over main, the open heads and the pins: Nash blowup or modification (the
only hits are Nash functions of real algebraic geometry and De Giorgi–Nash–Moser); Seidenberg's lemma on
derivations (hits are Tarski–Seidenberg and hyperplane sections); the Lie derivative on Kähler differentials
(DiophantineApproximationAndTranscendence §5.6 only, for fields of characteristic zero, cited); freeness of
the Frobenius pushforward (none); the Stacks tags of Layer 0 (01UV, 01UX, 01V0, 01UZ, 0C3M, 0C3N, 0B8X, 056V,
06DF, 0C30, 00TT: none); a pullback or base-change map of `relativeDifferentials`, geometric normality,
`IsTranscendentalSeparable` in Tau Ceti (none). No declaration of `Suggested.lean` has the name of a
declaration in another roadmap. The overlap list has no changed, dropped or revision-only id and no second
copy; ownership against the open pull requests was checked through the roadmap search over their heads.

Overlap check: read SchemeAndStackFoundations, AbhyankarLemma, ResolutionOfSingularitiesCharacteristicZero,
PurityOfBranchLocus, LogPluricanonicalForms, DirectSummandsAndBigCohenMacaulay; nothing shared
(modifications, regular schemes and Serre's criterion are SchemeAndStackFoundations', the derivative ideal is
ResolutionOfSingularitiesCharacteristicZero's; this roadmap cites them and owns none).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build,
Layers 0–7 each ending with Examples and Dependencies, Downstream consumers, References. Every definition has
an API list and at least three Checks; every theorem its hypotheses and a locator or route. The layers are
the roadmap's own: the sheaf-level modification before the Nash blowup, the two smoothness criteria
independent of Layers 3, 6, 7, and the order is the one the `*Needs:*` lines force. No LaTeX delimiters, no
process words, pull-request numbers, dates, anchors or machine paths in the README or the Lean file.

**Copyright.** Wording set beside the source at each locator of the sample and at eight further passages
(§1.2 construction against nashModificationNotes2024 216–225; §2.4 against 157–160; §5.1 against
duarteNunezBetancourt2020 271–279; §6.2 against stacksNormalization 6570–6572; §4.3 route against hamann2003
58–64; §7.3 against castilloDuarteLeytonLiendo2026 58–67; §1.1 against stacksVarieties 2112–2114; the second
theorem's docstring against duarteNunezBetancourt2020 256–257): what is shared is formulas and statements
that can be written one way (`πq = h`, `q*L = M`, `x²∂y ∈ J`). Arrangement: nashModificationNotes2024 runs
definition, basic results, the sheaf construction, a further section, the normal case, the toric case, a
last section; the roadmap puts the sheaf construction (its Section 3) before the variety case (its Sections
1–2), has no layer for three of its sections and draws Layers 3, 6, 7 from other sources. No table, figure
or list of examples is taken over.

Source independence: 40 passages compared with 10 sources, none shared; largest share
nashModificationNotes2024, 22 of 100 mentions of a source in the README; contents compared with
nashModificationNotes2024: independent.

## Not verifiable

- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: recorded as uncertified, cited as
  background by locator only; no text read. No statement or route depends on them.
- Printed pages of the Stacks chapters: the README cites tags and lemma numbers, which were checked, and no
  printed pages.
- The journal numbering of `duarteNunezBetancourt2020` and `castilloDuarteLeytonLiendo2026`: the README cites
  the arXiv versions read, and the manifest says so.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, p. 10: the source says the Nash modification of a
  normal variety in characteristic `p` is an isomorphism iff the variety is singular; it should be iff it is
  nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, p. 13: the source says the normalised higher Nash
  modification is an isomorphism iff the variety "is an isomorphism"; it should be iff the variety is
  nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Propositions 2.2 and 2.3, pp. 4–5: the same proposition, with
  its introductory paragraph, is printed twice under two numbers; it should appear once; affects nothing.
- **Misprint** in hamann2003 at Lemma 0.1, proof, p. 2: the source says the radical `J` itself is the
  annihilator of an element outside `J`; it should be that the minimal prime `P` equals `(J : x)` for such an
  `x`; affects the proof.
- **Misprint** in stacksAlgebra at Example 10.140.8 (tag 00TY): the source writes the curve over `𝔽_p(t)` as
  `x^p + y² + α` with an undefined `α`; it should be `x^p + y² + t`; affects nothing.
- **Misprint** in nobile1975 at Example 1, p. 300: the source says the Jacobian ideal is the centre "by
  Remark 1", which only fixes notation; it should refer to Remark 2; affects nothing.
- **Misprint** in castilloDuarteLeytonLiendo2026 at the Introduction, first paragraph, p. 1: the source writes
  the normalised Nash blowup map as the normalisation applied after `ν`; it should be the composite `ν ∘ η`,
  normalisation first; affects nothing.

## For the human reviewers

- **Scope.** The differential smoothness criteria are stated for reduced (not necessarily irreducible) schemes
  over any field of characteristic zero or perfect field; nobile1975 and duarteNunezBetancourt2020 state them
  for varieties over algebraically closed fields. The wider form rests on the README's routes (§§4.4, 5.3).
- **Licence.** `alperModuli` has `licence_class = "author-page"` in `packages/NashBlowups/sources.toml`: a
  dated draft on the author's university page, an unpublished manuscript, cited for one proof step (§0.4).
- **Licence.** `nashModificationNotes2024`, the source with the largest share of locators, is an arXiv
  preprint of survey notes; no journal version found. Its main statements are also cited from refereed papers.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fb0bf809f30b07ed9f30811ddb87b371cea2b6e6", "job": "REV-PKG-NashBlowups~2", "model": "fable", "worker": "chris-x90"} -->
