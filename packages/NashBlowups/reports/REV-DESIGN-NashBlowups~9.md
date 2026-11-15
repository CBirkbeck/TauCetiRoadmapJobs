<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13795#issuecomment-6898133333 -->
Review (claude) of 927feb5

Verdict: accepted

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both findings of round 8 are repaired, the repaired passage and the rest of the design were recomputed,
and every locator, pinned declaration and cross-roadmap citation was resolved again in this run. No supplier gap is
declared (`design/plan.json` has `gaps: []`; the README says "No gap is recorded"), so the acceptance is not
conditional. This review changed no design file and no manifest entry. No maintainer notes were supplied.

## Verified sound

### Round 8, finding by finding

- **F01 (P3), repaired.** `packages/NashBlowups/design/README.md:1377–1387` (§7.2): "for `W` in the Setting, an open
  `U ⊆ W` and a `k`-isomorphism `U ≅ Z` … (both taken with the `d` of the Setting) … Consequently, for `X` in the
  Setting with normalised iterates `Y_i` (§7.1), if `Y_m` contains …". The route names `W = Y_m`, `Z = X` and the
  induction on `j`. `design/plan.json`, target 7.2, has the same statement, the four hypotheses and the prerequisite
  `target:2.7`; the README *Needs* line is "§§2.4, 2.6, 2.7, 6.3, 7.1" and Layer 7's Dependencies (Layers 2 and 6)
  cover it.
- **F02 (P3), repaired.** The sentence on the merge order is gone from "Downstream consumers" (README 1432–1436); the
  paragraph lists the toric roadmap, the Part II and the polar-variety roadmaps with their sections. A search of the
  README, `plan.json` and `sources.toml` for "merge order", "pull request", "round", "removed", "deferred",
  "optional", "checkpoint", "handoff", LaTeX delimiters, pull-request numbers and machine paths returns nothing.

Pattern of each repair in the rest of the design: every other `Y` (§0.1, the normalisation contract, §§7.1, 7.3) is
introduced before use; no other sentence speaks of scheduling. Nothing was marked not actionable; nothing is
re-raised.

### Adversarial pass

