<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6897735244 -->
Review (claude) of 1e1f436

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.1 uses §§2.2, 2.5 and 3.1, which its *Needs:* line, the layer's Dependencies and plan target 5.1 omit

   **Location.** `packages/LieGroupsPartII/design/README.md` §5.1, last API bullet: "This applies under the component condition: `L = Z_{K_L}(𝔞_L)·L⁰` fixes `V ⊆ 𝔞_L`"; the next paragraph: "which carries a reductive Cartan datum with the component condition (§3.1)". *Needs:* reads "§1.1; LieGroups Layers 3, 9"; Layer 5 Dependencies read "Layer 1; …"; `design/plan.json` target 5.1 has `target:1.1` only.

   **Claim.** A target's *Needs:* line lists what its statement and its route need, item by item.

   **Witness.** The bullet needs the definition of the component condition (§2.5) and `𝔷_𝔭 ⊆ 𝔞` (§2.2(d)); the comparison needs §3.1 for the datum on `L_{Π'}`. On `ℝ ⋊ C₂` the condition fails and `F = 0 ≠ V = ℝ`, so the clause is not empty.

   **Exact repair.** In §5.1 write "*Needs:* §1.1; for the component-condition clause §§2.2(d), 2.5; for the comparison with RealSemisimpleLieGroups §4.3, §3.1; LieGroups Layers 3, 9". In Layer 5 Dependencies write "Layers 1–3". In plan 5.1 add `target:2.2`, `target:2.5`, `target:3.1`. Tested: 2.2, 2.5 and 3.1 precede 5.1 and none needs 5.1 (their prerequisites are 1.1–2.5), so no cycle arises, and "How to read the build" is unaffected (Layer 5 still depends only on earlier layers).

2. **F02** (P3) "Downstream consumers" states uses that the named roadmaps do not make

   **Location.** `design/README.md`, "Downstream consumers": "**QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.** It uses the minimal parabolic datum of the real place (§3.5)"; "KleinianGroups and FuchsianOrbifoldsPartII use the minimal parabolic of `SO₀(n, 1)`, `SL_2(ℝ)` and `PU(1, n)` (§3.3)". Same entries in `design/plan.json`, `consumers`.

   **Claim.** These roadmaps consume §§3.3 and 3.5.

   **Witness.** At their open heads: QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups names parabolic subgroups three times, all for groups over nonarchimedean fields ("normalized parabolic induction and Jacquet modules", "every parabolic containing the minimal Levi", "`P = MN` a standard parabolic" with `H` over a nonarchimedean local field), and takes its real groups from LieGroups Layers 0, 1, 3, 5, 7, 9. KleinianGroups has one occurrence ("the parabolic elements"); FuchsianOrbifoldsPartII speaks of parabolic words and cyclic groups only. `roadmaps grep --fixed LieGroupsPartII` finds no citation anywhere. AutomorphicSpectralTheoryPartII does fix "a minimal parabolic `P=MAN`", and takes it from AutomorphicFormsOnReductiveGroups §§2.1–2.4.

   **Exact repair.** Replace the first three bullets by statements of what this roadmap makes available, with no assertion about another roadmap's text:

   - "**Archimedean representation theory.** The minimal parabolic `P = MAN` of §§3.3 and 3.5, finite central covers and disconnected real points included, is the group from which principal series are induced; AutomorphicSpectralTheoryPartII fixes such a `P = MAN` for the real-algebraic class of AutomorphicFormsOnReductiveGroups §2.3a."
   - "**Rank-one geometry.** For `SO₀(n, 1)`, `SL_2(ℝ)` and `PU(1, n)` the group `P` of §3.3 is the stabilizer of a boundary point, the group containing the parabolic elements studied in KleinianGroups and FuchsianOrbifoldsPartII."

   Delete the QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups bullet and its `consumers` entry in the plan; reword the other three `consumers` entries in the same way. Tested on the refuting instance: after the change no sentence says that the orbit-method roadmap uses a real minimal parabolic.

