<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17003#issuecomment-6899339542 -->
Review (claude) of 57c3d2d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the fibre of the Nash blowup of `y² = x²z` is not `ℙ¹` as a scheme

   - **Location:** `packages/NashBlowups/README.md` lines 823–824 (§2.2, second Check): "`ν⁻¹(0) ≅ ℙ¹`: `ν` is proper but
     not finite"; repeated at lines 951–952 (Layer 2, Examples): "`ν⁻¹(0) ≅ ℙ¹` (nobile1975, Example 4)".
   - **Claim:** the fibre of `ν` over the origin of the surface `y² = x²z` (characteristic `≠ 2`) is isomorphic to `ℙ¹`.
     Everywhere else the roadmap writes `ν⁻¹(·)` for the scheme-theoretic preimage.
   - **Witness:** with `x = u`, `y = uv`, `z = v²`, `J_f = (xz, y, x²)` pulls back to `u·(u, v)`, so `X* = Bl_0 𝔸²_{u,v}`
     (as nobile1975 lines 320–324 say). The ideal `(x, y, z)` becomes `(u, v²)`; in the chart `u = vw` it is
     `(vw, v²) = (v)·(w, v)`, and `v` is a nonzero nilpotent of `k[v, w]/(vw, v²)` at `v = w = 0`. The fibre is `ℙ¹` with an
     embedded point; only its reduction is `ℙ¹`. The source (nobile1975 line 319) speaks of varieties, that is, of the
     reduced fibre.
   - **Repair:** in both places write "the reduced fibre `ν⁻¹(0)_red ≅ ℙ¹` (the scheme-theoretic fibre, cut out by
     `(u, v²)` on `X* = Bl_0 𝔸²_{u,v}`, has an embedded point): `ν` is proper but not finite". Tested on the chart above:
     the radical of `(vw, v²)` is `(v)`, the exceptional line. §6.1 (line 1386, "has a `ℙ¹` over the origin") needs no change.

2. **F02** (P3) `nashBlowup.isIso_lift_iff` has neither a locator nor a route

   - **Location:** `packages/NashBlowups/README.md` lines 856–859 (§2.4): "Prove *nashBlowup.isIso_lift_iff*: for a
     surjective `π : X₁ → X` with `X₁` reduced … the lift `X₁ → X*` is an isomorphism iff the classifying map … is a closed
     immersion."
   - **Claim:** every theorem carries a locator or, for a statement of the roadmap's own, a route with its inputs. This is
     the one target of the README with neither (every other own statement, for instance §§0.7, 2.6, 7.2, has a route).
   - **Witness:** lines 856–859 contain the statement and the counterexample for non-surjective `π` only; the `*Needs:*`
     line 870 lists `IsClosedImmersion` but not the lemma the proof uses. The statement itself is true (row 9 of the table).
   - **Repair:** append to the paragraph: "Route (the statement is this roadmap's own): by §2.4 the classifying map is the
     lift followed by the closed immersion `X* → Gr_d(Ω_{X/k})`, so it is a closed immersion iff the lift is. A closed
     immersion `X₁ → X*` has closed image containing `σ(X_sm)`, because `π` is surjective and `ν` is bijective over `X_sm`;
     so it is surjective onto the reduced `X*` and an isomorphism (`isIso_of_isClosedImmersion_of_surjective`)." Add Mathlib
     `isIso_of_isClosedImmersion_of_surjective` to the `*Needs:*` line of §2.4. Tested on the README's own instance
     `X = 𝔸¹ ⊔ 𝔸¹`, `X₁` one line: the image misses `σ` of the other line, exactly the step that uses surjectivity.

