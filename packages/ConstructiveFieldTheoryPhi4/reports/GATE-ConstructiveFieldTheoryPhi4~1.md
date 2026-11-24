# GATE-ConstructiveFieldTheoryPhi4~1: answers to the human review

Review answered: one review by kim-em on `b1331fd`, with two numbered points. The rest of the
review (the mapping to the source's definition, the check of RelativisticQuantumFieldTheory §7.3
item 1) asks for no change and gets no section. Repairs are in commit `f40ac5a`
("ConstructiveFieldTheoryPhi4: review repairs (real reachability scales; Gibbs/Ising and DLR
owners named in scope)"). It is not pushed.

## H01 (kim-em) — applied

The scales are now real throughout Layer 7. In `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/Suggested.lean`:

- `ReachabilityScheme.L : ℕ → ℕ` became `ℕ → ℝ` (line 609), and `le_R` became `L n ≤ (R n k : ℝ)` (line 621).
- `latticePoint`, `rescaledField` and `blockSecondMoment` take `L : ℝ` (lines 581, 594 and 587). The block of `blockSecondMoment` is now `box d ⌊L⌋₊`, that is `[−L, L]^d ∩ ℤ^d`.
- `gff_reachable` takes `L : ℕ → ℝ` with `hRL : L n ≤ (R n k : ℝ)` (lines 702–704).

In `README.md`:

- Conventions line 25: "the block of side L is `Λ_L = V_L`" became "for a real scale L ≥ 1 the block is `Λ_L = [−L, L]^d ∩ ℤ^d = V_{⌊L⌋}`".
- §7.1 (line 609) now says "for a real scale L ≥ 1".
- §7.2 (line 631) reads "real scales L_n ≥ 1 … integer volumes `R_{n,k} ≥ L_n`". It also says why: the source's lattice spacing 1/L is real (Aizenman–Duminil-Copin (1.8), p. 3, and the sentence after (1.13), p. 4; `aizenman-duminilcopin-2021` lines 111 and 151), so a real-scale scheme is in general not a reindexed integer one. Integer volumes lose no limit, because `[−R, R]^d ∩ ℤ^d = V_{⌊R⌋}` and only R → ∞ enters.
- §7.4 (line 667) now reads "arbitrary real scales L_n ≥ 1 … integer volumes".
- The Checks of §7.1 that assumed integer L were adjusted (lines 623–624): `(2L + 1)^d` became `(2⌊L⌋ + 1)^d`, and the tent Check now says "an integer scale L".
- One witness was added to the first of those Checks. At L = 3/2 the block is {−1, 0, 1}, so Σ = 3 and `⟨T_{1_Q,L}²⟩ = 1`. Rounding the block up to V_2 would give Σ = 5 and second moment 3/5.

Since integer-scale schemes are a subset of real-scale schemes, the downstream goals 8.1 and 8.2 now quantify over the full class that Aizenman–Duminil-Copin's Theorem 1.2 covers. No claim is made that the integer class of reachable fields is strictly smaller.

## H02 (kim-em) — applied

The boundary is now named from this side. **Scope and ownership** (line 732) assigns owners:

- DimerModelsAndLozengeTilings Layer 4 (§§4.1, 4.5 and 4.6, on main): specifications, DLR Gibbs measures and the tail σ-algebra.
- GibbsMeasuresAndTheIsingModel: Gibbs measures of finite-spin lattice systems with their existence and uniqueness criteria (Layers 1–3), the Ising plus and minus states with the uniqueness criterion (§§4.2–4.3) and Peierls' argument (§5.2). That roadmap uses no result of this one.
- The GHS inequality and Lee–Yang theory beyond 2.1 remain unowned. A search of main and of every open head found no owner for either.

The Downstream bullet (line 689) used to say that "phase transitions by the Peierls argument … build on Layers 1, 3, 4 and 5". The roadmap that owns Peierls uses none of those layers, so that was wrong. The bullet now lists the consumers that GibbsMeasuresAndTheIsingModel itself places beyond its scope:

- Lee–Yang theory beyond 2.1;
- the sharpness of the transition;
- the d ≥ 3 spontaneous magnetisation of the Ising plus state.

It says these build on Layers 1–5, and that GibbsMeasuresAndTheIsingModel uses no result of this roadmap.

## Verification

### Build

`lake build TauCetiRoadmap.ConstructiveFieldTheoryPhi4.Suggested`: `Build completed successfully (18258 jobs)`, with 29 `declaration uses 'sorry'` warnings and no errors.

### Gate

`gate ConstructiveFieldTheoryPhi4: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

### Dependency check

`depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines. Before the edit the count was 130 roadmaps and 1454 edges; naming GibbsMeasuresAndTheIsingModel added it to the graph as a node, and it is not a supplier.

### Citations

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. That covers the new GibbsMeasuresAndTheIsingModel §§4.2–4.3 and §5.2, and DimerModelsAndLozengeTilings §§4.1, 4.5 and 4.6.

### Elaborated signatures

`#check @name` lines for `latticePoint`, `blockSecondMoment`, `rescaledField`, `ReachabilityScheme.mk`, `ReachabilityScheme.fieldLaw`, `ReachabilityScheme.HasLimitLaw`, `ReachabilityScheme.Converges`, `exists_reachableField` and `gff_reachable` were appended to `Suggested.lean`, elaborated in one build, and then removed. The elaborated types match the README:

- `latticePoint : {d} → ℝ → (Fin d → ℤ) → EuclideanSpace ℝ (Fin d)`.
- `blockSecondMoment : … → ℝ → ℕ → ℝ`.
- `rescaledField : {d} → ℝ → ℕ → ℝ → …`.
- `ReachabilityScheme.mk` has `(J L : ℕ → ℝ)`, `∀ n, 1 ≤ L n`, `Tendsto L atTop atTop` and `∀ n k, L n ≤ ↑(R n k)`.
- `gff_reachable` takes `(L : ℕ → ℝ)` with the same three hypotheses.
- `exists_reachableField` is unchanged apart from `latticePoint 1` now taking `1 : ℝ`.