3. **F03** (P3) §6.1 does not say how it differs from RealSemisimpleLieGroups §4.4, which states its real-group case

   **Location.** `design/README.md`, From Tau Ceti: "Nothing there says that conjugate standard parabolics are equal; that is §6.1 here"; §6.1: "if `g P_J g⁻¹ = P_{J'}`, then `J = J'` and `g ∈ P_J`". The contract bullet for RealSemisimpleLieGroups §4.4 lists the dynamical parabolic, parabolic subalgebras and the criterion only.

   **Claim.** A kept variant says in one clause how it differs from what another roadmap states.

   **Witness.** RealSemisimpleLieGroups §4.4 (open head): "every parabolic subgroup is `gQ_{Π'}g⁻¹` for a unique `Π'` (its **type**) and some `g`; two parabolic subgroups are conjugate iff they have the same type". For its Tits system `(P, N_G(𝔞))` this is the second bullet of §6.1.

   **Exact repair.** Add to §6.1, after the three bullets: "RealSemisimpleLieGroups §4.4 states the uniqueness of the type for the Tits system of a minimal parabolic datum with the component condition; this section is the statement for an arbitrary Tits system, with no topology or finiteness, and with the membership conclusions `g ∈ P_J` and `J ⊆ J'`." Add "the uniqueness of the type" to the §4.4 contract bullet as stated there and not consumed. Tested: for `GL_3(k)` over any field (the §6.1 Check) the abstract form applies where §4.4, a statement on real Lie groups, does not; for `SL_3(ℝ)` both give that the `(2, 1)` and `(1, 2)` block parabolics are not conjugate.

Three findings, all P3 (none P1 or P2); each carries a repair, so the verdict asks for changes and a fix round applies them. Both round-7 findings are repaired. No mathematical statement was found false, vacuous or over-claimed: the repaired passages, the 15 sampled targets and the six pinned headline statements were recomputed (table below). The dependency gate shows no UPWARD or CYCLE line. Every supplier citation was resolved again at main or at the supplier's open head, and every cited library declaration at the pins. No gap is declared and none is needed. Elaboration: not available (this lane does not elaborate; the design stage has no `Suggested.lean`). Only the two review deliverables were written; `sources.toml` is unchanged and no request file was written.

## Previous findings, checked individually

Identifiers are those of round 7. None was marked "not actionable in this package".

| Round-7 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), "Iwasawa datum" used for two objects | Conventions: "An **Iwasawa pair** `(D, 𝔞)` is a reductive Cartan datum with a maximal abelian subspace `𝔞 ⊆ 𝔭`, that is, an Iwasawa triple without its positive system"; §2.5: "an Iwasawa pair `(D, 𝔞)` satisfies the **component condition**"; §3.1: "Let `(D, 𝔞)` be an Iwasawa pair"; §2.1: "Let `(D, 𝔞, Σ⁺)` be an Iwasawa triple"; heading "2.3 The base `IwasawaData` of an Iwasawa triple". "Iwasawa datum" and "Iwasawa choices" occur nowhere in the README or the plan. | Repaired |
| F02 (P3), locator of the component condition and axiom (v) | §2.5: "Prove (Knapp 2002, Ch. VII §§2, 5)"; plan 2.5 and 7.3: "Ch. VII §§2, 5 (reductive groups and their axioms; structure of M)". | Repaired |

The passages the repair added, recomputed: "every pair extends to a triple" (`𝔞 = 0`: `Σ = ∅`, `H₀ = 0`; `SL_3`: `H₀ = diag(2, 0, −2)` has root values `±2, ±4, ±2`; `BC₁`: `λ(H₀) = 1` gives `{λ, 2λ}`); "the subgroups `(K, lieExp 𝔞, lieExp 𝔫)` satisfy `IsIwasawaTriple`" (LieGroups `Suggested.lean:592`: `∃ D : IwasawaData I G, D.K = K ∧ D.A = A ∧ D.N = N`; §2.3 sets `N = Nplus = lieExp 𝔫`); "depend on the pair only" (`GL_2`: `M` the four sign matrices and `|W_G| = 2` for both positive systems, while `𝔫 = ℝE₁₂` or `ℝE₂₁` differs and is rightly not listed). The repaired patterns elsewhere: no second undefined name for the triple or the pair was found; the other section-level Knapp locators agree with the References entry (§2 axioms and `⁰G`, §4 Bruhat, §5 `M`, §7 parabolics).