All 37 targets were read and recomputed. The table shows the repaired passage, the fifteen sampled targets, the
five headlines and the statements the routes of the headlines rest on. `C_p` is the cusp `y² = x³` in
characteristic `p`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.2 main (repaired) | `i = 0`; `U = ∅`; `W = C_0`, `U = W_sm`, `i = 1` | `W ⊇ U ≅ Z`; `Z = ∅`, all iterates `∅`; `W* = 𝔸¹ ⊇ 𝔸¹∖0 = U*` | holds | none |
| 7.2 consequence (repaired) | `C_2`, Nash, `m = 1`; `C_2`, normalised, `m = 1`; step `j → j+1` | `X^{(j)} ≅ X` for all `j`; `Y_1 = 𝔸¹` has no open copy of the cusp, hypothesis false; `Y_{(j+1)m} ⊇ O ≅ Y_{jm} ⊇ O' ≅ X` | holds | none |
| 7.2 Checks | `U = Z = W`; `U = Z = W_sm` | identity; iterates of `U` are `U`, `ν⁻¹(W_sm) ≅ W_sm` | hold | none |
| 0.1 comparison map | `t ↦ (t², t³)`, char 0 and 2; `id`; `Spec k → 𝔸¹` | `(2t dt, 3t² dt)`; `(0, t² dt)`; `dx ↦ dx`; `k·dx → 0` onto, not injective | determines `c_f`; zero map excluded by `c_f(f*dh) = d(f*h)` | none |
| 0.2 base change | `k → k(s)`, `X = Spec k`; `𝔽_p(t)[y]/(y^p − t)` over `k(τ)`; `ℤ → 𝔽₂`, `𝔸¹` | `0 → 0` iso while `c_{g'}` is `0 → k(s)ds`; `c(dy) = dτ + du` in rank 2, `b(dy) = du` basis of rank 1; `dT ↦ dT` | iso without flatness or reducedness | none |
| 0.3 smooth locus of dimension `d` | `𝔸² ⊔ 𝔸¹`; `C_0`; `Spec k[ε]/(ε²)` | `(𝔸², 𝔸¹, ∅)` for `d = 2, 1, 0`; complement of origin; fibre of `Ω` is `k·dε`, rank 1, `X_sm = ∅` | sound | none |
| 1.2 Nash modification | `O ⊕ O/(x)` on `𝔸¹`, `r = 1`; ideal of `0 ∈ 𝔸²`; `F` locally free; `U' ⊂ U` dense | fibre of `Gr_1` over `0` is `ℙ¹`, `N = 𝔸¹`; `N = Proj` of the Rees algebra `= Bl₀𝔸²`; section, `N ≅ X`; same image since `U` reduced | sound; `σ_U` quasi-compact as `Gr_r(F)` is locally Noetherian | none |
| 1.3 universal property | two rank-`r` quotients `M_1`, `M_2` of `h*F`; `Spec k → 0` in the `O ⊕ O/(x)` example | `ker_1 → M_2` vanishes on the dense `h⁻¹(U)`, `M_2` locally free on reduced `Z`, so zero; quotient `(a, b) ↦ b` does not factor | reducedness and density needed, both stated | none |
| 1.5 locality, flat base change | `V ⊆ U`; `g = (U ⊆ X)`; `{0} → 𝔸²` | `V`; `U`; fibre product `ℙ¹` against `N({0}, k², 1, ∅) = ∅` | flat and dense needed, stated | none |
| 2.1 definition | `C_p`, `p = 0` or `≥ 5`; node; `d = 0` | `k[t]²/t³(−3t, 2) ≅ k[t] ⊕ k[t]/(t³)`, torsion of length 3; branches `[1:0]`, `[0:1]`, `X* = 𝔸¹ ⊔ 𝔸¹`; `X* = X` | sound | none |
| 2.4 `isIso_lift_iff` | `π` surjective with closed-immersion classifying map; one line of `𝔸¹ ⊔ 𝔸¹` | image closed and contains the one-point fibres over `X_sm`, hence all of `X*`; closed immersion, lift not onto | surjectivity needed, stated | none |
| 2.5 headline | `C_2`, `C_3`, `C_0`; `d = 0`; `X = ∅` | relation `x² dx`, quotient `(0, 1)`; relation `2y dy`, quotient `(1, 0)`; `b = (3t/2)a` in `k[[t², t³]]` forces `a`, `b` non-units; rank-0 quotient always exists and `X` is étale; trivial | iso: T, T, F, T, T | none |
| 2.7 Nash iteration | smooth `X`; `C_0`; `C_2`, `d = 1` and `d = 2`; `𝔸²`, `d = 1` | `X^{(i)} ≅ X`; smooth at `i = 1`; never smooth, and `X^{(1)} = ∅` smooth; `X^{(1)} = ∅` | predicate meaningful only with the `d` of the Setting, as the Check says | none |
| 3.2 blowup description | `𝔸¹`, `dx ↦ x`; `C_0`, `I = (y, x²)`; `I = 0`; `d = 0` | `I` invertible, `Bl = X`; charts `A[x²/y] = k[t]`, `A[y/x²] = k[t, t⁻¹]`, `Bl = 𝔸¹`; `Bl = ∅ ≠ X*`, excluded by "isomorphism over `X_sm`"; `I = O` | sound; kernel of `∧^d L → O` vanishes on a dense open of a reduced scheme | none |
| 3.3 hypersurfaces | `C_p`; node; `x^p − y^q`, char `p`, `gcd(p, q) = 1`, `q ≥ 2`; `f` a nonzero constant; `f = 0`, `n ≥ 1`; `n = 0` | `J = (y, x²)`, `(x²)`, `(y)` for `p ∉ {2, 3}`, `2`, `3`; `J = (x, y)`; `J = (q y^{q−1})` principal on an integral curve, `ν` iso, curve singular; `X = ∅` both sides; `X = 𝔸ⁿ` not of dimension `n − 1`, excluded; `J = 0`, `Bl = ∅ ≠ Spec k` | sign `(−1)^{j−1} ∂f/∂x_j` recomputed; `n ≥ 1` needed, stated | none |
| 4.1 coordinates | `k[x, y]_{(x,y)}`; `C_3` at `0`; `d = 0`; `𝔽_p(t)[x]_{(x^p − t)}` | `∂_i = ∂/∂x_i`; `q(dx) = 1`, `ker q ≅ R/(y)`; none; `d(a(x^p − t)) = (x^p − t)da`, no unit in `q(dm)` | separability needed for `x_j ∈ m`, stated | none |
| 4.2 Lie derivative | `k[x]`, `d/dx`; `x·d/dx`; `k[x]/(x²)`, `∂x = x`, char `≠ 2`; annihilator rule | `L(x dx) = dx`, `L(dx) = 0`; `L(dx) = dx ≠ 0`; `L(x dx) = 2x dx = 0`; `∂(a)ω = L(aω) − aL(ω) ∈ N` | determines `L_∂`; coefficient-only model excluded | none |
| 4.3 Seidenberg | `ℚ[x]`; `ℚ[x, y]`, `(y²)`; `𝔽_p[x]`, `(x^p)`; route with `P = (J : x)` | stable ideals `0`, `(1)`; `(y)` stable; `(x)` not stable; `x²∂y ∈ J`, `(x∂y)² ∈ J`, `∂y ∈ P` | `ℚ ⊆ R` needed, stated | none |
| 4.4 free quotient forces smoothness | stable prime contracted to `k[X_1..X_d]`; `d = 0`; `C_2` | least-degree element has a nonzero derivative of lower degree, contraction `0`, `trdeg κ(P) ≥ d`, `P` minimal, against `T_P = 0`; `Ω → 0` and `X` étale; free quotient, singular | char 0 needed, stated | none |
| 4.5 headline | `C_0`; node; `C_2`; `X = ∅` | (smooth, `ν` iso) = (F, F), (F, F), (F, T), (T, T) | iff holds in char 0 only, stated | none |
| 5.1 `p`-monomial operators | `p = 2`, `d = 1`; `d = 0`; non-commuting `∂_i`; `C_3` | matrix `(1, x; 0, 1)`, `φ_0 = id − x∂`, `φ_1 = ∂`; `φ_∅ = id`; `∂^{(α)}(x^β) = binom(β, α)x^{β−α}` uses only `∂_i(x_j) = δ_ij`; orders `3a`, `3a + 2`, `3a + 4` with `a ∈ {0, 2, 3, …}`, never `3` | sound | none |
| 5.2 generic Frobenius basis | `k(t)`; `d = 0`; `t^p ∈ k(t)` | `1, …, t^{p−1}`; `K = K^p`; `d(t^p) = 0`, not a basis | sound | none |
| 5.3 freeness | `k[s]_{(s)}`; `C_3`; `d = 0`; `𝔽_p(t)[s]_{(s)}`; DVR step; height `≥ 2` | basis `s^i`; `t³ ∉` image; `F_*k = k`; rank `p²` against `p`; `ρ_Q ψ_Q(e_α) = σ(φ_α(x^α))e_α = e_α`, both free of rank `p^d`; `depth ≥ 2`, `Ass(F_*R) = {0}` | perfect and normal needed, stated; `ρ_Q` is `R_Q`-linear since `σ(r^p g) = rσ(g)` | none |
| 5.4 headline | cone `z² = xy`, `p ≠ 2`; `C_2`, `C_3`; `x^p + y² + t` over `𝔽_p(t)` | `J = (x, y, z)` not invertible, `ν` not iso; not normal; relation `2y dy`, quotient `(1, 0)`, `ν` iso, regular and not smooth | false over imperfect fields, stated | none |
| 6.1 definition | `C_0`; `C_2`; node; `y² = x²z`, char `≠ 2` and `2` | `𝔸¹`; `X* ≅ X`, `X̄* = 𝔸¹`; `η = id`; with `u = y/x`: `J·k[x, u] = x(x, u)`, charts `k[u, x/u]`, `k[x, u/x]`, `k[x, u, u⁻¹]`, normal, fibre `ℙ¹`; `J = (x²)`, `X* = X` | normalise `X*`, not `X` | none |
| 6.3 locality, separable base change | `C_0`, `ℚ(i)`, `ℚ(u)`; `x^p + y² + t`, `k(t^{1/p})` | `𝔸¹` on both sides; `(−s²)^p + (s^p)² = 0`, comparison bijective, not an isomorphism | separability needed, stated; criterion of `isIso_normalizationDesc_iff` met for a normal Noetherian source | none |
| 6.4 headline | `C_2`; line; `x^p + y² + t`; route `s = η ∘ ν̄⁻¹` | (normal, `ν` iso, `ν̄` iso) = (F, T, F), (T, T, T), (T, T, T); `s` a section of the separated `ν`, image closed and containing `ν⁻¹(X_sm)` | iff sound both ways | none |
| 7.1 normalised iteration | `C_0`; `C_2`; `i = 0` | `Y_1 = 𝔸¹`; `Y_1 = 𝔸¹` while `X^{(i)} ≅ X`; `Y_0 = X` not normal | normality bullet needs `i ≥ 1`, stated | none |
| 7.3 headline | `C_2`, `m = 1`, Nash; `C_0`, `m = 0`; smooth `X`; `X = ∅` | no smooth iterate; `Y_1` smooth, so `m ≥ 1` needed; hypothesis fails; not singular | sound | none |

