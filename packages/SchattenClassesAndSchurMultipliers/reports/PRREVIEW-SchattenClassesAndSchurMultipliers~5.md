# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 7a68d30)

**Verdict:** accepted

**Summary.** Accepted: no finding. The three small corrections of the previous review are repaired and the repairs are sound: the kernel unitary of §2.1 is now determined by the rank-one inner products (recomputed, including the conjugation), the Hardy-space interpolation of §10.4 is located in the Randrianantoanina paper at lines that state it, and the title and description agree with this head. Two format notes remain, neither blocking. Three points are left for the human reviewers, one of them the uniform constant in §10.4, which rests on one sentence of cgpt-2023.

## N01 — The Check of §7.3 still states Conjecture 1.8 of the source more weakly than the source does

Lines 1366–1368 say the source "conjectures that one exists" (a multiplier whose norm and completely bounded norm differ) on `S_p(ℓ²)`; lafforgue-delasalle-2011 lines 281–282 conjecture multipliers that are bounded and not completely bounded. "conjectures that bounded, not completely bounded ones exist" would match.

## N02 — The `*Needs:*` line of §2.1 omits §1.1, which the new construction uses

The existence argument (line 429) uses that the finite-rank operators are dense in `S₂`, which §1.2 (line 243) attributes to §1.1. Adding "§1.1" to the line at 474 would make the route's inputs complete.

## Previous findings

The previous report (at 4faf86f) had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: the description now says "It declares no supplier gap", places the kernel unitary in §2.1 and the martingale interpolation in §10.4, and the summary block says both "are built here".
- C02 — repaired: §10.4 cites "randrianantoanina-2021 Proposition 3.18 (line 1440) for adapted sequences, carried to `H_C^q` by the martingale-difference projection of lines 1335–1346"; the paper is in the References. The lines state what is claimed.
- C03 — repaired: §2.1 defines the kernel unitary "as the unique unitary with `T_k = u ⊗ v*` for `k(x, y) = u(x) conj v(y)`"; the V4.Core contract says its identification "is not used".
- N01 — repaired: the map `J g = ḡ` of §2.1 is gone with the three-unitary construction; `J` now names only the involution of the Conventions.
- N02 — not repaired: written again as N01 above.

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §2.1 kernel unitary (changed) | `{1,2}` counting; `u = u' = e₁`, `v = e₂`, `v' = i e₂` | `k = 1_{(1,2)}`, `k' = −i·1_{(1,2)}`, `⟨k, k'⟩ = −i`; `⟨u,u'⟩⟨v',v⟩ = conj(i) = −i` | `⟨E₁₂, −iE₁₂⟩_{S₂} = Σ_j ⟨E₁₂e_j, −iE₁₂e_j⟩ = −i`; the variant `⟨v, v'⟩` gives `i` | sound; `T_k = E₁₂` agrees with the Check of §2.1 |
| §2.1 general identity (changed) | arbitrary `u, u', v, v'` | `∫ conj(u)u' dμ · ∫ v conj(v') dν = ⟨u,u'⟩⟨v',v⟩` | `Σ_j ⟨e_j,v⟩⟨v',e_j⟩⟨u,u'⟩ = ⟨v',v⟩⟨u,u'⟩` by Parseval | sound; inner products agree, so the map is well defined on spans and isometric |
| §2.1 integral formula on products (cites the change) | `k = u(x) conj v(y)`, `g ∈ L²(ν)` | `(u ⊗ v*) g = ⟨v, g⟩ u` | `∫ u(x) conj v(y) g(y) dν = ⟨v, g⟩ u(x)` | sound |
| §10.4 Hardy-space interpolation (changed) | `p = 4`, `θ = 2/p = 1/2`; couple `(1, 2)` in Proposition 3.18 | `1/q = 1 − θ/2 = 3/4`, `q = 4/3 = p'` | `1/r = (1 − θ)/1 + θ/2 = 3/4`; `Π D y = D y` since `E_{n−1}(dy_n) = 0`; `1/(q−1) = 3 = p − 1` | sound for each `θ`; uniformity in `θ` rests on cgpt-2023 line 481 |