3. **F03** (P3) two works are credited that the manifest and the References do not record

   - **Location:** `packages/NashBlowups/README.md` line 29: "(§1.2, after Oneto–Zatini as presented in Nobile's notes)";
     line 853: "(nashModificationNotes2024, Section 2, lines 153–162, Teissier's formulation; §1.3)".
   - **Claim:** every cited work is recorded in `sources.toml`.
   - **Witness:** nashModificationNotes2024 lines 734 and 742 give these as its references 17 (Oneto and Zatini, *Remarks
     on Nash blowing-up*) and 21 (Teissier, *The hunting of invariants in the geometry of discriminants*). Neither is in
     `packages/NashBlowups/sources.toml`; the only Teissier entry there and in the References (README line 1610) is
     `teissier1982`, *Variétés polaires II*, another work, so "Teissier's formulation" points a reader to the wrong text.
   - **Repair:** drop the two attributions and keep the locators that were read: line 29 becomes "(§1.2;
     nashModificationNotes2024, Section 3)" and line 853 becomes "(nashModificationNotes2024, Section 2, lines 153–162;
     §1.3)". (Alternative of equal standing: record both works in `sources.toml` as cited through the notes, with their
     own keys, and list them in the References.) No statement depends on either.

4. **F04** (P3) printed page of the Alper locator

   - **Location:** `packages/NashBlowups/README.md` lines 468–469 (§0.4): "alperModuli, proof of Theorem 1.4.5, lines
     2985–3007, printed pp. 61–62"; the same range in `packages/NashBlowups/sources.toml` line 251 (`cited_for`).
   - **Claim:** the proof read lies on printed pages 61–62.
   - **Witness:** alperModuli line 2975 is the printed folio 61 closing the page before §1.4.3; Theorem 1.4.5 is stated at
     line 2979 and the lines cited, 2985–3007, all precede the folio 62 at line 3020. The proof is on printed p. 62 only.
   - **Repair:** write "printed p. 62" in both files (in `sources.toml` only the text of that `cited_for` string changes;
     no entry is removed or re-keyed).

Four findings, all P3 (0 P1, 0 P2). The mathematics of every statement I recomputed is sound, `Suggested.lean`
elaborates with `sorry` as its only warning, the dependency check is clean, and every library and cross-roadmap
citation resolves. The four repairs are small edits to `packages/NashBlowups/README.md` (one also touches
`packages/NashBlowups/sources.toml`); a package is accepted only with nothing to repair.

Previous review: none (round 1). Maintainer notes: none. Declared supplier gaps: none (README, "No gap is recorded").

## Verified sound

**Elaboration.** `lake env lean` on `packages/NashBlowups/Suggested.lean` from the content checkout: two warnings,
`declaration uses 'sorry'` at lines 71 and 87, nothing else. One `import Mathlib` plus four `TauCeti.*` modules, each
used (`relativeDifferentials`, `IsNormalScheme`, `FixedRank`, `IsPureDimensional`); no `set_option`, no sorry'd data, no
`lemma`, one module docstring in the required form, a docstring on each of the 3 declarations.

**Signatures.** I compared the elaborated types in the worker's signature list (3 declarations) with README §§0.7, 4.4
and 5.4: the definition takes `k` a commutative ring, `X` over `Spec k` and `d`; the first theorem carries `Field`,
`CharZero`, `IsReduced`, `LocallyOfFiniteType`, `IsPureDimensional d`; the second `Fact p.Prime`, `CharP k p`,
`PerfectField`, `IsNormalScheme`, `LocallyOfFiniteType`, `IsPureDimensional d`. No binder is lost; the generality
equals the README's.

**Padding probe (both sorried theorems, all of them).** On scratch copies I replaced `sorry` by `simp`, `rfl`,
`infer_instance`, `exact Iff.rfl`, `aesop`, `constructor <;> intro h <;> infer_instance` and
`simp [HasLocallyFreeQuotientOfDifferentials]`: 7 probes, 14 attempts, all fail (no progress, type mismatch, instance
not found, unsolved goals). Neither theorem restates a definition, mirrors a Check or treats a boundary case. The one
`def` has a real body on native carriers. Nothing is padding.