Natural subtraction occurs only in `n − 1` (`n ≥ 1`), `β − α` (`α ≤ β`), `r − 1` (`r ≥ 2`) and `q − 1` (`q ≥ 2`). No
statement is quantified over data unrelated to the construction. Each of the five headlines names the Nash blowup.
A remark that needs no change: in §5.1 the matrix `(∂^{(α)}(x^β))` is unitriangular for the product order whether
or not the `x_j` lie in `m`; with `x_j ∈ m`, as stated and as §5.3 uses it, it is the identity modulo `m`.

### Sources: the seeded sample

Read at the locators in the cached texts. The author flags no locator as unverified.

| Target | Locator read | Supports |
|---|---|---|
| 0.1 | stacksNormalization line 2900 (01UV), 2918 (01UX), 2926 (01V0), 2953 (01UZ) | comparison map, exact sequence, base change, immersions |
| 0.3 | stacksAlgebra lines 17618–17624 (00TT) | smooth at `q` iff the fibre of `Ω` has dimension `dim_x X` |
| 1.2 | nashModificationNotes2024 lines 216–225; gonzalezSprinberg1982 lines 85–90 | closure of the canonical section in the Grassmannian of quotients |
| 1.5 | stacksNormalization lines 421–426 (01R8 (3)), 2198–2203 (081I) | image and opens; image and flat base change |
| 2.7 | nobile1975 lines 202–203 | the iterated blowing-up `X^{(q)}` |
| 3.3 | nobile1975 lines 129–133, 136–141; castilloDuarteLeytonLiendo2026 lines 33–35 | Jacobian ideal for `n − r` equations; the two examples; `x^p − y^q` |
| 4.2 | stacksAlgebra lines 15590–15592 (00RW); hamann2003 lines 56–64 | `Ω ≅ J/J²`; the lemma and its computation |
| 5.1 | duarteNunezBetancourt2020 lines 271–283; nashModificationNotes2024 lines 394–407 | the operators and their `R^p`-linearity |
| 5.2 | duarteNunezBetancourt2020 lines 301–302; nashModificationNotes2024 lines 421–422 | rank `p^d` |
| 5.3 | duarteNunezBetancourt2020 lines 284–305; nashModificationNotes2024 lines 408–439 | `ψ`, `ρ_Q`, height one, `(S_2)`, Kunz; finiteness at 418–420 |
| 6.1 | castilloDuarteLeytonLiendo2026 lines 20–21; gonzalezSprinberg1982 lines 60–69; stacksNormalization lines 6498, 6521 | normalised Nash blowup; normalisation and its affine description |
| 6.3 | stacksNormalization lines 6332–6334 (035K), 6566–6569, 6636–6638; stacksVarieties lines 2256–2260 (0C3N) | normalisation over opens; factorisation; isomorphism for separable `K/k` |
| 6.4 | nashModificationNotes2024 lines 515–517; stacksNormalization lines 6636–6638 (0H7D) | normal `X` with `ν̄` iso; normalisation iso iff normal |
| 7.2 | castilloDuarteLeytonLiendo2026 lines 58–67 | items (i)–(iii); the propagation is used there, not stated, as the README says |
| 7.3 | castilloDuarteLeytonLiendo2026 lines 66–67 | the consequence |