## Verified sound

### Coverage

All 776 lines of the README, the 33 plan targets (8 layers, no `gaps`) and the 8 manifest entries were read. No maintainer notes exist. Pattern search over the README: no process word, pull-request number, date, machine path, HTML anchor, LaTeX delimiter, `lemma`, `set_option`, "optional" or "deferred"; "Lemma" occurs once, in a source locator. No sentence says the roadmap follows a source; the eight layers are named by their mathematics and each ends with Examples and Dependencies. Checks per definition in the README: §1.1 (8), §2.5 (6), §3.2 (4), §3.4 (3), §5.1 (7), §6.2 (4), §6.3 (6), §7.1 (6), §7.2 (9), §7.3 (5). The plan's target graph has no forward and no missing `target:` prerequisite (33 targets scanned). No route-specific shortcut, algorithm, copied passage, sorry'd data or re-planned roadmap.

### Adversarial table

`θ` is transpose-inverse in matrix examples; `S = ((0,1),(1,0))`, `J = ((0,1),(−1,0))`, `d = diag(1,−1)`, `R_φ = ((cos φ, −sin φ),(sin φ, cos φ))`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 datum and Checks (sampled) | `SU(2)`; `ℝ/ℤ`; `ℝ^n ⋊ O(n)`, `n = 1, 0`; `O(1,1)` | `diag(i,−i)·J·diag(−i,i) = −J`, so `J ∈ 𝔭`, `exp(πJ) = −1 ∈ K`: polar map not injective; `lieExp(1) = 0`; `n = 1`: Lie algebra central `ℝ`; `K = {diag(±1,±1)}`, 4 components, `K ∩ G⁰ = {1}` | Holds; both negative controls fail the base datum |
| §1.1 `dθ` Cartan on `[𝔤,𝔤]`; restriction to `G⁰` | general | for `X ∈ 𝔭`, `ad X` `B_θ`-symmetric, Killing `tr((ad X)²) > 0` unless `ad X = 0`; skew on `𝔨` gives `< 0`; `π(G⁰)` open connected `= H⁰` | Holds |
| §1.2 (sampled) | `ℝ ⋊ ℤ/2`; `ℝ × S¹`; `SL_2`; step 2 | `θ_a` multiplicative: `ε = ε' = 1` gives `0 = a − a`; `K_a = {(0,0),(a/2,1)}`; `c_gθ₀c_g⁻¹(t,1) = (a − t, 1)` for `g = (a/4, 0)`; cocycle `Y((0,1)) = −a/2 = −2Z`, `Z = a/4`; `θ_c² = (t, s − 2ct + 2ct)`; shear: `σθ_cσ⁻¹ = θ₀`; `c_aθc_a⁻¹ = c_{aaᵀ}θ`, `hhᵀ = diag(4, 1/4)`; `τ(k) = k·lieExp(2Y)`, `e^{2 ad Y} = 1` with real eigenvalues forces `ad Y = 0`; `lieExp(X)` and `lieExp(Z)` commute | Holds; converse holds since `Ad(G⁰)` is trivial on `𝔷` |
| §2.1 | `BC₁`; `BC₂` | `Π = {λ}`, `Σ_Π = Σ`; `Σ ∩ span(e₂) = {±e₂, ±2e₂}` | Holds |
| §2.2 (sampled) | `GL_2`; scalar `H`; `O(1,1)` | `R_φSR_φᵀ = ((−sin 2φ, cos 2φ),(cos 2φ, sin 2φ))`; `tr(·d) = −2 sin 2φ`, maximum `2` at `φ = −π/4` with value `d`; `tr S = 0` constant; `B([Z,Y],H) = B(Z,[Y,H])` | Holds; regularity needed |
| §2.3 (sampled) | fields of `IwasawaData` at LieGroups `Suggested.lean:509–589`; `SL_2`; `GL_2` | all 30 proof fields are covered by the eight bullets (`chamber_span`, `chamber_normalizer_cover`, `chamber_split_center` included); `1 + 1 + 2 = 4 > 3`; chamber `h₁ ≥ h₂` contains `±1` | Holds |
| §2.4 (sampled) | `SL_2`; `O(1,1)`; normalizer | `E₁₂ + dθE₁₂ = J`, `exp(−(π/2)J) = ((0,−1),(1,0))`, acts by `−1` on `ℝd`; `exp(−(π/4)J)` sends `d` to `S ∉ 𝔞`; `(|W_G|, |W(Σ)|) = (2, 1)`; `e^{2 ad X}` preserving `𝔞` gives `[X, 𝔞] ⊆ 𝔞 ∩ 𝔨 = 0` | Holds |
| §2.5 | `O(1,1)`, `GL_n`, `Aut(𝔰𝔩_3)`, `O(4)`; axiom (v) step 3 | `(|W_G|, |W(Σ)|)`: `(2,1)`, `(n!,n!)`, `(12,6)`, `(1,1)`; `W_G = S₃ × {±1}` for `Aut(𝔰𝔩_3)`; `u = k + ip` commuting with `i(𝔞∩𝔰)`: `i[k,a] − [p,a] = 0` splits, `k ∈ 𝔪∩𝔰`, `p ∈ 𝔞∩𝔰`, then `k ∈ 𝔱` as `𝔱 = (𝔷∩𝔨) ⊕ (𝔱∩𝔰)` | Both directions of each equivalence hold |
| §3.1 (sampled) | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`; `𝔰 = 0`, `𝔰 = 𝔞`; component clause | `dπ(Ad(g)s) = Ad(π(g))dπ(s)`; `L = GL_2 × GL_1`, 4 components, roots `±(e₁−e₂)`; `L = G`, `L = MA`; `k₁k₀ ∈ N_{K⁰}(𝔞) ∩ L` acts by an element of `W(Σ)` fixing `𝔰`, a product of `s_β`, `β|_𝔰 = 0`, realized in `(K∩L)⁰` | Holds |
| §3.2 (sampled) | `SL_2`; centre | `(−1)·diag(2, ½)·((1, −3/2),(0,1)) = ((−2, 3),(0, −½))`; central `z = k·exp X`: `exp(2X)` central, `X ∈ 𝔷_𝔭`, `Ad(k) = 1`, `k ∈ M` | Holds |
| §3.3 | `GL_2`; `O(1,1)`; (d), (f) | nilradical of `Lie(P)` has dimension 2, `𝔫` dimension 1, `B`-orthogonal of `Lie(P)` is `ℝE₁₂`; `[G:P] = 2` with `Σ = ∅`; `k = man` and Iwasawa uniqueness give `K ∩ P = M` | Holds; (f) needs the condition |
| §3.5 (sampled) | `GL_2`; `O(1,1)`; `ℝ × S¹` | `M ∩ G⁰ = M ∩ K⁰`: `{±1}` of 4; `P ∩ G⁰ = A = G⁰`; `𝔭₀ ≠ 𝔭₁`, `P = G` for both | Holds; the conjugacy clause of RealSemisimpleLieGroups §3.1 is restricted to equal split centres, as the text says |
| §4.1–4.2 | general; `SL_3`; `SU(2,1)`; `O(1,1)`; `Aut(𝔰𝔩_3)` | `2m + n + dθn = 0` in `𝔪 ⊕ 𝔫 ⊕ 𝔫̄`; `dim P = 0 + 2 + 3 = 5`, cells `5,6,6,7,7,8`; `1 + 1 + 3 + 3 = 8`; open cells: `w₀·Stab(Σ⁺)`, numbers `2`, `2`; `a_t u a_{−t} → 1` as `t → −∞` since `β(H₀) > 0` | Holds over `W_G` |
| §5.1 (sampled) | `ℝ ⋊ C₂`; `ℝ² ⋊ C₂`; `GL_n`, `n = 0`; `L_{Π'}` | `ℓ(−t) = ℓ(t)` gives `ℓ = 0`, `F = 0`, `⁰L = L`; `(3,1) ↦ (2,2)`, residual `(1,−1)`; `h(g) = (log|det g|/n)·1`, at `n = 0` all spaces `0`; `𝔷(𝔩_{Π'}) ∩ 𝔭 = {H : β(H) = 0, β ∈ Σ_{Π'}} = 𝔞_{Π'}`; `l·exp(f)·l⁻¹ = exp(Ad(l)f) = exp f` | Holds; `exp F` central, `A_L` not |
| §6.1 (sampled) | from bullet 1; `GL_3(k)`; `S = ∅` | `gP_Jg⁻¹ ⊆ P_{J'}` gives `gBg⁻¹ ⊆ P_{J'}`, `g ∈ P_{J'}`, `P_J ⊆ P_{J'}`, `J ⊆ J'`; a permutation outside `W_J` moves `B` out of `P_J`; `B = G` trivial | Holds; pinned `Parabolic/Normalizer.lean:66, 77, 83` and `Classification.lean:114, 146` have only overgroup and normalizer statements (R03 for the open supplier) |
| §6.2 | `GL_2`; `Aut(𝔰𝔩_3)`, `X₀ = diag(1,0,−1)`, `X₁ = diag(3,1,−4)` | block `E_μ → E_λ` scaled by `e^{t(μ−λ)}`; `n_w ↦ n_w·exp(t(X − w⁻¹X))`; `−w₀X₀ = X₀`, `−w₀X₁ = diag(4,−1,−3)`; stabilizer of `X₀` in `S₃ × {±1}` is `{1, −w₀}` | Holds |
| §6.3 (sampled) | `𝔤𝔩_2`; `O(1,1)`; `Aut(𝔰𝔩_3)`; compact | trace-zero upper triangular: dimension 2 against 3 and 4, `1 ∉ 𝔮`; `[𝔤,𝔤] = 0`: criterion reads `𝔮 ⊇ 𝔷`; `σ𝔮_{{α₁}} = {X₁₃ = X₂₃ = 0}` = stabilizer of `ℝe₃` = `Ad(w₀)𝔮_{{α₂}}`; `𝔰𝔲(2)`: only `𝔤` | Both directions agree on every instance |
| §7.1 (sampled) | `𝔟`; `ℝE₁₂`; `{diag(2^k, 2^{−k})}` | `ℝ·1 ⊕ ℝE₁₂` of dimension 2 < 3; abelian, reductive, but `K = {1}` and symmetric part `0`; tangent algebra `0` | Holds; all three fields needed |
| §7.2 (sampled), `dynamicLevi_decomposition` | `GL_2`, `X = diag(1,0)`; skew `X`; non-symmetric `X = ((1,1),(0,0))`; `OᵀSL_2(ℤ)O` | entries `a, e^{−t}b, e^{t}c, d`; `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`; rotations: unipotent part `{1}` by periodicity; `gX = Xg = ((2,2),(0,0))`, `θ(g) = ((½,0),(−½,1))`, `S⁻¹θ(g)S = ((0,1),(−½,3/2))`, entry `e^t`; `OgOᵀ = ((2,3),(1,2))`, `det = 1`; `(OlOᵀ)₁₂ = 2√3·(√3/4) = 3/2 ∉ ℤ` | Holds; symmetry, transpose stability and normalization are each needed where stated |
| §7.3 (sampled), `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le` | `O(1,1)`; `SL_3`; `GL_2` | `G = P ⊔ dP`, `P ∩ K = {±1}`; eigenvalues of `ad diag(1,1,−2)`: `0,0,3,3,−3,−3`, sum of dimension `2 + 2 + 2 = 6`; equal sums iff equal root zero sets iff equal centralizers; `Y = 0`, `Y = 1`: same centralizer, same sum | Hold with no component condition |
| `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le`, `exists_titsSystem_linear` | `GL_n`, `H₀ = diag(n,…,1)`; `O(1,1)`; `O(p,q)`; compact `G` | entries `g_ij e^{−t(h_i − h_j)}`: `N` upper unitriangular; `exp(−tY)·d·exp(tY) = exp(−2tY)·d` unbounded; `P` normal, so no `s` with `sPs⁻¹ ≠ P` and `S = ∅` cannot generate `W = ℤ/2`; block determinants `(Πε·det k', Πε)`: 4 of 4 for `p > q ≥ 1`, 2 of 4 for `p = q ≥ 1`; compact: `B = N = G`, `S = ∅` | Hold under the condition; fail on `O(1,1)` as the negative control says |
| §8.1 (sampled) | `SO(2,1)`; `𝔾_m × SO(2)`; `𝐇(ℝ)⁰` | `k = diag(A, ε)`, `det A = ε`, commuting with `E₂₃ + E₃₂`: `A = diag(1, ε)`, `M = {1, diag(1,−1,−1)}`; only `c = 0` algebraic; open subgroup closed, `θ`-stable, connected | Holds |
| Sign conventions | `GL_2` | `[H, E₁₂] = (h₁ − h₂)E₁₂`; `λ(t)gλ(t)⁻¹ = ((a, tb),(t⁻¹c, d))`, `λ(e^{−s}) = exp(−sX_λ)`; RealSemisimpleLieGroups `dynamicalParabolic` is `IsCompact (closure (range …))` over `t ≥ 0` with `lieExp(−tX)·g·lieExp(tX)` | The three conventions agree |

### Sources and the seeded sample

| Target | Outcome |
| --- | --- |
| 1.1, 1.2, 2.2, 2.3, 2.4, 3.1, 3.2, 3.5, 5.1, 6.3, 7.1, 7.2, 7.3, 8.1 | Locators are `knapp2002`, `warner1972`, `wallach1988` by chapter and section: settled as uncertified, not readable. The statements were checked mathematically (table). |
| 6.1 | `borel-tits1965` line 1931: Corollaire 5.18 (ii), scan page 48, printed 101 (manifest: printed = scan + 53). It is the statement for the rational points of a reductive group, derived there from the abstract theorems; the abstract form is the uncertified `bourbaki-lie4-6` Ch. IV §2. As cited. |
| 6.2 (not sampled, read with 6.1) | `borel-tits1965` line 1488: Théorème 4.15, printed pp. 90–91: parabolics from an ordering of the roots of a split torus, with the centralizer as common Levi of the two opposite ones. An analogue, as the README says. |
| Conventions | `brown-rodriguezhertz-wang2022` lines 136–141 (formula (1), span of `Π'`), lines 142–144 (classification); `brown-fisher-hurtado2022` lines 515–519 (span of `−Π'`). As cited. |
| Consumers | `bradlow-collier-garciaprada-gothen-oliveira2024` lines 72–74. As cited. |

The author flagged no locator as unverified. All eight works the README cites are in the manifest, and every `cited_for` id is a plan target.

### Library declarations opened at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Mathlib: `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`Analysis/InnerProductSpace/JointEigenspace.lean:137`), `Matrix.exp_transpose`, `Matrix.exp_conj` (`Analysis/Normed/Algebra/MatrixExponential.lean:113, 185`), `unitarySubgroup` (`Algebra/Star/Unitary.lean:273`), `Matrix.orthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318`), `Matrix.symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:102`), `DoubleCoset.doubleCoset` (`GroupTheory/DoubleCoset.lean:37`), `RootPairing.Base` with `coroot_mem_or_neg_mem` (`LinearAlgebra/RootSystem/Base.lean:68, 75`), `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/WeylGroup.lean:55`), `Module.End.eigenspace` (`LinearAlgebra/Eigenspace/Basic.lean:423`), `connectedComponentIn` (`Topology/Connected/Basic.lean:505`), `LieAlgebra.derivedSeries` (`Algebra/Lie/Solvable.lean:69`). No `Bornology (Matrix …)` instance exists (`Analysis/CStarAlgebra/CStarMatrix.lean:733` records it as missing), as the contract says.

Tau Ceti: `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`, `[PreconnectedSpace G]`), `TitsSystem` with fields `subgroupB`, `subgroupN` (`GroupTheory/TitsSystem/Basic.lean:50–54`), `bruhatCell` (`Bruhat/Basic.lean:100`), `standardParabolic`, `mem_standardParabolic_iff` (`Parabolic/Basic.lean:48, 152`), `coxeterSystem` (`Coxeter.lean:178`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`, hypotheses at line 148), `glTitsSystem`, `glTitsSystemWeylGroupMulEquivPerm` (`…/Diagonal/TitsSystem.lean:195, 270`, `[Field k] [Nontrivial kˣ]` at line 58), `iwasawaHomeomorph`, `existsUnique_iwasawa` (`…/Iwasawa.lean:224, 280`), `upperTriangularGroup`, `upperUnitriangularGroup`, `posDiagonalSubgroup`, `unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`…/RestrictedWeylGroup.lean:230`), `GL2Borel.mem_doubleCoset_weyl_iff` (`…/Bruhat.lean:218`), the KAK and polar theorems (`…/Cartan.lean:65`, `Analysis/Matrix/Polar.lean:76`), `maximal_isCompact_iff` (`…/MaximalCompact.lean:158`), `Cocharacter.parabolic`, `Cocharacter.limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`, on a Cartan subalgebra and a base of `IsKilling.rootSystem`).