The rows for the untouched statements stand as in the previous review, of `4faf86f`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 5 (randrianantoanina-2021 lines 1335–1346, 1440–1445, 1460; cgpt-2023 lines 471–484, 480–481); the arXiv version named in the References (2108.06341v1) is the one the line numbers count (lines 2 and 5 of the text).
- Cross-roadmap citations resolved for the changed passages: VonNeumannAlgebras V2.RectangularL2 (README line 1027 on main: unique unitary sending `f ⊗ g` to `f(x)g(y)`, dense range, `μ.prod ν` for σ-finite measures, no separability) and V4.Core; OperatorTheory/OperatorIdeals OI-B32–OI-B35 (README lines 355–362 on main: Hilbert–Schmidt energy, Parseval expansion, basis independence).
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder; since 4faf86f only the README changed (25 insertions, 22 deletions).
- Automatic checks: all pass at this head. Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else; one `import Mathlib`, five `TauCeti.*` imports, no `set_option`. The elaborated types and the one-tactic probe stand as in the previous review, the file being unchanged.
- Pull request text: title and description read against this head; every sentence agrees (new roadmap, no gap, §2.1 from V2.RectangularL2 and rank-one inner products, §10.4 and §10.5, BochnerSpaces the one open supplier, AutomorphicSpectralTheory §0.9 only).
- Overlap check: read BochnerSpaces, TracesOnCStarAlgebras, SchrodingerOperatorsAndSpectralTypes, NoncommutativeIntegration, NoncommutativeGeometry, AmenableTracesOnCStarAlgebras, AutomorphicSpectralTheory (as in the previous review; the change adds no object); shared objects: the `L^∞` conditional expectation and divisibility of atomless measures (owner BochnerSpaces §7.4, §7.5, cited), completely bounded maps of operator spaces (owner CStarAlgebras C3.2, cited), Hilbert–Schmidt kernels (AutomorphicSpectralTheory §0.8 on standard Borel spaces; §2.1 here is the variant on arbitrary σ-finite spaces and says so).
- Source independence: changed passages only; 2 passages compared with 2 sources (randrianantoanina-2021, cgpt-2023), none shared (longest common run 3 words); no layer added, removed or reordered, so the arrangement stands as compared before: largest share lafforgue-delasalle-2011, 43 of the 120 source mentions counted at 4faf86f (this head adds three for randrianantoanina-2021); contents compared with lafforgue-delasalle-2011: independent.
- Research link: Layers 6–8 are Theorems 1.7, 1.18 and 1.19 of Lafforgue–de la Salle (2011); Layer 9 the transference of Caspers–de la Salle (2015) and Neuwirth–Ricard (2011); Layers 10–11 Theorem A of Conde-Alonso, González-Pérez, Parcet and Tablate (2023), which leads to Arazy's conjecture and Potapov–Sukochev (2011). Rests on the README's sources, read.

## Not verifiable

- reed-simon-1-1980 §VI.6 (§2.1): cited by locator only.
- jrwz-2020 (§10.4, `α_q ≤ K/(q − 1)`): read only through cgpt-2023 lines 483–484; no theorem number is given.
- The independence of `K` from `θ` in the Hardy-space interpolation of §10.4: randrianantoanina-2021 Proposition 3.18 gives equivalent quasi-norms without tracking the constant; only cgpt-2023 line 481 asserts it. The README says exactly this.
- The other locator-only texts stand as listed in the previous review.

## Source issues

- **Gap** in cgpt-2023 at the proof of Lemma 1.4, p. 10 (lines 480–481): the source says the Hardy-space inclusions hold with absolute constants by Section 3 of the Randrianantoanina paper; it should give the argument, since Proposition 3.18 there states equivalent quasi-norms with no constant tracked; affects the proof.

## For the human reviewers

- `design/plan.json` of the board package still lists the gaps `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`; the README at this head declares neither and builds both (§2.1, §10.4). An announcement of them to the suppliers would be out of date.
- §10.4 (README lines 1924–1934) asks for two estimates with a constant independent of the exponent. For the first, randrianantoanina-2021 Proposition 3.18 (line 1440) tracks no constant; uniformity rests on cgpt-2023 line 481. jrwz-2020 was not read.
- §2.1 builds the kernel of a Hilbert–Schmidt operator on arbitrary σ-finite spaces, while AutomorphicSpectralTheory §0.8 on main owns it on standard Borel spaces with separable `L²` (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 239–248). The scope section states the difference.