Also read: stacksVarieties lines 296–304 (04KS), 1049–1050 (0C3M), 2084–2085 (056T), 2112–2114 (056V), 2130–2133
(0B8X); stacksAlgebra lines 4671–4675 (030O), 17720–17726 (00TY), 21510–21517 (0C30, 06DF); stacksNormalization
lines 6570–6572 (035Q (4)); nashModificationNotes2024 lines 107–112, 143–145, 153–162, 170–171, 179–181, 243–247,
362–364; nobile1975 lines 105–106, 143–145, 314–318; duarteNunezBetancourt2020 lines 127–129, 136–142, 152–154,
256–268; gonzalezSprinberg1982 lines 92–112. The section numbers of nashModificationNotes2024 (Sections 1–7 at
lines 98, 141, 202, 251, 354, 502, 650) agree with every "Section n" the README gives. The manifest has fifteen
entries, one key each, no local path; five stay `uncertified`. No source was fetched and no
`needs-references.toml` was written.

### Supplier-order audit

Gate output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved in this run:

- AlgebraicModuliForArithmeticGeometry (open new-roadmap pull request, earlier in the order), at its head: §1.3 at
  `README.md:610`, `coherentGrassmannian` `:612` (arbitrary `S`, universal quotient, classifying maps, base change,
  `Gr_1 = P(E)`, affine points), properness over `Spec R` `:626`, `plucker` `:663`; §5.4 `:8675`,
  `ArithmeticModuli.DMNormalization.stack` `:8677` (lifting, isomorphism for normal `X`, agreement with
  `Scheme.Hom.normalization`), `.finite` `:8701`, `ArithmeticModuli.DMSchematicClosure.stack` `:8711` (flat base
  change).
