# Review of HochschildHomologyAndHKR (pull request #2447 at 2c1724c)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:2489–2490 "Layers 1–5; §§6.2 and 6.4(a) (the antisymmetrisation map); §§7.1, 7.4 and 7.5 (not §6.4(d) or §7.6, which carry the smooth HKR input)". This agrees with README:798–799 and with the *Needs:* lines of §§8.1–8.5.
- R02 — repaired: the description now has "Layer 1, Hochschild complexes with bimodule coefficients; … Layer 8, polynomial algebras through the Koszul resolution". It also lists the suppliers by section and has the paragraph "Declared gap `gap:smooth-hkr-antisymmetrisation` on RefinedTraceMethods §1.9 … Only §6.4(d), and … §7.6 through it, use it".
- R03 — repaired: README:13–16 "an explicit sign dictionary identifies `C^•(A,A)` with the Hochschild cochains … and signs `ν_n` determined by Layer 8's chain differential identify `C_•(A,A)` with its Hochschild chains". README:49–50 has the same split, and README:726–727 now says "§6.3 proves that the comparison then holds with signs `ν_n`".

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Summary README:13–15 / §6.1 `Θ(δf) = (−1)^{p+1}[m,Θf]` | `p = 1`, `f = D`; `p = 2` | `p=1`: `[m,Θf](sa,sb) = s(f(a)b + af(b) − f(ab)) = +sδf`; `p=2`: `m{F}+F{m} = s(f(a,b)c − af(b,c) + f(ab,c) − f(a,bc)) = −sδf` | signs `+1, −1` = `(−1)^{p+1}`; the dictionary is explicit |
| README:15, 50, 724–727 / §6.3 chain signs `ν_n` | the Layer 8 differential is `c_n · s b s⁻¹`; `A = k`; `Mat₂(k)` | chain map ⇔ `ν_n = c_n ν_{n−1}`, so `ν_n = c₁⋯c_n`; inner face Koszul `(−1)^{i−1}` vs `(−1)^i`, cyclic `(−1)^{n−1}` vs `(−1)^n`; `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂` ⇒ `ν₁ = c₁` | determined by `c_n`, not explicit: the wording is correct |
| DGAInfinity Layer 8 chain sign (contract README:719–727) | main d68af47 DGAInfinity README:520–524 | "Hochschild chains … the bar differential", with no sign convention stated | `ν_n` cannot be computed, as the contract says |
| Layer 8 Dependencies (R01) | union of the *Needs:* lines of §§8.1–8.5, then their own *Needs:* | direct: §§2.1, 4.1–4.5, 6.2, 6.4(a), 7.1, 7.4, 7.5; transitive: §7.3 via §7.4 (README:2138), §6.1 via §6.2's comparison clause only; none reaches §6.4(d), §7.2 or §7.6 | consistent with README:798–799 |
| Gap usage (README; description) | every occurrence of `gap:smooth-hkr-antisymmetrisation`; plan.json prerequisites | README:217, 771, 1979 (§6.4(d)), 2026, 2244 (§7.6), 2284; in plan.json, only targets 6.4 and 7.6 have the prerequisite | "only §6.4(d), and §7.6 through it" holds |
| §6.4(a) `ε^cl` (cited in the Layer 8 dependencies) | `k[x,y]`, `n = 2`; `𝔽₂` | `b(1⊗x⊗y − 1⊗y⊗x) = x⊗y − 1⊗xy + y⊗x − y⊗x + 1⊗yx − x⊗y = 0`; `π₂ε₂(dx∧dy) = 2dx∧dy`, which is `0` over `𝔽₂` | a cycle without smoothness; (a) is free of the gap |
| §8.4 / `homological_hkr_mvPolynomial` | `m=1, n=2`; `m=2, n=2` over `𝔽₂`; `m=0` | `b(1⊗X⊗X⊗X) = 1⊗X⊗X² − 1⊗X²⊗X`, which matches `ε₂(dX∧dX²)=0`; `(∂₁∪∂₂)(X₁,X₂) − (∂₁∪∂₂)(X₂,X₁) = 1 − 0 = 1`; for `m=0`, `Ω⁰ = k = HH₀` and both sides vanish above degree 0 | true over every `k`, without the gap |
| §7.6 / `cohomological_hkr` (cited as carrying the gap) | `𝔽₂[x,y]`, `n = 2` | `⟨∂x,∂y⟩(x,y) = 1·1 − 0·0 = 1`; `[⟨∂x,∂y⟩] = [∂x∪∂y] − [∂y∪∂x] = 2Ψ₂ = 0`, while `Ψ₂(∂x∧∂y)` pairs to `1` | holds; *Needs:* README:2244 carries the gap |