**Headline theorems** (README Summary): (1) triviality criterion §2.5; (2) Nobile's theorem §4.5; (3) Duarte and
Núñez-Betancourt §5.4; (4) criteria for `ν̄` §6.4; (5) never-resolves principle §7.3; (6) the blowup description and the
hypersurface case §§3.2–3.3. All six need `ν : X* → X`; the module docstring names each and the missing carrier (the
Grassmannian of a quasi-coherent sheaf on a non-affine base with classifying maps). I confirmed at the pin that
`Module.Grassmannian.scheme` (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`) is over an affine base with
points on affine schemes only (`schemeHomEquiv`, `…/Grassmannian/Points.lean:405`). The differential forms of (2) and
(3), which need no `ν`, are stated. No statable headline is absent and none is forced through a stand-in.

**Adversarial table** (values computed by me).

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | §4.4 / `…_of_charZero` | `X = ∅`; cusp/ℚ; node/ℚ; `ℚ[ε]/(ε²)`, `d = 0`; `𝔸² ⊔ 𝔸¹`, `d = 2`; `Spec K`, `K/ℚ` finite, `d = 0`; cusp/𝔽₂ | ∅: smooth, `E = 0` of every constant rank, both sides true. Cusp: `b = (3t/2)a` in `k[[t²,t³]]`, neither a unit, both false. Node: `ya + xb = 0`, `(x) ∩ (y) = 0` ⇒ `a ∈ (x)`, `b ∈ (y)`, both false. `ℚ[ε]/(ε²)`: right side true, not smooth, excluded by reducedness. `𝔸² ⊔ 𝔸¹`: smooth, fibre of `Ω` on `𝔸¹` has dimension 1 < 2, excluded by pure dimension. `Spec K`: both true. Cusp/𝔽₂: `dx ↦ 0, dy ↦ 1` kills `x² dx`, right side true, singular: characteristic needed | holds; every hypothesis used |
| 2 | §4.4 route, step 4 | reducible `X`; non-closed residue field | contraction of a `∂_i`-stable prime to `k[X_1..X_d]` is `0` in characteristic 0 (least-degree element, `1 ∉ P`), so `trdeg κ(P) ≥ d`, `P` minimal, `M_P = T_P = 0`: contradiction with `P ⊇ Ann M`, `M` finite. Step 5: `dim_κ m/m² = d = dim R` at a closed point with `κ/k` finite separable | route sound without algebraic closedness |
| 3 | §5.4 / `…_of_isNormalScheme` | `d = 0`; quadric cone `z² = xy`, `p = 2`; `𝔽₂[ε]/(ε²)`; `x^p + y² + t` over `𝔽_p(t)` | `d = 0`: finite separable points, both true. Cone: `Ω = O dz ⊕ (O dx ⊕ O dy)/(y dx + x dy)`; a surjection onto `O²` forces `y ∈ (x)` or `x ∈ (y)`, false in `O/(x) = k[y,z]/(z²)`; both sides false. `𝔽₂[ε]/(ε²)`: right true, left false, not normal. Imperfect: `Ω = (R dx ⊕ R dy)/(2y dy)`, `dx ↦ 1` free quotient, regular not smooth: perfectness needed | holds |
| 4 | §5.1 `p`-monomial operators | `d = 1, p = 2`; `d = 1, p = 3`; `d = 0` | `p = 2`: `M = [[1,x],[0,1]]`, `M⁻¹ = [[1,−x],[0,1]]`, `φ_0 = id − x∂`, `φ_1 = ∂`. `p = 3`: `M⁻¹ = [[1,−x,x²],[0,1,−2x],[0,0,1]]`, `φ_0(x²) = x² − 2x² + x² = 0`, `φ_1 = ∂ − x∂²`, `φ_2 = 2⁻¹∂²`. `∂_d(x^β) = β_d x^{β−e_d}` needs only `∂_i(x_j) = δ_ij`, no commutation | holds |
| 5 | §5.3 freeness of `F_*R` | cusp, `p = 3`; `𝔽_p(t)[s]_{(s)}`; `d = 0` | cusp: `R³`-span of `1, t², t⁴` has orders `≡ 0, 2, 1 mod 3` from `{0,6,9,…}` shifts, never 3, so `t³ ∉` image. Imperfect: `[K : K^p] = p²` against rank `p`. `ρ_Q ∘ ψ_Q (Σ r_α e_α) = Σ σ(r_γ^p) e_γ = Σ r_γ e_γ`. Depth step matches `LinearMap.bijective_of_depth` at the pin (no finiteness of the source) | holds |
| 6 | §0.3 smooth locus of dimension `d` | `𝔸² ⊔ 𝔸¹`; cusp/ℚ; `k[ε]/(ε²)` | `X_sm^{(2)} = 𝔸²`, `X_sm^{(1)} = 𝔸¹`; cusp: complement of origin; `k[ε]/(ε²)`: rank 1 (free in char 2, `k·dε` otherwise) but `X_sm = ∅` | holds |
| 7 | §0.5 smooth iff regular at closed points | cusp; `𝔽_p(t)(t^{1/p})` | embedding dimension 2 > 1; a field, regular, `Ω ≠ 0` so not smooth: perfectness needed | holds |
| 8 | §1.2 Nash modification | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`; ideal of `0 ∈ 𝔸²`; `g = {0} → 𝔸²` (§1.5) | section with closed image, `N ≅ X`; closure of the section over `D(x)` is `X`, fibre of `Gr_1` over 0 is `ℙ¹`; `P(I) = Proj Sym I =` blowup; `N({0}, k², 1, ∅) = ∅` against fibre `ℙ¹` | holds |
| 9 | §2.4 `isIso_lift_iff` | `𝔸¹ ⊔ 𝔸¹` with one line; cusp/ℚ normalisation; `Bl_0 𝔸² → 𝔸²` | closed immersion, image misses the other line, not iso (π not surjective); `t ↦ (t², t³, [1 : 3t/2])` closed immersion since `k[t², t³, 3t/2] = k[t]`; blowup: lift is `π`, not a closed immersion into `𝔸² × pt` | true; R02 (route missing) |
| 10 | §2.2 modification | cusp/ℚ; `y² = x²z` | finite birational, not iso; `X* = Bl_0 𝔸²_{u,v}`, fibre ideal `(u, v²)`, chart `(vw, v²)` non-reduced | theorem holds; Check wording R01 |
| 11 | §2.5 triviality criterion | cusp in char 2, 3, 0 | char 2: relation `x² dx`, quotient `dy ↦ 1`; char 3: relation `2y dy`, quotient `dx ↦ 1`; char 0: no unit solution of `−3x²a + 2yb = 0`. Section `s` closed (`Gr_d` separated), agrees with `σ` on `X_sm`, `X* = s(X)` | holds, both directions |
| 12 | §2.6 base change | cusp/ℚ → ℚ(i); `𝔽_p(t)[y]/(y^p − t)` | both sides `𝔸¹_{ℚ(i)}`; non-reduced base change `k'[u]/(u^p)`, outside the Setting. `isPureDimensional_pullback_Spec_map_iff_of_field` at the pin holds for every field extension | holds |
| 13 | §2.7 iteration | smooth; cusp char 0, char 2; cusp char 2 with `d = 2` | `X^{(i)} ≅ X`; resolved at `i = 1`; `X^{(i)} ≅ X` never smooth; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth | holds; junk value documented |
| 14 | §3.2 blowup description | `𝔸¹`, `dx ↦ x`; cusp char 0 and 2; `I = 0` | `(x)` invertible, `Bl = X`; `Bl_{(t³,t⁴)} k[t²,t³]`: chart `t⁴/t³ = t`, `= 𝔸¹`; `(x²)` principal nonzerodivisor, `Bl = X`; `Bl_0 X = ∅ ≠ X*`. Density of `ν_I⁻¹(X_sm)`: `Bl ∖ E ≅ X ∖ V(I)` dense | holds |
| 15 | §3.3 hypersurfaces | cusp; node; `x^p − y^q` char `p`; `n = 0`; nonzero constant `f` | `J = (2y, 3x²)`: `(y, x²)`, `(x²)`, `(y)` in char 0/≥5, 2, 3; `(x, y)`; `(q y^{q−1})` principal; `J = 0`, `Bl = ∅ ≠ Spec k`; `X = ∅` both sides empty. Sign `(−1)^{j−1} ∂f/∂x_j` | holds; `n ≥ 1` needed |
| 16 | §4.1 coordinates | identity on `k[x,y]_{(x,y)}`; cusp char 3; `d = 0`; `𝔽_p(t)[x]_{(x^p−t)}` | `x_i`, `∂/∂x_i`; `ker q = R dy/(y dy)`; empty; `d(a(x^p − t)) = (x^p − t) da`, `q(dm) ⊆ m` | holds; separability needed for `x_j ∈ m` |
| 17 | §4.2 Lie derivative | `k[x]`, `d/dx`; `x d/dx`; `k[x]/(x²)` | `L(x dx) = dx`; `L(dx) = dx`; `L(x dx) = 2x dx = 0` in `Ω = R dx/(x dx)` | well defined |
| 18 | §4.3 Seidenberg | `ℚ[x]`; `ℚ[x,y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | only `0`, `(1)` stable; `(y)` stable; `(x^p)` stable, `(x)` not. Route: `x²∂y + xy∂x ∈ J` ⇒ `(x∂y)² ∈ J` ⇒ `∂y ∈ (J : x)` | holds; `ℚ ⊆ R` needed |
| 19 | §0.6 / §6.3 separable base change | `ℚ(i) ⊗ ℚ(i)`; `x^p + y² + t`, `k' = k(t^{1/p})`; `ℚ(u)/ℚ` | two points, normal not integral; `u^p + y² = 0`, normalisation `s ↦ (−s², s^p)`, `(−1)^p s^{2p} + s^{2p} = 0` for odd `p`, bijective not iso; both sides `𝔸¹_{ℚ(u)}` | holds; separability needed |
| 20 | §6.4 criteria for `ν̄` | cusp char 2; smooth; regular curve over `𝔽_p(t)` | `ν` iso, `X` not normal, `ν̄` not iso; both iso; `ν̄` iso, not smooth | holds, both directions |
| 21 | §7.1–7.3 never-resolves | `m = 0`; cusp char 2 with `m = 1`; smooth `X` | hypothesis trivially true and conclusion false for cusp/ℚ: `m ≥ 1` needed; no `X^{(i)}` smooth, `Y_1 = 𝔸¹` smooth; singular hypothesis fails | holds |
| 22 | `HasLocallyFreeQuotientOfDifferentials` | `∅`; `𝔸¹` with `d = 0, 1, 2`; `𝔸²` with `d = 1` | true for all `d`; true, true, false; two quotients with kernels `O dy ≠ O dx` (uniqueness needs dense `X_sm^{(d)}`) | definition determines the notion; wrong model "`Ω` locally free" excluded by cusp/𝔽₂ |
| 23 | Convention: quotients, not subspaces | line `y = 2x` | `dx ↦ 1`, `dy ↦ 2`, point `[1 : 2]`; conormal would give `[2 : −1]`; recomputed in §3.1 and §0.4 (`[1 : 0]` against `[0 : 1]`) | consistent in all three places |

**Sources: the seeded sample.** All 15 sampled targets checked at their locators, against the cached texts:
§0.3 stacksAlgebra line 17618 (Lemma 10.140.3, (1)–(3) at 17621–17623); §0.5 stacksVarieties line 2130; §1.2
nashModificationNotes2024 lines 216–225 and gonzalezSprinberg1982 lines 85–90; §2.2 nashModificationNotes2024 lines
152–155, gonzalezSprinberg1982 line 94, nobile1975 lines 314–324; §2.5 nashModificationNotes2024 lines 170–171,
duarteNunezBetancourt2020 lines 152–156, nobile1975 lines 136 and 140 (the source's `q` is the characteristic, so
"with `q = 3`" is right); §2.6 nobile1975 lines 42–44; §2.7 nobile1975 lines 202–203; §3.2 nobile1975 lines 105 and
107–116, nashModificationNotes2024 lines 243–247; §3.3 nobile1975 lines 129–133 and 136–141,
castilloDuarteLeytonLiendo2026 lines 33–35; §4.1 nashModificationNotes2024 lines 194–197 and 484–501,
duarteNunezBetancourt2020 lines 263–268; §4.3 hamann2003 lines 56–64; §5.1 duarteNunezBetancourt2020 lines 271–283,
nashModificationNotes2024 lines 394–407; §6.3 stacksNormalization lines 6332, 6566, 6636, stacksVarieties line 2256;
§6.4 nashModificationNotes2024 lines 515–517, stacksNormalization line 6636; §7.1 castilloDuarteLeytonLiendo2026 lines
28–32 and 52–55. Theorem numbers, tags and hypotheses agree; where the source is narrower (algebraically closed
fields, irreducible varieties, one direction only) the README says so and gives its own route. Beyond the sample I
checked 24 further locators (Stacks tags 01R8, 081I, 01UV, 01UX, 01V0, 01UZ, 035N, 035P, 035Q(4), 04KS, 0C3M, 056T,
056V, 0583, 00L2, 030O, 00RW, 00TU, 00TY, 0C30, 06DF; alperModuli lines 1202, 2283, 2985–3007): one slip, R04. The
author flagged no locator as unverified.

**Library declarations at the pins.** 83 names opened in the pinned Mathlib and Tau Ceti; all exist where cited.
Those whose statements the routes lean on, with what they say: `Scheme.Hom.smoothLocus`
(`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:300`, needs `LocallyOfFinitePresentation`);
`Scheme.Hom.dense_smoothLocus_of_perfectField` (same file, 361; reduced, perfect field);
`Algebra.IsTranscendentalSeparable` (`Mathlib/FieldTheory/TranscendentalSeparable.lean:72`, with the instances from
`Algebra.IsSeparable` at 88 and `PerfectField` at 91); `Algebra.FormallyEtale.of_isSeparable`
(`Mathlib/RingTheory/Etale/Field.lean:98`); `TauCeti.IsPureDimensional` (`TauCeti/Topology/PureDimension.lean:52`:
every irreducible component has Krull dimension `d`, so the empty space is pure of every dimension, and nothing about
finite type); `FiniteLocallyFreeSheaf.FixedRank` (`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:71`, rank `r`
at every point); `IsModification` (`…/Morphisms/Modification/Basic.lean:53`, proper plus a dense open with dense
preimage, no integrality); `IsNormalScheme.isDiscreteValuationRing_stalk` (`…/Scheme/Normal.lean:203`, locally
Noetherian, coheight one); `LinearMap.bijective_of_depth` (`TauCeti/RingTheory/Depth/Bijectivity.lean:120`, Noetherian
ring, arbitrary modules); `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`
(`TauCeti/RingTheory/Kaehler/Conormal.lean:76`, no Noetherian hypothesis); `TauCeti.powRingHom_finite`
(`TauCeti/Algebra/CharP/Frobenius/Finite.lean:62`, perfect `R`, finite type);
`isPureDimensional_pullback_Spec_map_iff_of_field` (`…/Scheme/KrullDimension.lean:263`);
`Scheme.relativeDifferentialsStalkEquiv` (`…/Differentials/Stalk.lean:288`) with `Scheme.stalkBaseAlgebra`
(`…/Scheme/BaseAlgebra.lean:119`); `IsRegular.isNormal` (`…/Scheme/Regular/Scheme.lean:175`).

**Cross-roadmap citations resolved** (each at the cited roadmap as it is now). SchemeAndStackFoundations on main:
§0.7 (README line 1049), §0.11 `field_extension_descent` (1372, smoothness among the properties that descend), §0.17
(1669), §0.23 (2163), §0.30 (2681), §4.11 `IsModification.Witness` (6839), §4.13 `regularLocus_eq_smoothLocus` (6987,
perfect field). EnhancedDerivedSheaves on main: §E1.6 `isRegular_of_frobenius_flat` (README line 800, `Suggested.lean`
line 108; Noetherian `𝔽_p`-algebra). ResolutionOfSingularitiesCharacteristicZero on main: §2.15 (line 510).
DiophantineApproximationAndTranscendence on main: §5.6, `exists_lieDerivativeOneForm`, `lieDerivativeOneForm` (lines
3692–3693). AlgebraicModuliForArithmeticGeometry at its open head (a new roadmap, earlier in the merge order): §1.3
`coherentGrassmannian` (line 612: arbitrary base, universal quotient, unique classifying maps, base change,
`Gr_1 ≅ P`, properness over `Spec R` for a finite module) and `plucker` (663); §5.4 `DMNormalization.stack`,
`DMNormalization.finite`, `DMSchematicClosure.stack` (8677, 8701, 8711; the scheme cases are Mathlib's
`Scheme.Hom.normalization` of the generic points and `Scheme.Hom.image`, with flat base change). DerivedDeRhamCohomology
at its open head: §0.23 (line 451) states "a family is a p-basis exactly when its differentials form a basis" in prose
and lists `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` (line 472). The worker's two unresolved
names are these two: they resolve there, so they are no finding.

**Supplier order.** Output of the dependency check: `depcheck: 246 roadmaps, 2244 edges, 0 problem(s)`. No UPWARD or
CYCLE line. Every `*Needs:*` line read: each names a section of this roadmap, a pinned declaration or one of the six
suppliers above, all on main or earlier in the merge order; none is on the never-cite list. No supplier drift.

**Duplication audit.** Searched the roadmaps on main and the open heads for the objects: "Nash
blow/modification/transform" (no match anywhere), Seidenberg's lemma on derivations (no match; the hits are
Tarski–Seidenberg and hyperplane sections), the Lie derivative on Kähler differentials (only
DiophantineApproximationAndTranscendence §5.6, cited, for fields of characteristic zero), freeness of the Frobenius
pushforward (no match), the Stacks tags of Layer 0 (01UV, 01V0, 01UZ, 0C3M, 0C3N, 06DF, 0C30, 056V, 00TT: no match),
and the pins for "Nash" (nothing). AdicSpacesPartIII §R3.6 uses the suggested name
`relativeDifferentials.baseChangeIso` for continuous differentials of adic spaces; here it is an italic suggested name
for schemes, neither `Suggested.lean` declares it, and the Scope paragraph states the difference: no shared object.
The worker's overlap list has no changed, dropped or revision-only id. Ownership against the open pull requests was
checked through the roadmap search over their heads.