- SchemeAndStackFoundations (main): §0.7 `README.md:1049`, §0.11 `:1370` with `field_extension_descent` `:1372`
  (smooth among the descending properties), §0.17 `:1669`, §0.23 `:2163`, §0.30 `:2681`, §4.11 `:6824` with
  `IsModification.Witness` `:6839`, §4.13 `:6951` with *regularLocus_eq_smoothLocus* `:6987`. The open pull request
  that revises this roadmap keeps all seven section numbers and the three names.
- EnhancedDerivedSheaves (main): §E1.6 `README.md:689`, `isRegular_of_frobenius_flat` `:800`. Both open pull
  requests that revise it keep the section and the name.
- DiophantineApproximationAndTranscendence (main): §5.6 `README.md:3555`, `lieDerivativeOneForm` and
  `exists_lieDerivativeOneForm` `:3692–3694`.
- DerivedDeRhamCohomology (open new-roadmap pull request, earlier in the order): §0.23 `README.md:451`, the two-way
  statement `:461`, `DerivedDeRham.IsPBasis` and `DerivedDeRham.pBasis_kaehler_basis` `:472` and
  `Suggested.lean:53, 64`. The two leads of the citation tool are these names: they are that roadmap's, and resolve.

None of the roadmaps that may never be cited as suppliers is cited. Every roadmap named in a *Needs* line occurs in
its layer's Dependencies.

### Pins

Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to the plan's baseline. All 57 library prerequisites of `plan.json`
and the further names of the two contracts were located at the pins. Opened this round:

- Mathlib: `AlgebraicGeometry/Morphisms/Smooth.lean:291, 300, 320, 333, 361`
  (`dense_smoothLocus_of_perfectField`: reduced `X`, perfect `K`, locally of finite presentation),
  `IdealSheaf/Subscheme.lean:658, 661, 706`, `IdealSheaf/Basic.lean:691, 844`,
  `Morphisms/ClosedImmersion.lean:206, 409`, `Morphisms/Separated.lean:289`,
  `Morphisms/UniversallyInjective.lean:106`, `Morphisms/FiniteType.lean:112`, `Normalization.lean:122, 371, 576, 598`
  (isomorphism of `normalizationPullback` for smooth `g`), `Modules/Sheaf.lean:183`,
  `FieldTheory/TranscendentalSeparable.lean:72, 76` (every essentially finitely generated intermediate field is
  separably generated; nothing algebraic is assumed), `RingTheory/Etale/Field.lean:98`,
  `RingTheory/Kaehler/Basic.lean:801, 869`, `Kaehler/TensorProduct.lean:238`, `RingTheory/Grassmannian.lean:66`,
  `RegularLocalRing/Defs.lean:52, 93`, `LocalRing/ResidueField/Basic.lean:33`, `Topology/JacobsonSpace.lean:105`.
- Tau Ceti: `AlgebraicGeometry/Modules/Differentials/Basic.lean:85, 101`, `Quasicoherent.lean:96, 146`,
  `Restriction.lean:157`, `LocallyFree.lean:54`, `Rank.lean:74`, `Morphisms/Smooth/RelativeDimension.lean:94`,
  `Smooth/Regular.lean:43`, `Smooth/Locus.lean:46, 53`, `Scheme/LocalDimension.lean:76, 105, 168`,
  `Scheme/Normal.lean:84, 153, 203` (locally Noetherian, coheight one), `Scheme/Regular/Scheme.lean:175`,
  `Scheme/KrullDimension.lean:263`, `Morphisms/Modification/Basic.lean:53` (proper, a dense open with dense
  preimage; no integrality), `Morphisms/UniversalHomeomorphism.lean:162`, `IdealSheaf/VanishingIdeal.lean:99`,
  `Blowup/IdealSheaf.lean:120, 124, 191`, `Blowup/UniversalProperty.lean:297, 372`,
  `Blowup/ExceptionalDivisor.lean:203`, `Normalization/IsIso.lean:114`, `Grassmannian/Basic.lean:161, 166`,
  `Grassmannian/Points.lean:405`, `Grassmannian/Proper.lean:137, 230`, `RingTheory/Depth/Bijectivity.lean:120`,
  `RingTheory/Kaehler/Conormal.lean:76`, `RingTheory/SerreCondition/Normal.lean:214`,
  `Algebra/CharP/Frobenius/PowRingHom.lean:38, 49`, `Frobenius/Finite.lean:62`, `Topology/PureDimension.lean:52`
  (vacuous for the empty space, as the README says), `Sheaf/ExteriorPower/Basic.lean`.

### Duplication and ownership

By object, at the pins: Tau Ceti has Kunz's theorem in the forward direction only
(`RingTheory/RegularLocalRing/Frobenius.lean:67, 85`) and reducedness from flat Frobenius
(`Algebra/CharP/Frobenius/Flat.lean:39`), not the converse the README takes from EnhancedDerivedSheaves §E1.6; the
regular locus exists for rings only (`RingTheory/RegularLocalRing/Locus.lean:61`), not its equality with the smooth
locus of a scheme; no Lie derivative on Kähler differentials, no `p`-basis predicate, no Seidenberg lemma, no
comparison or base-change map for `Scheme.relativeDifferentials`, no normality of base changes along separable
extensions, no Nash construction (the one file named Nash concerns Nash functions in real algebraic geometry).

`roadmaps grep` over main and the open heads: Nash blowup, modification or transform (no match); 01V0 and base
change of relative differentials (no match for the object); 0C3M (no match); "geometrically normal" (uses of the
notion in proofs, no owner of the base-change statement); Seidenberg (only Tarski–Seidenberg and a hyperplane-section
reference); Lie derivative on Kähler differentials (no match beyond the cited §5.6); Gauss map (Lefschetz pencils and
abelian varieties, other objects); derivation-stable ideals (enveloping algebras, another object); free Frobenius
pushforward, Jacobian ideal as a blowup centre, Grassmannians along a surjection (no match). The overlap file lists
no pull request changing this roadmap, no dropped id, no revision-only id and no roadmap close in the results it
names; the board-packages index has no other Nash package. This roadmap is the owner of every construction it
states.