The rows for the statements the diff does not touch stand as in the previous review, of `72a252e`.

- Gate: my `gate` run on this head reports every check 0 (`OK`). The worker's gate.md is `OK`, including `build=0`. Dependency check: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 8 `sorry` warnings and nothing else. The diff touches no Lean, so the previous `#check` comparison (14 declarations, no binder lost) and the one-tactic probe (0 of 8 close) stand; signatures.md also reports 0 lost binders.
- Source locators checked against the cached texts in the sections the changed text cites (6.1, 6.4, 7.4, 7.6, 8.4, 8.5): 13 in all. Ginz05: lines 1351–1375, 1130–1140, 2086, 2142 and 2187. HKR62: lines 210, 268–279, 301, 495, 522 and 548. AV20: lines 70 and 237–243. All support the claims as written.
- Cross-roadmap citations resolved this round: DGAInfinity Layer 8, DerivedModuleAlgebra and IntegralIwasawaTheory on main (d68af47). RefinedTraceMethods §§1.1 and 1.9 at its open head (91f73dc): §1.9 states smooth formality only for `ℚ ⊆ k`, so the gap is still minimal. KTheoryFiniteLocalFields §4.0 and EulerSystemsAndKolyvaginSystems §6.1 at their open heads; neither has reached main. `roadmaps grep` finds no roadmap that cites HochschildHomologyAndHKR, as the description says.
- Pull request text: the title, the summary block ("sign-explicit for cochains and up to a degree-wise sign for chains"), the layer list, the supplier list and the gap paragraph all agree with this head.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, DGAInfinity, NoncommutativeGeometry and DerivedModuleAlgebra (the results/headings list is empty). Shared objects and their owners:
- Hochschild cochains, cup product and braces of an algebra in degree zero: DGAInfinity Layer 8, cited; the bimodule-coefficient variant is kept here.
- Square-zero extensions and the Koszul complex: DerivedModuleAlgebra §§0.5 and 0.K.1, cited.
- Normalised scalar cochains: NoncommutativeGeometry N1.Cyclic.
- Quasi-free algebras and Hochschild dimension: CyclicHomologyLieHomologyAndQuasiFreeAlgebras Layer 4, which leaves HH and HKR to KTheoryFiniteLocalFields §4.0.

Source independence: changed passages only. 4 passages (README:13–16, 49–52, 724–727, 2489–2490) were compared with 2 sources (Ginz05 §6.6, HKR62 §§3–5); nothing is shared. Largest share Ginz05, 46 of 126 locators (the diff adds no locator). Contents not compared again: the diff adds, removes or reorders no layer.

## Not verifiable

- Ger63 §7 (§6.1): recorded as uncertified, so no legal text is cached.
- Loday98 §§1.3, 3.2, 3.4, Theorem 3.4.4 (§§6.4, 7.6, 8.4): uncertified.
- Weibel94 §9.4, Theorem 9.4.7 (§§6.4, 7.6, 8.4): uncertified.
- Mat86 §25 (§7.4): uncertified.

## Source issues

- **Error** in Ginz05 at (6.6.3), p. 29 (line 1368): the source says f∪g − (−1)^{pq} g∪f = d(f∘g) − df∘g − (−1)^p f∘dg. With the coboundary of line 1058, f = g = d/dx on k[x] at (x,x) gives 2 = −2. It should be g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg); affects the proof.
- **Misprint** in Ginz05 at (6.6.2), p. 29 (line 1363): the inserted g takes arguments a_i through a_{i+q}; it should end at a_{i+q−1}; affects nothing.
- **Misprint** in Ginz05 at §9.2, p. 45 (line 2146): the source writes the alternation sign as (−1) to the power sign σ; it should be sign σ itself; affects nothing.

## For the human reviewers

- none