Overlap check: read SchemeAndStackFoundations, AbhyankarLemma, ResolutionOfSingularitiesCharacteristicZero,
PurityOfBranchLocus, LogPluricanonicalForms, DirectSummandsAndBigCohenMacaulay; nothing shared (modifications,
regular schemes and Serre's criterion are SchemeAndStackFoundations', the derivative ideal is
ResolutionOfSingularitiesCharacteristicZero's, Kunz's converse is EnhancedDerivedSheaves'; this roadmap cites each and
owns none).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 each
ending with Examples and Dependencies, Downstream consumers, References. Nine definitions, each with an API list and at
least three Checks (3, 3, 4, 3, 4, 4, 3, 3, 3). The layers are the roadmap's own: sheaf-level modification before the
Nash blowup, the two smoothness criteria independent of the embedded description. No LaTeX delimiters, no process
words, pull-request numbers, dates, anchors or machine paths in the README or the Lean file. The three backticked
names the README attributes to this roadmap are the three declarations of `Suggested.lean`; the other own names are
italic, as the Conventions say.

**Copyright.** Wording compared at every verified locator and at seven further passages (the definition of §0.7, the
route of §5.3, the route of §4.3, the construction of §1.2, the principle of §7.3, the docstring of the second theorem,
the presentation target of §3.2): what is shared is formulas and statements of a dozen words that can be written one
way (`πq = h`, `q*L = M`; `x²∂y ∈ J`). Arrangement: nashModificationNotes2024 has seven sections (definition, basic
results, Oneto–Zatini, Yasuda, normal case, toric, Toh-Yama); the roadmap puts the sheaf construction (its Section 3)
before the variety case (its Sections 1–2), has no layer for its Sections 4, 6 and 7, and three layers (3, 6, 7) drawn
from other sources. No table, figure or list of examples is taken over; the worked examples (cusp, node, cone) are
recomputed in every characteristic.