Overlap check: read SchemeAndStackFoundations, AbhyankarLemma, ResolutionOfSingularitiesCharacteristicZero (main) and PurityOfBranchLocus, LogPluricanonicalForms, AdicCoefficientsAndComparisonsPartII (open); nothing shared (modifications, regular and normal schemes and dimension theory are SchemeAndStackFoundations' and Tau Ceti's, cited here).

### Shape

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, eight layers each ending in
Examples and Dependencies, consumers, references. `plan.json` parses: 37 targets (6 definitions, 2 constructions,
29 theorems); the 37 README subsection numbers equal the plan ids; every `target:` prerequisite resolves; every
target has a locator; every definition and construction has at least three Checks. Layers are named by their
mathematics; Layers 4 and 5 both start from §4.1, Layer 6 needs 2, 4 and 5, Layer 7 needs 2 and 6.

### Headlines

§2.5 triviality criterion, §4.5 Nobile's theorem, §5.4 the theorem of Duarte and Núñez-Betancourt, §6.4 the
criteria for the normalised blowup, §7.3 the never-resolves principle. There is no `Suggested.lean` at the design
stage, so there is nothing for the padding probe, the `#check` comparison or the import check.

### Copyright

Compared with the sources at their locators: the fifteen sampled statements and the routes of §1.3
(nashModificationNotes2024 lines 226–229), §2.4 (lines 153–162), §4.3 (hamann2003 lines 58–64), §4.4
(nashModificationNotes2024 lines 179–199, a different proof), §5.3 steps 1–5 (duarteNunezBetancourt2020 lines
284–305; the finiteness and splitting arguments are the roadmap's own) and §6.1 (castilloDuarteLeytonLiendo2026
lines 17–21). Shared runs are formulas and statements of under a dozen words. Contents of
nashModificationNotes2024 against the layers: Layer 1 ↔ §3, Layer 2 ↔ §§1–2, Layer 4 ↔ §2, Layer 5 ↔ §5; Layers
0, 3, 6, 7 have no counterpart and §§4, 6, 7 are not planned: neither one to one nor in order. No table, figure or
list is taken over.

Source independence: 21 passages compared with 10 sources, none shared; largest share nashModificationNotes2024, 20 of 103 source citations in the README; contents compared with nashModificationNotes2024: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate). No Lean command was run; there is no
  `Suggested.lean` to elaborate.
- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: settled uncertified background texts, not
  opened; no target rests on them.
- Ownership against open pull requests rests on the supplied index of open heads.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash map of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Gap** in nashModificationNotes2024 at Section 3, printed p. 6: the source says every morphism carrying a rank-d quotient factors through the closure; it should require a reduced source in which the preimage of the open is dense; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Section 1, printed p. 3: the source says the closure of the image of the graph map is taken in the Grassmannian; it should be taken in the product of the variety with the Grassmannian; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at Theorem 3.10 proof, printed p. 6: the source says the second sum for the value of the t-th derivation on x_j has coefficients indexed by k; it should be indexed by t; affects nothing.
- **Misprint** in castilloDuarteLeytonLiendo2026 at Introduction, printed p. 1: the source says the normalised Nash blowup is the pair with the composite written η∘ν; it should be ν∘η; affects nothing.

## For the human reviewers

- **Licence.** `alperModuli` is read from the author's university page (`packages/NashBlowups/sources.toml`, `licence_class = "author-page"`); it is an unpublished book draft dated 19 August 2024, cited only for the route of §0.4.
- **Scope.** `nashModificationNotes2024`, the source with the largest share of locators (20 of 103), is an arXiv survey with no journal reference in the manifest; the headline theorems are also cited to `nobile1975`, `duarteNunezBetancourt2020` and `castilloDuarteLeytonLiendo2026`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "927feb50b386cf744822653946dd90a02a5d9ea0", "job": "REV-DESIGN-NashBlowups~9", "model": "fable", "worker": "chris-x80"} -->