No section binder was lost: every changed declaration carries its binders explicitly.

### Ownership

GibbsMeasuresAndTheIsingModel was read at the head of its open pull request through `roadmaps show`. DimerModelsAndLozengeTilings was read on main. `roadmaps grep` over main and the 480 open heads found no owner of the GHS inequality. The repair states no new construction, so no ownership move was needed. No new source was needed, and `needs-references.toml` was not written.

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Block `Λ_L = [−L, L]^d ∩ ℤ^d = V_{⌊L⌋}` (Conventions; Lean `box d ⌊L⌋₊`) | d = 1, L = 1, 3/2, 2.999, 1/2; L < 0 | V_1 (3 points), {−1, 0, 1} (3), V_2 (5), {0} = V_0 with `⌊1/2⌋₊ = 0`; for L < 0 Lean gives {0} where the set is empty | holds for L ≥ 0; junk only for L < 0, which schemes exclude (`one_le`) | stated for L ≥ 1 |
| `blockSecondMoment`, J = 0, ρ_I (Check 1 witness) | d = 1, L = 3/2, R = 2 | Σ = ⟨(φ₋₁ + φ₀ + φ₁)²⟩ = 3 = `(2⌊L⌋ + 1)^d`; ceiling variant V_2 gives 5 | floor convention pinned | witness added to Check 1 |
| §7.1 API: `⟨T_{1_Q,L,Σ}²⟩ = 1` for R ≥ L | L = 3/2, R = 2 | `1_Q(x/L) = 1` iff abs x ≤ 1; sum over {−1, 0, 1} with second moment 3, so 3/3 = 1; with the ceiling block, 3/5 | holds for real L, because R ≥ L ≥ ⌊L⌋ puts the block inside V_R | none |
| §7.1 Check 1 limit `→ 2^{−d}∫f²` | d = 1, L = 10.5 | `(2⌊L⌋ + 1)/L = 21/10.5 = 2` = `2^d` | holds | `(2L + 1)^d` → `(2⌊L⌋ + 1)^d` |
| §7.1 Check 2 (tent, R = L and R = 4L) | integer L = 1, 2 | R = 4L: sums 1 and 9/2, i.e. `(2L² + 1)/(3L)`; normalised 1/3 and 9/30 = 0.3, tending to 1/3 | needs integer L (R = 4L must be an integer) | "an integer scale L" added |
| `ReachabilityScheme` with real L | L_n = n + ½, R_{n,k} = n + 1 + k; f(u) = max(0, 1 − abs u) at x = n | `le_R`: n + ½ ≤ n + 1 + k; `f(n/(n + ½)) = 1/(2n + 1)` while the integer scale n gives `f(1) = 0` | real-scale fields differ from integer-scale ones | type changed |
| "Integer volumes lose no limit" | real R = 2.7, L = 2.5 | ⌊R⌋ = 2 < L, yet V_2 ⊇ Λ_{2.5} = V_2; such k are finitely many per n because R → ∞ | holds after dropping finitely many k | sentence added |
| `gff_reachable` with real L | d = 1, m = 1, L = 3/2; boundary point q = (πL, 0, …) | variance `(2d + m²/L²)⁻¹ = (2 + 4/9)⁻¹ = 9/22 = 1/(2abs b)` with `b = −(1 + 2/9)`; `L²E(q/L) = 4L² = (4/π²)abs q²` | the substitution p = q/L and the bound hold for real L | type changed |
| §7.3 Check 3 (strict variance bound) | real L_n, `p_n = abs(Λ)^{−2}`, `abs(Λ) = (2⌊L_n⌋ + 1)^d` | lattice variance `Σ_x f(x/L)²/abs(Λ) → 2^{−d}∫f²`; expected number of ±a_n sites in the support is about `C L^d/abs(Λ)² → 0` | holds | none |
| §7.3 Check 2 (evenness, (δ₀ + δ₁)/2) | real L | `Σ = abs(Λ)/4 + abs(Λ)²/4`; `E[T_f] ≈ L^d ∫f/abs(Λ) → 2^{−d}∫f` | holds | none |
| 8.1 / 8.2 telegraph Check | `tanh J_n = e^{−c/L_n}`, real L_n | `J_n = artanh(e^{−c/L_n}) > 0`, finite for every real L_n ≥ 1 | holds | none |
| Scope: DLR owner | DimerModelsAndLozengeTilings on main | §4.1 is "Outside and tail σ-algebras", §4.5 "Specifications and Gibbs measures", §4.6 "The face property and closedness"; no hypothesis on the spin space in §4.5 | matches | named |
| Scope and Downstream: GibbsMeasuresAndTheIsingModel | its head | Layers 1–3 cover extremal Gibbs measures, existence and uniqueness; §4.2 the plus/minus states; §4.3 the uniqueness criterion; §5.2 Peierls; its scope says "No result of it is used here"; its *Beyond* names our §3.1 (d ≥ 3) and §2.1 (h ≠ 0) | matches; the old Downstream claim that Peierls builds on Layers 1, 3, 4, 5 contradicted it | named; bullet corrected |
| Downstream "builds on Layers 1–5" | Lee–Yang beyond 2.1 (Layer 2); sharpness (Layers 3–4); d ≥ 3 plus-state magnetisation (§3.1, Layer 5) | union = Layers 1–5 (the old "1, 3, 4 and 5" omitted Layer 2 although it listed Lee–Yang) | holds | "1, 3, 4 and 5" → "1–5" |