Source independence: 64 passages compared with 10 sources, none shared; largest share nashModificationNotes2024, 19 of
91 locators; contents compared with nashModificationNotes2024: independent.

## Not verifiable

- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: recorded as uncertified and cited as
  background only, by locator; no text read. No target's statement or route depends on them.
- Printed page numbers of the Stacks chapters: the cached extractions carry tags and lemma numbers, which I checked;
  the README cites those and no printed pages.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, p. 10: the source says the Nash modification of a normal
  variety in characteristic `p` is an isomorphism iff the variety is singular; it should be iff it is nonsingular;
  affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, p. 13: the source says the normalised higher Nash
  modification is an isomorphism iff the variety "is an isomorphism"; it should be iff the variety is nonsingular;
  affects a stated result.
- **Misprint** in nashModificationNotes2024 at Propositions 2.2 and 2.3, p. 5: the same proposition, with its
  introductory paragraph, is printed twice under two numbers; it should appear once; affects nothing.
- **Misprint** in hamann2003 at Lemma 0.1, proof, p. 2: the source says the radical `J` itself is the annihilator of an
  element outside `J`; it should be that the minimal prime `P` equals `(J : x)` for such an `x`; affects the proof.
- **Misprint** in stacksAlgebra at Example 10.140.8 (tag 00TY): the source says the curve over `𝔽_p(t)` is
  `x^p + y² + α`, with an undefined `α`; it should be `x^p + y² + t`; affects nothing.
