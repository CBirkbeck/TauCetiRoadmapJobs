<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2145#issuecomment-6643625260 -->
Red team round 2 pass b (claude) of 9f8ce66

Verdict: needs_changes

1. **F01** (P1) the fibre-finiteness input of §3.2 is attributed to a supplier section that does not state it, and its real-components half has no owner

   **Location.** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md` line 683: "Each fibre of `𝔤^∧ → [𝔤^∧]` is a union of finitely many coadjoint orbits, their number bounded independently of the fibre"; line 685: "the fibre count follows from Kostant's description of the fibres of the adjoint quotient and Whitney's finiteness of components of real algebraic sets"; line 687: "*Needs:* §3.1; NilpotentOrbits N1.1 (fibres of the adjoint quotient over ℂ)". The same bound is an API bullet of §3.1 (line 670) and feeds §3.4 (line 714, "`ω_λ` is a finite sum, by the uniform fibre count of §3.2").

   **Claim.** The proof route consumes two theorems: (K) over ℂ every fibre of `χ : 𝔤 → 𝔤//G` is a finite union of G-orbits with a bound depending only on G; (W) a real algebraic set has finitely many connected components, so each complex orbit meets the real points in finitely many G(ℝ)-orbits.

   **Witness.** `TauCetiRoadmap/NilpotentOrbits/README.md` lines 129–158 (N1): item 1 constructs `χ` and `𝒩 = χ⁻¹(0)` and proves closedness, equivariance and the nilpotency criterion; items 2–4 are the incidence variety and the zero Lie algebra. No item of N1, N0 (lines 93–127) or N2 (lines 160–196) says anything about the fibres of `χ` over a nonzero point; N2.4 gives finiteness of nilpotent orbits only. FormalConnectionsOpers F4.3 (#1056, lines 1519–1540) gives one regular orbit per fibre, not a count. (W) is cited to no roadmap, no pinned declaration and no manifest key; `roadmaps grep` for "fibres of the adjoint quotient" and "finitely many orbits" finds no owner, and there is no RealAlgebraicGeometry roadmap on main. nv21 p. 42 cites "[Kos2, Theorem 3 and Remark 16] and [Wh, §3]", where [Kos2] is Kostant 1963 (the manifest's `kostant63`, bibliography p. 206) and [Wh] is Whitney, Ann. of Math. 66 (1957).

   **Repair.** In §3.2 replace the *Needs* clause "NilpotentOrbits N1.1 (fibres of the adjoint quotient over ℂ)" by "NilpotentOrbits N1.1 (the quotient map χ); kostant63, Theorem 3 and Remark 16 (over ℂ each fibre of χ is a finite union of G-orbits, their number bounded in terms of G; cited by locator, uncertified); whitney57, §3 (a real algebraic set has finitely many connected components; cited by locator, uncertified)", and state the two inputs as background in the proof route in those words. Add to `sources.toml` the entry `whitney57` (H. Whitney, *Elementary structure of real algebraic varieties*, Ann. of Math. 66 (1957), 545–556, with the doi the sources service resolves, `locator_scheme = "section"`, `locator = "§3"`, `status = "uncertified"`, `cited_for = ["3.2"]`) and extend `kostant63.cited_for` to include "3.2" with the locator "Theorem 3 and Remark 16" (see S02). If the maintainer prefers a supplier, declare `gap:adjoint-fibre-finiteness` on NilpotentOrbits N1 with the `needs` sentence "over ℂ, for a reductive Lie algebra with its adjoint group, every fibre of the adjoint quotient `χ : 𝔤 → 𝔤//G` is a finite union of G-orbits, their number bounded by a constant depending only on G", identically in README and plan.json; (W) still needs the locator. The instance that refutes the current text: for 𝔤 = 𝔰𝔩₂(ℂ) the fibre of `χ(a,b,c) = a² + bc` over 0 is {0} ∪ (regular nilpotent orbit), two orbits, and over 1 a single orbit; neither count is stated by N1.1.

2. **F02** (P3) Kostant's regular-nilpotent criterion is attributed to the wrong Kostant paper

   **Location.** README line 1363, §8.4 proof route: "Kostant's criterion descends (kostant63)"; line 1537 (References): "kostant63 … cited for the route of §8.4 (Theorem 5.3, as cited in NV21 Lemma 27.5)"; `sources.toml` entry `kostant63`, `locator = "Theorem 5.3, as cited in nv21 Lemma 27.5, p. 183"`.

   **Claim.** The criterion "a nilpotent in a Borel nilradical is regular iff all simple-root components are nonzero" is Theorem 5.3 of Kostant, *Lie group representations on polynomial rings* (1963).

   **Witness.** nv21 Lemma 27.5, p. 183, cites "[Kos1, Theorem 5.3]"; the bibliography (p. 206) has [Kos1] = Kostant, *The principal three-dimensional subgroup and the Betti numbers of a complex simple Lie group*, Amer. J. Math. 81 (1959), 973–1032, and [Kos2] = the 1963 polynomial-rings paper. Theorem 5.3 of the 1959 paper is the regular-nilpotent criterion; the 1963 paper is the one nv21 p. 42 cites for the fibre count (S01).

   **Repair.** Add a manifest entry `kostant59` (B. Kostant, *The principal three-dimensional subgroup and the Betti numbers of a complex simple Lie group*, Amer. J. Math. 81 (1959), 973–1032, with the doi the sources service resolves, `locator_scheme = "theorem"`, `locator = "Theorem 5.3"`, `status = "uncertified"`, `cited_for = ["8.4"]`); in §8.4 and the References replace "kostant63" by "kostant59"; change `kostant63` to `locator = "Theorem 3 and Remark 16, as cited in nv21 §6.1, p. 42"`, `cited_for = ["3.2"]`, and its References line accordingly. One work, one key: the two Kostant papers are different works.

3. **F03** (P3) the display attributed to NV21 Lemma 12.1 is not the lemma's display

   **Location.** README line 759, §3.9 proof route: "`Δ_h^{N/2} Op_h(⟨ξ⟩^{−N}) ∈ 1 + hΨ^0` (NV21 Lemma 12.1)".

   **Claim.** Lemma 12.1 states this inclusion.

   **Witness.** nv21 Lemma 12.1, p. 87, defines `b(ξ) := ⟨ξ⟩^{−N}` and `A(h) := Δ_h^N Op_h(b)²`, and proves `A(h) ∈ 1 + hΨ^{−1}` with `A(h)`, `A(h)^{−1}` of norm O(1) for small h; the single-factor form with `N/2` is the variant used in the proof of Theorem 12.2(ii), p. 89 (`b := ⟨ξ⟩^{−N/2}`, `tr Δ_h^{−N/2} ≪ tr Op_h(b)²`). The round-1 repair note also says the lemma "uses `Δ_h^{N/2}Op_h(b)`", which it does not.

   **Repair.** Replace the parenthesis and display by: "`Δ_h^{N} Op_h(⟨ξ⟩^{−N})² ∈ 1 + hΨ^{−1}` with inverse of norm O(1) (NV21 Lemma 12.1, p. 87); the same composition formula gives `Δ_h^{N/2} Op_h(⟨ξ⟩^{−N})² ∈ 1 + hΨ^{−1}` for `⟨ξ⟩^{−N/2}` in place of `⟨ξ⟩^{−N}`, which is the form used for `tr Δ_h^{−N/2}` (proof of Theorem 12.2(ii), p. 89)". Orders check on both: 2N − 2N = 0 and N − N = 0; on G = ℝ at t = 1/h with N = 2 the squared form gives `(1 + h²t²)² · ⟨ht⟩^{−4} = 4 · ¼ = 1`.

4. **F04** (P3) SmoothBanachRepresentations is cited by labels it does not use

   **Location.** README line 121: "SB2 (smooth vectors defined by smooth orbit maps, with the word-seminorm Fréchet topology), SB3 (the differentiated action and integration by parts) and SB6 (Dixmier–Malliavin …)"; the same labels at lines 238, 322 and 334.

   **Witness.** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md` at #1145 numbers its targets "Layer 2 … §2.1 Finite regularity and real smooth topology" (line 183), "Layer 3 … §3.1 Real Lie and enveloping action … §3.4 Modular integration by parts" (lines 225–252) and "Layer 6: Full Dixmier–Malliavin with support control, §6.1" (line 364); the string "SB" followed by a digit occurs nowhere in that file. The content cited matches those layers.

   **Repair.** Replace "SB2" by "Layer 2 (§2.1)", "SB3" by "Layer 3 (§§3.1, 3.4)" and "SB6" by "Layer 6 (§6.1)" at the four locations, keeping the parenthetical descriptions.

5. **F05** (P3) one gap sentence differs between the README and plan.json

   **Location.** README line 181 (gap:unitary-xi-polynomial-tail) versus `design/plan.json` gap `unitary-xi-polynomial-tail`.

   **Witness.** The plan's `needs` ends at "`|h| = max(‖R(h)‖, ‖R(h^{−1})‖)` the algebraic norm of §5.8."; the README's contract sentence continues "equivalently `∫_{|h| > X} Ξ_G Ξ_H dh ≪ X^{−η}` for X ≥ 1. The log-weighted estimate of §2.7 does not imply it: it bounds this tail only by `(1 + log X)^{−d}`." The other 21 contract sentences are identical in both files (compared mechanically). The round-1 repair report records the mismatch as left in place.

   **Repair.** The intake announces the plan's sentence. Keep the two identical: end the README's "What GanGrossPrasadUnitaryGroups must provide (gap:unitary-xi-polynomial-tail):" sentence at "the algebraic norm of §5.8." and move "Equivalently `∫_{|h| > X} Ξ_G Ξ_H dh ≪ X^{−η}` for X ≥ 1; the log-weighted estimate of §2.7 bounds this tail only by `(1 + log X)^{−d}`." to a following sentence outside the contract.

6. **F06** (P3) the Hilbert-space trace is cited to a consumer adapter instead of its owner

   **Location.** README line 9 ("the Hilbert-space trace (AutomorphicSpectralTheory §0.9)"), line 143 ("§0.9 (the trace on trace-class operators, cyclicity and `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS`)") and the *Needs* lines of §§3.7, 3.8, 3.9, 8.1.

   **Witness.** AutomorphicSpectralTheory §0.9 at #925 opens "Consume VonNeumannAlgebras V4's complex operator trace on the OperatorIdeals trace-class carrier" and restates that API. `TauCetiRoadmap/VonNeumannAlgebras/README.md` at #1041, V4.Core (line 887), owns the trace `Tr(x) = Σ ⟪b_i, x b_i⟫`, its basis independence, the cyclicity `Tr(xh) = Tr(hx)` for `h ∈ S₁(H)` and for Hilbert–Schmidt pairs, and the pairing with `S₁(H)`. VonNeumannAlgebras is an open pull request adding a new roadmap folder, so it may be cited.

   **Repair.** Add a subsection "### From TauCetiRoadmap.VonNeumannAlgebras" with "V4.Core: the trace on trace-class operators, its basis independence, cyclicity against bounded operators and against Hilbert–Schmidt pairs, and `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS` for Hilbert–Schmidt B, C", and cite "VonNeumannAlgebras V4.Core" where the trace is consumed (lines 9, 143, 745, 753, 767, 1322), keeping AutomorphicSpectralTheory §0.9 only for its kernel comparison if that is used.

7. **F07** (P3) the local period form at split places is used but the section that supplies it is not cited

   **Location.** README line 849, §4.5 *Needs*: "GanGrossPrasadUnitaryGroups §2.7 (unitary convergence) and §3.3 (local period form)"; line 1437, §9.1: "a nonzero global period would give a nonzero local invariant form and hence, by the local period-form inputs, nonzero `H_σ` and `H_{σ′}`"; line 1445, §9.1 *Needs*.

   **Claim.** The cited inputs give, at every place of R, that a distinguished tempered pair has a nonzero local relative character.

   **Witness.** GanGrossPrasadUnitaryGroups §3.3 (#1404, line 629) is stated "for any relevant nonsplit characteristic-zero local pair" and says "the split model is handled separately". In the global unitary setting (Layer 8) the auxiliary places p ∈ R∖{q} include places split in E, where `(G_p, H_p) = (GL_{n+1}(F_p), GL_n(F_p))`, and q may be a complex place with the same split pair. The split statement is GanGrossPrasadUnitaryGroups §5.1a (line 1009): for F nonarchimedean, ℝ or ℂ and tempered `GL_{n+1}(F) × GL_n(F)`, the H-integral of matrix coefficients equals `λ(W) conj(λ(W′))`, "is nonzero and has a positive nonzero diagonal value on some smooth tensor".

   **Repair.** In the GanGrossPrasadUnitaryGroups contract and in the *Needs* of §4.5 and §9.1 add "§5.1a (the split adjacent Whittaker identity: nonvanishing and positivity of the local period form for tempered `GL_{n+1} × GL_n` over every characteristic-zero local field)", and in §9.1 write "by the local period-form inputs (GanGrossPrasadUnitaryGroups §3.3 at nonsplit places, §5.1a at split places, gap:orthogonal-local-period-form in the orthogonal case)". On SO(3) ⊃ SO(2) nothing changes; on `U(2) ⊃ U(1)` at a split p-adic place the pair is `GL₂ ⊃ GL₁` and §3.3 says nothing.

Head reviewed: `9f8ce66`, the checkout of the pull request. Files read in full: `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md` (1541 lines), `Suggested.lean` (256 lines, 13 declarations), `design/plan.json` (22 gaps), `sources.toml`, and the three earlier reports (r1a, r1b, FIX-r1). The cached nv21 extraction is still empty (its header says "no PDF text extractor"), so every nv21 locator below is checked against a Ghostscript extraction of the cached publisher PDF made in the job's scratch directory and is cited by printed page and label, never by a line of the empty cache. No Lean command, git write, source-file edit or post was made.

## Round-1 findings at this head

Each earlier finding, with the repaired passage and its status.

| Finding | Repaired passage at this head (quoted, ≤ 40 words) | Status and witness |
|---|---|---|
| a-F01 (§0.6 Check) | README line 328: "On the trivial representation on an infinite-dimensional Hilbert space, `Δ = 1` and the identity is smoothing, so infinite dimension alone does not prevent smoothing." | repaired; §3.9 line 765 now says "irreducible tempered π", where the identity is indeed not trace class |
| a-F02 (§4.5 trace) | line 841: "`H_σ(v₁ ⊗ v̄₂) = tr σ̄(f) = tr σ(f ∘ inv)` … (correcting `tr σ(f)` in NV21 (18.6), p. 122)" | repaired; recomputed on SO(3) ⊃ SO(2): definition 1, `tr σ̄(f)` 1, `tr σ(f)` 0 (nv21 p. 122, (18.6) prints `tr σ(f)`) |
| a-F03 (§4.5 invariance) | line 843: "invariant under conjugation by H … It is not invariant under independent left and right translations." | repaired; left translation by θ = π gives −1, conjugation 1 |
| a-F04 (§1.4 weights) | line 396: "`(a_ω)_h^∨(x) = e^{−ωx/h} A^n φ_ω^∨(Ax)` … the weighted summand `⟨ω⟩^m a_ω` carries the additional factor `⟨ω⟩^m`" | repaired; matches nv21 (7.9) p. 51; (7.10) there indeed omits the weight |
| a-F05 (§4.2 square) | line 800: "`T_π = Op_h(b)* Op_h(b) = Op_h(b)²` … this square, not `Op_h(b)` itself, is positive" | repaired; nv21 p. 139 squares (`T_π := Op_h(b)²`) |
| a-F06 (§4.1 metric) | line 783: "Choose an Ad(K)-invariant positive definite inner product on 𝔨 and let B(𝔨) be an orthonormal basis for it" | repaired; SO(3) rescaled basis gives diag(3,6,6), rotation basis 3·1 (recomputed) |
| a-F07 (§3.9 exponent) | line 759: "`Δ_h^{N/2} Op_h(⟨ξ⟩^{−N}) ∈ 1 + hΨ^0` (NV21 Lemma 12.1)" | repaired in substance (orders N − N = 0); the attribution is imprecise, see S03 |
| a-F08 (Lemma 14.6 headline) | Suggested.lean lines 229–254: `jointFibre_nonempty_orthogonal`, `jointFibre_nonempty_unitary`, no coprimality hypothesis | repaired; instantiated below (ι = ∅, Fin 1, Fin 2, Fin 3) |
| a-F09 (character gap) | lines 83–85: EndoscopicTransferAndUnitaryTraceComparison §2.3(a)–(b) subsection; gap slug absent from plan.json | repaired; §2.3 at #999 states (a) trace class and (b) locally integrable, real-analytic on strongly regular elements |
| a-F10 (spinor gap) | lines 109–111: gap restricted to anisotropic spaces over finite extensions of ℚ_p; four pinned Tau Ceti theorems cited | repaired; all four names exist at the pin (`Spin/SpinorNorm/Isotropic.lean:56`, `Spin/Real/SpinorNorm.lean:103,127,153`) |
| a-F11 (multiplicity) | line 1437: "a Σ is a summand of this decomposition, so an isomorphism class of global multiplicity m contributes m summands (NV21 §25.3, p. 168)" | repaired; nv21 p. 168 sums over representatives whose Hilbert sum is L²([H]) |
| a-F12 (undefined L) | line 1437: "`P_Σ(T, S′)` … with S′ variable … `L(Π, Σ)` as the unique scalar with `P_Σ(T, S′) = L(Π, Σ) H_σ(T) H_{σ′}(S′)`" | repaired; weight-0/weight-1 Check at line 1452 recomputed |
| a-F13 (five Checks) | lines 32, 357, 432, 720, 1527 | repaired; shifted Gaussian −i e^{−π/16} vs +i e^{−π/16} recomputed; Heisenberg `C_1(a,b) = ½ξ(Z)∂_Xa∂_Yb`; `∂₁b(1,R) = −2e^{−1}`; shells `O(A^d)`; torus limit {0} of mass 1 |
| a-F14 (version note) | sources.toml `version_note`: "The arXiv versions are not used for locators: their theorem and lemma numbering differs" | repaired; Theorem 26.4 is at printed p. 177 of the published text |
| a-F15 (separation) | line 616: "`dist([ξ], hλ_π) ≥ h^δ` or `dist([ξ|_𝔥], hλ_σ) ≥ h^δ`, distances being taken in the fixed generator coordinates" | repaired; nv21 (10.8) p. 81 uses the euclidean distance of the §9 coordinates |
| a-F16 (p-adic Ξ) | line 149: gap:tempered-xi-bounds "over ℝ, ℂ or a nonarchimedean local field … special maximal compact in the nonarchimedean case"; §4.3 line 817 derives p-adic convergence | repaired; plan.json `neededBy` lists 4.1 and 4.3 |
| a-F17 / b-F01 (GIT) | lines 89–91: gap:hilbert-mumford-linear and gap:free-stable-quotient-bundle on AlgebraicModuliForArithmeticGeometry (merge-order line 35) | repaired; both slugs in plan.json with identical `needs`; no roadmap on main or at an open head states affine GIT (grep "Hilbert–Mumford", "GIT quotient") |
| a-F18 (open orbit) | line 963: "H has an open orbit with trivial stabilizer on the flag variety of G × H … (NV21 Lemma 13.3, p. 95)" | repaired; Lemma 13.3 is at printed p. 95 with exactly this statement |
| a-F19 (cotangent) | line 50: `KaehlerDifferential.exact_mapBaseChange_map`, `Algebra.H1Cotangent.exact_δ_mapBaseChange`, `Algebra.IsStandardSmooth.subsingleton_h1Cotangent`, `exteriorPower` | repaired; all found at the pin (`RingTheory/Kaehler/Basic.lean:781`, `RingTheory/Kaehler/JacobiZariski.lean:552`, `RingTheory/Smooth/StandardSmoothCotangent.lean:137`, `LinearAlgebra/ExteriorAlgebra/Basic.lean:79`) |
| a-F20 (components) | line 1302: "X = [G]/K … is the finite disjoint union of the compact quotients `Γ_j∖(G × G′)` … The source chooses R so large that `G(F)G_R K = G(𝔸)`" | repaired; nv21 §25.1 p. 167 asserts `G(F)·G_R·K = G(𝔸)` for its choice of R |
| a-F21 (regular differential) | line 81: FormalConnectionsOpers F4.3 subsection; §3.5 line 702 | repaired; F4.3 at #1056 constructs the principal slice `f + V_can`, its isomorphism onto the adjoint quotient, "meeting each regular geometric orbit once", and the regular locus by minimal centralizer dimension |
| a-F22 (Taylor) | line 381: "(ii) For the BCH exponential `Ω(x,y,ζ) = e^{{x,y}ζ}` … every fixed ζ-derivative of `Ω − Σ_{j<J} Ω_j` is `O(ρ^J)`" | repaired; nv21 Lemma 7.6 p. 48 has `ρ := max(|x|,|y|,|x||y||ζ|)` and (7.3) for Ω |
| a-F23 (four Checks) | lines 472, 939, 1381, 1394 | repaired; telescoping bound `2‖ψ^∨‖₁`; `c ∈ k^×`; `p + q ≥ 3`; "identity component of the centralizer … a > 0" matches nv21 Example 27.6 p. 183 |
| a-F24 (third §1.6 Check) | line 434: two coordinate axes, product `e^{−ξ₁²−ξ₂²}` Schwartz; replacing b by 1 gives value 1 at (0, R) | repaired |
| a-F25 (docstring inventory) | Suggested.lean lines 42–46: §§4.2, 4.4, 4.6 (Lemmas A.3, A.4, 18.1) named as not statable | repaired |
| b-F02 (gap wording) | line 199: gap:relative-character-positivity spells out `H_σ(v₁ ⊗ v̄₂) = Σ_{u ∈ B(σ)} ∫_H …` | repaired; identical text in plan.json |
| b-F03 (three locators) | line 1437 "§§28.1–28.2"; line 1470 "§§29.2–29.3"; line 107 "2F … real rows … 2G compactness of Spin at the real place" | repaired; nv21 §28 has 28.1 (p. 187) and 28.2 (p. 188); §29 has 29.1–29.3 (p. 190); OrthogonalSpinGroups 2F table rows and 2G checked on Completed main |
| b-F04 (§7.7 Check) | line 1275: "`f_n(1) = n + 1 > 2` for n ≥ 2, and for odd n every exponent is odd, so `f_n ≤ −1` on the negative interval" | repaired; `f_n(e^{iθ}) = sin((n+1)θ)/sin θ` recomputed |

No repair introduced a new error that I could find; the one imprecision a repair left behind is S03.

## Verified sound

- Declarations read and instantiated: 13 (6 definitions with real bodies, 7 admitted theorems). No `set_option`, no `lemma`, no sorry'd data, no `True` placeholder, no `#eval`/`#print`; the imports are `Mathlib` plus two existing Tau Ceti modules. Every Lean name occurs in the README; every backticked own name of the README is declared in the file. Each definition has at least three discriminating README Checks (counted: 4, 4, 3, 3, 3, 3).
- README targets read: all 75 numbered sections, the global setting, Conventions, the 22 contract subsections and the worked examples.
- nv21 locators verified against the published text (label and printed page): about 100, of which about 60 read in full (Lemmas 2.1, 3.3–3.6, 5.1, 5.3–5.5, 7.3, 7.6, 7.10, 7.14, 8.1, 8.8–8.10, 9.2, 9.4–9.6, 10.1, 10.3–10.4, 11.2–11.6, 12.1, 13.3, 14.4, 14.6–14.8, 16.4, 17.3–17.4, 18.1, 19.1, 19.5, 19.8, 22.4, 23.2, 24.1–24.2, 24.6, 24.8, 24.10, 26.2–26.3, 27.3–27.5, 27.8–27.12, 30.3; Theorems 4.5, 5.6, 5.8, 6.1, 6.3, 7.4, 11.1, 12.2, 14.2, 14.5, 16.7, 17.1–17.2, 19.3–19.4, 22.2, 24.5, 26.4–26.5, 27.1, 27.7, 29.1, 30.1; Definitions 4.3, 7.2, 7.9, 16.5, 24.3, 30.2; Remarks 6.4, 14.9, 16.6, 18.2, 22.1, 24.4; §§2.1–2.5, 4.2, 6.1, 7.6, 9.8, 17.1–17.3, 22.2–22.3, 23.7–23.8, 25.1–25.7, 26.1–26.3, 28.1–28.2, 29.1–29.3). Every page cited by the README agrees with the running heads. The rallis-schiffmann locator (Theorems 6.1 and 17.1) is as nv21 Remark 14.9 cites it.
- README source-correction claims confirmed in the text: (7.10) omits the weight; Lemma 7.14 prints `(−h)^j`; (8.3) lacks `h^{−|α|}`; Lemma 8.10 asserts operator-norm convergence; the `h^η S^m_δ` display after Definition 4.3 prints `m−α`; (6.1) prints the test function on 𝔤; p. 43 prints "d the maximal dimension"; (18.6) prints `tr σ(f)`; (19.16) lacks `h^j`; (22.10) lacks `O(h^N)`; the Lemma 24.10 example fails; the proof of Lemma 27.3 asserts spinor surjectivity on SO_{n−1} for n − 1 ≥ 2; the last containment in the proof of Lemma 27.10 is `s ⊆ 𝔤`; (26.7) says "linear map"; the Cauchy–Schwarz line on p. 191 prints `tr(T₁*T₂)`; Lemma 10.1's `b₂` carries `+q⋆₁b₁`; (10.12) evaluates G-invariants at `λ_σ`; §A.1 takes `κ = −cΣx²`. The one correction I do not count as a source error is §4.2's remark on Lemma A.3 (the printed `Δ^{−2N}` comparison is true, only weaker).
- Sibling citations resolved at main or at the stated heads: 87 section citations across 25 supplier roadmaps (EndoscopicTransferAndUnitaryTraceComparison §2.3; AutomorphicSpectralTheory §§0.9, 0.13, 0.14, 0.48, 4.5, 4.7; AutomorphicFormsOnReductiveGroups §§0.3, 2.1–2.4, 2.7 and `integrable_height_rpow_neg`; SmoothRepresentationsOfLocalGroups SR.0.3, 0.4, 1.1, 1.4, 2.2, 2.3, 3.1, 3.2, 3.3 (its tempered-support statement is owned and constructed there), 3a.2; SmoothRepresentationsOfLocalGroupsPartII §§0.6, 2.6, 2.7; ReductiveGroupsPartII RG2.3.6, RG2.4.2 (Iwahori factorization of `G_{x,r}`), RG2.4.4; AdelicAlgebraicGroups §§2.2, 2.4, 3.4, 3.5, 4.2 (strong approximation for simply connected semisimple groups, line 4573); GeometryOfNumbersAndQuadraticArithmetic 4.2.5 `ratner_measure_classification`, `ActionErgodicKernel`, `borel_density_unipotent_generated`; GanGrossPrasadUnitaryGroups §§2.6, 2.7, 3.3, 4.2; NilpotentOrbits N0–N2; FormalConnectionsOpers F4.3; SymplecticGeometry R1–R3, T4; OperatorIdeals `hilbertSchmidtEnergy`, `hilbertSchmidtEnergy_indep`, `schattenFamily`; DifferentialGeometry 5.2, 5.5; GeometricMeasureTheory G2; OrthogonalSpinGroups 1D, 1E, 2F (table rows), 2G, 2H, 3C, 3F; NoncompactQuantumSymmetry M0 items 1–2; UnboundedOperators UO-A01–A03, UO-E01; PseudodifferentialOperators P3, P5; LieGroups Layers 0, 1, 3 (`bch`), 5, 7, 9; LieHighestWeight Layers 3, 5, 6, 7 (`pbwSymmetrization`, Chevalley restriction); CompactGroups Layers 0, 5, 6). Each is on main or earlier in the merge order, or an open pull request adding a new folder.
- Pinned declarations located: 32 Mathlib and Tau Ceti names, including `Matrix.specialOrthogonalGroup` (an `abbrev` for `specialUnitaryGroup` under the local instance `starRingOfComm`, membership `Aᵀ * A = 1 ∧ det A = 1`), the global `GL` notation, `MvPolynomial.zeroLocus`, `Polynomial.divByMonic`, `RealRMK.integral_rieszMeasure`, `mulInvariantExp` (needs `LieGroup I (minSmoothness ℝ 3) G`, supplied by the local instance), `TauCeti.ContRepresentation.IsUnitary`. Mathlib and Tau Ceti have no Cotlar–Stein, no Plancherel measure and no Harish-Chandra Ξ, so the gaps asking for them are minimal.
- Gaps: all 22 slugs present in plan.json and the README with a named supplier; 21 `needs` sentences identical (S05 is the exception); every supplier is earlier in the merge order or on main. The dependency check:

```text
depcheck: 234 roadmaps, 2121 edges, 0 problem(s)
```

  (exit 0; no UPWARD, CYCLE or moved line for this roadmap.)
- Policy: the diff against `origin/main` touches only the package folder (11 files); no pull-request number or process narrative in the README or the docstrings; every target carries a locator.
- Ownership: object searches ("Cowling–Haagerup–Howe", "fibres of the adjoint quotient", "finitely many orbits", "Hilbert–Mumford", "GIT quotient") over main and all open heads found no second owner of the calculus, the GGP stability theory or the relative asymptotics; the one owner found and not cited is VonNeumannAlgebras V4.Core (S06).

### Adversarial pass (computed)

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| `IsQuantizationCutoff` (§0.5) | E = 0, U = univ, χ ≡ 1; χ ≡ 0; χ ≡ 2; U = ∅ | all six clauses hold; `0 = 1` near 0 fails; `2 ∈ [0,1]` fails; `tsupport ⊆ ∅` fails | determines the object |
| `quantize` (§0.5) | ℝ, `Π_t`, χ = 1 on supp 𝓕b; shifted Gaussian | `∫ 𝓕b(x)e^{itx}dx = b(t/2π)`; at x = ¼: `−i e^{−π/16}` (𝓕) vs `+i e^{−π/16}` (𝓕⁻) | sign pinned; `Op_h` = `∫χ(hy)𝓕b(y)π(exp hy)` after x = hy |
| `exists_norm_quantize_le` | E = 0 (G discrete): value `b(0)v`; zero symbol; `M < 0` | `‖b(0)v‖ ≤ M‖v‖` with C = 1; `0 ≤ 0`; j = 0 clause forces M ≥ 0 | quantifier order keeps C, N free of π, h, b |
| `IsZariskiClosedMatrixSet` | ideal 0; unit ideal; `{x₁₂ ≠ 0}` over infinite k | all matrices; ∅; not closed (a vanishing polynomial is 0) | native predicate |
| `ggpBlock` | ι = ∅; h = [2]; h = 0 | [1]; diag(2,1); diag(0,1) | fixes e |
| `ggpSpectralPolynomial` | sizes 0, 1, 2, 3 | 1; `X/X = 1`; `X² + a²`; `X² + a² + b² + c²` | forced root removed only in odd size |
| `InvariantlyEquivalent` | Γ = {1}; 𝔰𝔬₂ under SO₂; GL₂ on `[[0,1],[0,0]]`, 0 | equality; equality (`aJ ≁ −aJ`); equivalent (both `X²`) | Pfaffian retained, quotient not conjugacy |
| `isStable_iff_isCoprime_orthogonal` | ι = ∅: x = 0; ι = Fin 1; ι = Fin 2 with (a; b, c) | `gcd(1,1) = 1`, orbit {0}, stabilizer {1}; `gcd(X²+a², 1) = 1`; coprime iff `b² + c² ≠ 0`; isotropic (b,c) ≠ 0: stabilizer trivial but orbit `{t·(b,c)}` not closed; b = c = 0: stabilizer SO₂ | both directions hold |
| `isStable_iff_isCoprime_unitary` | ι = ∅; ι = Fin 1 `[[a,b],[c,d]]` | `gcd(X−a, 1) = 1`; resultant `−bc`; bc = 1 closed hyperbola, stabilizer 1; b = 1, c = 0 orbit not closed; b = c = 0 stabilizer GL₁ | both directions hold |
| `stableFibre_isTorsor_orthogonal` | ι = ∅; Fin 1; Fin 2 (`b² + c² = s − a′² ≠ 0`); Fin 3 dimension count | {0}; {y}; conic ≅ G_m-torsor via (λu, v/λ); `6 − (2 + 1) = 3 = dim SO₃` | torsor on all controls |
| `stableFibre_isTorsor_unitary` | Fin 1: `bc = −(a² − sa + p) ≠ 0`; Fin 2 with `z = J₂(0)`, `y` of eigenvalues 1, 2, 3 | hyperbola, unique `h = b′/b`; `x_H = 0` impossible (`X ∣ charpoly`), `x_H ~ J`, fibre `{d = 6, b₂c₁ = 6, b₁c₁ + b₂c₂ = −11}` of dimension 2 = dim of the stabilizer of J, acted on simply transitively by `a + bJ` | torsor, and `x_H` regular as Lemma 14.7 says |
| `jointFibre_nonempty_*` | GL₂ ⊃ GL₁ y = z = 0; SO₃ ⊃ SO₂ s = a′²; SO₄ ⊃ SO₃ | x = 0 ∈ {bc = 0}; `b = c = 0`; `⟨v,w⟩ = Pf`, `|w|² = Q − q(z)` solvable with v isotropic when q(z) = 0 | nonempty without stability |
| §0.1 j | SU(2) basis `−iσ_a/2`; ax+b | `(sin(θ/2)/(θ/2))²`; `|(1−e^{−x₁})/x₁|`, `j(−x) = e^{x₁}j(x)` | evenness = unimodularity |
| §1.1–1.2 `C_1` | linear `a = ξ(x₀)`, `b = ξ(y₀)` | `C_1(a,b) − C_1(b,a) = ξ([x₀,y₀])`, `C_2 = 0` (no `|γ| = 0` monomial beyond 1) | `[dπ(x₀), dπ(y₀)] = dπ([x₀,y₀])` |
| §1.4 moments | `m = −2, h = 1, ω = R` | `‖φ^∨‖₁` constant in R; `A = h^{δ−1}⟨ω⟩`, moment `A^{−r}` | consistent with (7.9) |
| §1.7 sign | `ψ(x) = x`, `a_h^∨(x) = h^{−n}a^∨(x/h)` | `x a_h^∨ = h (∂a)_h^∨` | `+h`, (−h)^j is a misprint |
| §1.9 Check | `a_K = θ(ξ)ψ(2^{−K}ξ)` | `‖a_K^∨‖₁ ≍ ∫_{2^{−K}}^{1} dx/x ≍ K`; telescoped all-plus sum ≤ `2‖ψ^∨‖₁` | discriminates |
| §1.10 Check | Heisenberg, orthonormal X, Y, Z | six orderings of `X²Y²` sum to `6X²Y² − 12ZXY + 3Z²`; `X²Y² + Y²X² − 2sym(X²Y²) = Z²` | `sym((1+|ξ|²)²) = Δ² − Z²` |
| §1.12 Check | M = 3, N = 5, δ = ¼ | `(5 + 3)/(1 − ½) = 16` | J as stated |
| §2.2 | `e^{itx}`; SL₂ `I(ν)` | dual −it, conjugate −it, Hermitian dual it; `{±ν}` vs `ρ − ν` | ρ-shift needed |
| §3.1 / §3.3 | SO(3) sphere radius r, KKS = area/r | mass `4πr/(2π) = 2r`; `∫_O e^{xξ}dω = 2 sin(r|x|)/|x|`; `θ_π j^{1/2} = sin((2l+1)|x|/2)/(|x|/2)` | equal at r = l + ½; at x = 0 gives 2l + 1 |
| §3.6 | Sp₄(ℝ) holomorphic discrete series | d = 4, GK dimension 3 < 4, not generic | empty limit |
| §3.9 | ℝ, N = 2, t = 1/h | `Δ_h^{N/2} = 2`, `⟨ht⟩^{−N} = ½`, squared form `4·¼ = 1` | both normalizations consistent |
| §4.1 | K = SO(3), L = 1, 2; torus rank r; rescaled basis | `3 > √3`; `(1+l+l²)² ≥ (2l+1)²` with equality at l = 0, 1; `2L > r`; diag(3,6,6) | invariant metric needed |
| §4.2 | finite S₃, U = {1} | `1 + 1 + 4 = 6 = vol(U)^{−1}` | Plancherel normalization |
| §4.5 | SO(3) ⊃ SO(2), compact H, dim σ = 2 | `tr σ̄(f) = 1`, `tr σ(f) = 0`; `H_σ = ½` on a rank-one projection; `Σ_σ dim σ · (dim σ)^{−1}tr(T|π[σ]) = tr T` | §4.6 consistent |
| §5.5 | 𝔤𝔩₁; 𝔰𝔩₂ | `γ_H = β_H`; `⟨µ, α^∨⟩ dH` | scaling by c, not c^{−1} |
| §6.1 | `d_M = dim S` for SO₃⊃SO₂, GL₂⊃GL₁, SO₄⊃SO₃, U(3)⊃U(2) | 1 = 1, 1 = 1, 3 = 3, 4 = 4; in general `dim G − dim H = rank G + rank H` | prefactor cancels |
| §6.3 | GL₂ ⊃ GL₁ over ℝ | tail `∫_{|t|>X}|t|^{−3/2}(1 + log|t|)dt ≍ X^{−1/2}log X` | any η < ½ |
| §7.4 | GL₂(ℚ_p), unramified reducible series | with `GL₂(ℤ_p)`: trivial has fixed vectors, Steinberg none | good subgroup needed |
| §8.7 | definite real V_H in indefinite V; binary anisotropic V_H over ℚ_p | θ(SO(V_H)) trivial vs {±1}; index 2 norm group; χ trivial on G(F), H(𝔸), G(𝔸)^+ by Hilbert reciprocity | exclusion necessary |
| §9.1 | two isomorphic summands, mass 1 each; weight-0 T′ | 1 + 1 = 2 (isotypic would give 4); `H_{σ′}(T′) = 0`, weight-1 S′ gives 1 | L determined |
| §9.5 | Haar on H_q scaled by c | `H_σ ↦ cH_σ`, `L ↦ c^{−1}L`, affine measure `↦ c^{−1}` | both sides scale alike |
| Global setting | nv21 §25.7 | `(SO_{n+1}, SO_n)` with n ≥ 2, `τ(G) = τ(H) = 2`, G_p compact for p ≠ q, G_q quasi-split, π generic | README matches the source |

## Not verifiable

- Lean elaboration and the `#check @name` audit: no Lean command is permitted in this pass and the worker's `signatures.md` reports a failed elaboration (a missing Tau Ceti `.olean`). The 13 signatures were compared with the README by reading only; the round-1 repair report states that the file elaborated with 7 `sorry` warnings.
- rossmann78, kostant78, barbasch-vogan80, rangarao72, kostant63 (and the Kostant 1959 and Whitney 1957 texts named in S01–S02): paywalled, settled as uncertified; their locators were checked only through nv21's citations.
- SmoothRepresentationsOfLocalGroupsPartII: `roadmaps show` finds no copy on main or at an open head; the sections SRU.0.6, 2.6, 2.7 were checked against the unsubmitted package copy on this worker, which may not be the head the intake will read.
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- **Error** in nv21 at proof of Lemma 27.3, printed page 182: the source says the spinor norm is surjective on SO_{n−1}(F_v) for n − 1 ≥ 2; it should be restricted to n − 1 ≥ 3 at finite places and exclude real places with definite V_H; affects the proof (the README's §8.7 route and the binary self-twist exclusion repair it).
- **Misprint** in nv21 at proof of Lemma 27.10, printed page 185: the source says the last containment is `𝔰 ⊆ 𝔤`; it should be `𝔰 ⊇ 𝔤`; affects nothing.
- **Error** in nv21 at the example after Lemma 24.10, printed page 166: the source says `f_n = α^{−n} + α^{−n+2} + … + α^n` satisfies the lemma for large n; it should be dropped, since `f_n(1) = n + 1 > 2` and `f_n ≤ −1` on the negative interval for odd n; affects nothing (the proof uses Stone–Weierstrass).
- **Misprint** in nv21 at (18.6), printed page 122: the source says `H_σ(v₁ ⊗ v̄₂) = tr σ(f)`; it should be `tr σ̄(f)`; affects a stated result (the rank-one formula).
- **Misprint** in nv21 at Lemma 7.14, printed page 56: the source says the coefficient is `(−h)^j`; it should be `h^j`; affects a stated result.
- **Misprint** in nv21 at (8.3), printed page 57: the source says `∂^α a_h^∨(x) ≪ h^{−dim 𝔤}(|x|/h^{1−δ})^{−N}`; it should carry the extra factor `h^{−|α|}`; affects a stated result.
- **Error** in nv21 at Lemma 8.10, printed page 61: the source says the Cotlar–Stein series converges in operator norm; it should say strongly; affects a stated result (the proof of Proposition 8.7 uses only strong convergence).
- **Misprint** in nv21 at (7.10), printed page 51: the source says `∫|a_h^∨||x|^n ≪ A^{−n}` for a localized symbol of order m; it should carry the factor `⟨ω⟩^m`; affects a stated result.
- **Misprint** in nv21 at the display after Definition 4.3, printed page 34: the source says `⟨ξ⟩^{m−α}`; it should be `⟨ξ⟩^{m−|α|}`; affects nothing.
- **Misprint** in nv21 at (6.1), printed page 42: the source says the test function lies in `C_c^∞(𝔤)`; it should be `C_c^∞(𝔤^∧)`; affects nothing.
- **Misprint** in nv21 at §6.2, printed page 43: the source says d is the maximal dimension of a coadjoint orbit; it should be half of it; affects nothing.
- **Misprint** in nv21 at (19.16), printed page 128: the source says `Σ_j ∫ D_j a`; it should be `Σ_j h^j ∫ D_j a`; affects a stated result.
- **Gap** in nv21 at (22.10), printed page 147: the source says `|k_h(σ) − H_σ(Op_h(a)²)| ≤ |H_σ(Op_h(a₂)²)|`; it should add `O(h^N)` where `a₂` has no fibre mass; affects a stated result.
- **Misprint** in nv21 at (26.7), printed page 178: the source says `ξ ↦ [δ_ξ]` is a linear map; it should say G-equivariant map; affects nothing.
- **Misprint** in nv21 at Lemma 26.3, printed page 176: the source says the k-fold map is linear; it should say k-multilinear; affects nothing.
- **Misprint** in nv21 at proof of Theorem 29.1, printed page 191: the source says `|tr(T₁T₂)|² ≤ tr(T₁*T₂)tr(T₂*T₂)`; it should be `tr(T₁*T₁)`; affects nothing.
- **Misprint** in nv21 at proof of Lemma 10.1, printed page 79: the source says `b₂ := (−q⋆₂b₀ + q⋆₁b₁)/q`; it should be `−(q⋆₂b₀ + q⋆₁b₁)/q`; affects the proof.
- **Misprint** in nv21 at (10.12), printed page 81: the source says the G-invariant scalar is `p(hλ_σ)`; it should be `p(hλ_π)` for G-invariants; affects the proof.
- **Error** in nv21 at §A.1, printed page 136: the source says `κ = −cΣx²` for large c has properties (i)–(iii); it should be a high power of `1 − Σx²`, since the Casimir multiple vanishes on the trivial K-type and fails (ii), (iii) for rank ≥ 2; affects the proof of Lemma A.1(ii).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9f8ce66b719ba06e65bbf01e4e03af6c59ccdd2a", "job": "RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b", "model": "fable", "worker": "chris-x17"} -->