### Suppliers, ownership and overlap

- **LieGroups (main).** `Suggested.lean`: `FiniteCartanMatrixModel` (line 459), `CartanInvolution` (484, fields `global_model`, `compact_fixed`, `reductive_compl`, `derived_semisimple`), `IsRealReductive` (499), `IwasawaData` (509), `IsIwasawaTriple` (592), `iwasawaDecomposition` (598), `kakDecomposition` (605), `cartan_polar_decomposition` (612); `isConj_of_isMaximalTorus`, `exists_monoidHom_of_lieHom`, `conj_lieExp`, `isEmbeddedLieSubgroup_of_isClosed`, `weylGroup` are declared. README Layer 9, "Global real-reductive inputs", supplies the model for a connected semisimple group with finite centre that §2.5 step 1 applies to `Int(𝔰_ℂ)`.
- **RealSemisimpleLieGroups (open, new folder).** Read at its head: Scope, Conventions, "From other roadmaps", §§0.2, 1.2, 1.3, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.4, and `dynamicalParabolic`, `nonnegEigenSubmodule`, `exists_titsSystem`, `exists_conj_cartanInvolution` in its `Suggested.lean`. Each contract bullet matches its section; the convention `Σ⁺ ∪ Σ_{Π'}` and the positive systems agree. It does not cite this roadmap: no cycle.
- **RootSystems (main).** "Exact supplier contracts" exists (README line 124).
- **ArithmeticLocallySymmetricSpaces (open).** ALS.F.1, ALS.0.1, ALS.0.2, ALS.0.3 exist under those headings, with `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`.
- **AutomorphicFormsOnReductiveGroups (open).** §2.3a exists; cited for ownership only.
- **Own objects.** `roadmaps grep` finds no other owner of "reductive Cartan datum", `linearLieAlgebra`, the dynamic subgroups, `⁰L` or "conjugate standard parabolic"; R03 is the one statement an open roadmap states in a special case. Ownership against open pull requests was checked through the `roadmaps` index of 2026-11-15.
- **Overlap list.** No other pull request changes this roadmap, no dropped id, no id defined only by a revision, no second copy.
- **Gaps.** None declared; none needed.

Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, ShimuraData, RootSystems, LieGroups, FlagVarieties and ReductiveGroups; shared with RealSemisimpleLieGroups: the parabolic theory of a minimal parabolic datum under the component condition, owner RealSemisimpleLieGroups (imported), the conjugacy of maximal abelian subspaces, owner RealSemisimpleLieGroups §1.3 for the Lie-algebra form and this roadmap §2.2 for the `K⁰` group form, and the uniqueness of the type of a parabolic, owner RealSemisimpleLieGroups §4.4 for its Tits system and this roadmap §6.1 for an arbitrary one (R03); shared with LieGroups: `Ad(K)𝔞 = 𝔭`, the restricted Weyl quotient and chamber coverage, owner LieGroups; shared with AutomorphicFormsOnReductiveGroups: the minimal parabolic of its algebraic class, owner AutomorphicFormsOnReductiveGroups; nothing shared with ArithmeticLocallySymmetricSpaces, ShimuraData, RootSystems, FlagVarieties or ReductiveGroups.

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name as found nowhere.

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage, so no elaboration, no `#check` comparison and no one-tactic probe was run. Headline theorems of the README: conjugacy of involutions and of Iwasawa triples with equal split centre; the component condition and its equivalents; `P = MAN` with its Langlands decomposition; the Bruhat decomposition over `W_G`; `⁰L`; the regular dynamical description; the complexification criterion with centre. Their pinned forms on subgroups of `GL (Fin n) ℝ` are `dynamicLevi_decomposition`, `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le`, `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le` and `exists_titsSystem_linear`, with `IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi` and `LinearComponentCondition` as definitions with real bodies on carriers that exist at the pins. By reading, none of the six closes with one tactic or one library lemma, and each names the roadmap's objects. The backticked names of this roadmap's own in the README are these twelve and agree with the plan. For the package: plan target 6.1 is named `TauCeti.TitsSystem.mem_standardParabolic_of_conj_le`; in `Suggested.lean` it sits under `TauCetiRoadmap.LieGroupsPartII`.