- **Misprint** in nobile1975 at Example 1, p. 300 (and Example 4, p. 305): the source says the Jacobian ideal is the
  centre "by Remark 1", which only fixes notation; it should refer to Remark 2; affects nothing.
- **Misprint** in castilloDuarteLeytonLiendo2026 at the Introduction, first paragraph, p. 1: the source writes the
  normalised Nash blowup map as the normalisation applied after `ν`; it should be the composite `ν ∘ η`, normalisation
  first; affects nothing.

## For the human reviewers

- **Scope.** The differential smoothness criteria are stated for reduced (not necessarily irreducible) schemes over any
  field of characteristic zero or perfect field; the refereed sources (nobile1975, duarteNunezBetancourt2020) state them
  for varieties over algebraically closed fields. The wider form rests on the README's own routes (§§4.4, 5.3).
- **Licence.** `alperModuli` is recorded with `licence_class = "author-page"` (a dated draft on the author's university
  page, `packages/NashBlowups/sources.toml` lines 236–249); it is an unpublished manuscript, cited for one proof step.
- **Licence.** `nashModificationNotes2024`, the source with the largest share of locators (19 of 91), is an arXiv
  preprint (survey notes); I did not find a journal version. Its main statements are also cited from refereed papers.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "57c3d2deb69b92d4035065bf4934a4377641e648", "job": "REV-PKG-NashBlowups", "model": "fable", "worker": "chris-x90"} -->