### Copyright, licences and scope

Six passages were put beside their sources: the positive-system and simple-root convention (`brown-rodriguezhertz-wang2022` lines 130–135; the README defines by a regular `H₀` and by sums of two positive roots), the formula for `𝔮_{Π'}` (same source, lines 138–141; a formula), the remark on the span of `−Π'` (`brown-fisher-hurtado2022` lines 513–519), the three statements of §6.1 (`borel-tits1965` lines 1930–1932; another language, another form, with `B` and the opposite indexing), the sentence on §6.2 (`borel-tits1965` lines 1488–1497) and the consumer bullet on `P_Θ` (`bradlow-collier-garciaprada-gothen-oliveira2024` lines 72–74). No run of words is shared beyond the formula. No table, figure or list is taken over. The prose of the other sections cites the four uncertified books and could not be compared.

Arrangement: `knapp2002` has 20 of the 35 locators. Its contents page was not read. By the README's own locators the layers cite Ch. VII §2 and Ch. VI §2 (Layer 1), Ch. VI §§4, 5 and Ch. VII §§2, 5 (Layer 2), Ch. VII §§2, 7 and Ch. VI §§4, 5 (Layer 3), Ch. VII §4 (Layer 4), Ch. VII §2 (Layer 5), Ch. VII §7 (Layer 6), Ch. VII §§2, 4–5, 7 (Layer 7): not monotone, and no layer corresponds to one section.

Source independence: 6 passages compared with 4 sources, none shared beyond a formula; largest share knapp2002, 20 of 35 locators; contents compared with knapp2002 through the README's section locators only, its text and contents page not having been read: independent as far as that shows.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified; their sections, pages and hypotheses were not read. Fourteen of the fifteen sampled targets have only these as locators.
- Lean elaboration, the `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- RealSemisimpleLieGroups, ArithmeticLocallySymmetricSpaces and AutomorphicFormsOnReductiveGroups were read at the heads the tools index holds (2026-11-15); a later head may renumber the cited sections.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (lines 133–134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** `knapp2002` carries 20 of 35 locators; neither its text nor its contents page was read, so wording and arrangement were not compared with it directly.
- **Merge order.** RealSemisimpleLieGroups (open, new folder) is a supplier but absent from `merge-order/ORDER.txt`; it consumes AutomorphicFormsOnReductiveGroups §2.3a (line 59). The gate placed this roadmap after line 58 and saw neither edge.
- **Ownership.** The division with RealSemisimpleLieGroups (it owns the parabolic theory under the component condition, this roadmap what lies beyond) is stated only in `design/README.md`, "Scope and ownership"; no maintainer note records it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1e1f4367d392b56d99c796b78244fe68f4193aac", "job": "REV-DESIGN-LieGroupsPartII~8", "model": "fable", "worker": "chris-x81"} -->
