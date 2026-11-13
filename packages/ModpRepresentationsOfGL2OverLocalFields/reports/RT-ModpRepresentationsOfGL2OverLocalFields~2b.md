<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6859341233 -->
Red team round 2 pass b (claude) of bee775a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the derived functor `R¹Ord_B` has no category with injectives behind it

   - Location: `README.md:1045` "Here `R¹Ord_B` is the derived functor on locally admissible representations"; `README.md:999` "On torsion-admissible representations define Emerton's ordinary part"; `README.md:322–323` "SR.0d.1: the smooth category is Grothendieck abelian with enough injectives; used for the derived functors of `Ord_B` in §2.2".
   - Claim: §2.1, §0.1 and SR.0d.1 supply the derived functor that §§2.2 and 2.5 use.
   - Witness: EMERTON2 line 1166 derives `Ord_P` on the locally admissible category, whose injectives are EMERTON2 Proposition 2.1.1 (line 89); EMERTON2 lines 1239–1247 separate it from the smooth category. An injective of the locally admissible category is not torsion-admissible, so §2.1 does not define `Ord_B` on it; SR.0d.1 gives injectives of the smooth category only.
   - Repair.
     1. §0.1, new API bullet: "For `H` a `p`-adic Lie group and a smooth torsion `V`, the vectors `v` with `𝒪[H]v` torsion-admissible form a subrepresentation `V_{l.adm}`; `V ↦ V_{l.adm}` is right adjoint to the exact inclusion of locally admissible representations into smooth torsion representations; the locally admissible representations form an abelian category closed under subobjects, quotients and direct sums, with enough injectives, namely the locally admissible parts of the torsion parts of injectives of the smooth category (SmoothRepresentationsOfLocalGroups SR.0d.1) (EMERTON1, Definition 2.2.15, Lemma 2.2.16 and Proposition 2.2.18, pp. 6–7; EMERTON2, Proposition 2.1.1, p. 2)."
     2. §2.1, after the definition: "The same formula defines `Ord_B(V)` for every locally admissible `V`; it is a locally admissible representation of `T`, and `Ord_B` is left exact on the locally admissible category (EMERTON2, Theorem 3.4.7 and Corollary 3.4.8, pp. 15–16, whose degree-zero term is `Ord_B`)."
     3. §2.2: "Here `R¹Ord_B` is the first right derived functor of `Ord_B` on the locally admissible category of §0.1, computed with its injectives (EMERTON2, §3.7, p. 23); it is not the derived functor in the smooth category." *Needs:* add §0.1; in the SR.0d.1 contract replace "used for the derived functors of `Ord_B` in §2.2" by "used in §0.1 to obtain the injectives of the locally admissible category, in which §2.2 derives `Ord_B`".
   - Tested on the witness: an injective hull `J` of `k` in the locally admissible category of `G` is not admissible; with (1)–(2) `Ord_B(J)` is defined and `R¹Ord_B(V) = coker(Ord_B J → Ord_B(J/V))`, which injects into `H¹Ord_B(V)` as line 1049 says.

2. **F02** (P3) a route sentence of §3.4 contradicts the Check of the same section

   - Location: `README.md:1479–1481` "In the irreducible case each `A` admits at most one weight (BDJ10, §3.1, pp. 18–19), so `W_BDJ(ρ̄)` has at most `2^f` elements."
   - Witness: `README.md:1514–1516` gives two weights for the one subset `A = {0}` (`Sym^5` and `Sym^{11} ⊗ det^5`, `p = 17`); the definition (line 1454) is symmetric in the two characters. BDJ10 lines 846–890 fix `ξ` and count triples.
   - Repair: "In the irreducible case write `ρ̄ ≅ Ind ξ` and let `A` record the exponents carried by `ξ|_{I_F}`, the complement of `A` then recording those of the conjugate character: for a fixed `ξ` each `A` admits at most one weight (BDJ10, §3.1, pp. 18–19), so `W_BDJ(ρ̄)` has at most `2^f` elements."
   - Tested: `p = 17`, `ξ|_I = ω₂^6`: `A = {0}` gives `r + 1 ≡ 6 (mod 18)`, `r = 5` only; `A = {1}` gives `17(r+1) + 18b ≡ 6 (mod 288)`, so `r + 1 ≡ 12 (mod 18)`, `r = 11`, `b = 5`. One weight each, two in all.

3. **F03** (P3) the prime bound of §5.1 is narrower than the statement

   - Location: `README.md:1850` "For `p > 5`, every `χ′ ≠ χ` occurs at most once in `W_{χ,3}`. The bound `p > 5` is needed"; `README.md:194`.
   - Witness: `p = 5`, `f = 2`: the nonzero weights of degree at most two are `±1, ±5, ±2, ±10, ±6, ±4` modulo `24`, twelve distinct classes. In general a coincidence needs `Σ d_i p^i ≡ 0 (mod q − 1)` with `0 < Σ|d_i| ≤ 4`, and `4p^{f−1} < q − 1` unless `q = 5`.
   - Repair: line 1850 "For `p > 3` and `q ≠ 5`, every `χ′ ≠ χ` occurs at most once in `W_{χ,3}`. The exclusion of `q = 5` is needed: …"; line 194 "the multiplicity statement for `W_{χ,3}` in §5.1 assumes `q ≠ 5`"; add to the first Check of §5.1 "for `p = 5`, `f = 2` the twelve weights `±1, ±5, ±2, ±10, ±6, ±4` modulo `24` are distinct". §7.5 (line 2321) needs no change: `2 < r_i < p − 3` gives `p ≥ 7`.

4. **F04** (P3) NoncommutativeAndEquivariantIwasawa §0.13 is cited for an identification it does not state

   - Location: `README.md:2010–2011` "`H¹(K₁/Z₁, k) ≅ ⊕_i A_i^*` (NoncommutativeAndEquivariantIwasawa §0.13 for `K₁/Z₁` uniform of dimension `3f`)"; `README.md:2376–2377` "§0.13 (`exp(p·)` identifies `sl₂(𝒪_F)/p` with the Frattini quotient of `K₁/Z₁`)".
   - Witness: the supplier's §0.13 states `H*(U, 𝔽_p) ≅ ∧* H¹(U, 𝔽_p)` with `dim H¹ = d` for uniform `U`; the word "Frattini" occurs nowhere in its sections 0.1–0.13, and no `K`-equivariance is stated.
   - Repair: add to the API of §5.6: "For `p > 2`, `1 + pX ↦ X mod p` is a surjective homomorphism `K₁ → M₂(k_F)` with kernel `1 + p²M₂(𝒪_F)`, equivariant for conjugation by `K`; it induces a `K`-equivariant isomorphism of `K₁/Z₁` modulo `p`-th powers and commutators with `sl₂(k_F) = M₂(k_F)/k_F`, hence `H¹(K₁/Z₁, k) ≅ Hom_{𝔽_p}(sl₂(k_F), k) = ⊕_i A_i^*` as `Γ`-modules; the dimension `3f` agrees with NoncommutativeAndEquivariantIwasawa §0.13." In line 2011 cite "(the API below; §0.13 for the dimension)"; in line 2376 replace the parenthesis by "(dimension of `H¹`); §5.6 (the identification of `K₁/Z₁` modulo `p`-th powers with `sl₂(k_F)`)".
   - Tested: `(1 + pX)(1 + pY) = 1 + p(X + Y) + p²XY`, additive modulo `p`; scalars `1 + pa` map to `k_F`; `dim_{𝔽_p} sl₂(k_F) = 3f`.

One P2 (S01) and three P3 (S02–S04). All fourteen round-1 findings are repaired at this head. No
finding touches `Suggested.lean`, a declared supplier gap, or a statement marked not actionable.

## Round 1 findings at this head

Each line: finding, status, the repaired passage (`packages/ModpRepresentationsOfGL2OverLocalFields/README.md`), the instance re-tested.

- **1a/F01** (pro-`p` in §4.2): repaired. Line 1640: "Let `U` be a compact analytic pro-`p` group without `p`-torsion, so that `R = k[[U]]` is local with maximal ideal the augmentation ideal". `p = 5`, `U = C₂`, sign module: now excluded and recorded as a Check (lines 1663–1669; `gr M = 0`, `j_R(M) = 0`).
- **1a/F02, 1b/F04** (finite `Ext¹`, §1.4): repaired. Lines 898–900: "`Ext¹_{G,ζ}(π, π′)` is finite-dimensional by gap:fixed-central-character-ext1-finite, and it is nonzero only when `π′` lies in the block of `π` (PadicLocalLanglandsForGL2Qp §§5.1–5.2)". The slug is in `design/plan.json` with supplier PadicLocalLanglandsForGL2Qp §5.2 and the same sentence; §5.2 of the supplier lists the blocks (i)–(vi) with `p = 2, 3`. Re-tested: `p = 2`, `π = π′ = 1`: `Hom_cont(ℚ₂^×, k)` has dimension `1 + 2 = 3`, comparison map `2ℓ = 0`; only left exactness is used.
- **1a/F03** (PBW filtration, §4.4): repaired. Lines 1710–1713: "Auslander regularity is then gap:enveloping-auslander-regular. The complete-filtration transfer of §0.5 does not apply here: the PBW filtration of an enveloping algebra is increasing". Slug in `plan.json`; pinned `pbwAssociatedGradedEquiv` exists (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`).
- **1a/F04** (injective envelopes, §4.6): repaired. Lines 1762–1764: "choose an injective envelope `τ → E` of `k[U]`-modules (Tau Ceti `TauCeti.exists_isInjectiveEnvelope`) and put `J = E^∞`, its smooth part". SmoothRepresentationsOfLocalGroups SR.0.2 states `smoothPart` right adjoint to the inclusion; the pin is `Envelope/Existence.lean:109`. Re-tested: `U = 1`, `τ = k`: `E = k`, not `k²`; `U = ℤ_p`: `C^∞(ℤ_p, k)`.
- **1a/F05** (Checks of §§5.6, 6.7): repaired. §5.6 has three Checks (dimensions `6`, `16`, `34 = 6+6+10+12`; `3f`; `r = 14` versus `r = 15`, HW22 line 564); §6.7 has three (lengths `8/4/4`, `20/10/10`, `48/16`). Recomputed: `2·4`, `2·4 + 3·4 = 20`, `4·12 = 48`, `4·4 = 16`.
- **1b/F01** (projective-cover pairing, §5.4): repaired. Lines 1935–1938: "the last is Tau Ceti `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity` for `A = k[Γ]`, the projective cover `P_σ → σ` and `M = V̄`". Pin read (`ProjectiveCover/Multiplicity.lean:158`): hypotheses `finrank k (End A S) = 1`, `M` finite-dimensional. No citation of GL2AutomorphicRepresentationsAndTransfer remains.
- **1b/F02** (direction between the two Serre-weight suppliers): repaired. Lines 344–347: "For `F = ℚ_p` the declarations … are those of §§2.7–2.8, over a sufficiently large finite field; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 extends them to every `F`". R07.5.15 opens with the same direction.
- **1b/F03** (PotentialAutomorphyInfrastructure §3.12): repaired. Lines 398–399: "§3.7, last interface item: `N(𝒪)`-invariants derived in the smooth monoid category". The supplier's §3.7 has that item as its fifth interface bullet. (S01 below is a different defect of the same section.)
- **1b/F05** (layer named by a source section): repaired. Lines 28–30 name the three criteria; no "§1.4" of the source identifies a layer.
- **1b/F06** (`TauCeti.IsSmoothDiscrete`): repaired. Lines 283–289; the class is documented at `…/SmoothDiscrete/Basic.lean`.
- **1b/F07** (VIGNERAS11 title): repaired. Lines 2667–2670.
- **1b/F08** (QuiverRepresentations Layer 3): repaired. Lines 469–483 cite §2.1, §3.1 and ArtinAlgebras §2.3 (all three headings exist on main); the Conventions define `soc`, `rad`, `cosoc`, Loewy length; no "Layer 3" citation of that roadmap remains (the five remaining "Layer 3" strings are this roadmap's own layer).
- **1b/F09** (Buzzard–Diamond–Jarvis set, §3.4): repaired, in the corrected form of the repair report, which I confirm. Lines 1471–1472: "when `μ − η` is 1-deep, `W(ρ̄)` is the set of regular weights in `W_BDJ(ρ̄)`, and that `W(ρ̄) = W_BDJ(ρ̄)` when moreover `ρ̄` is irreducible or `μ − η` is 2-deep". Recomputed: `p = 5`, `ω³ ⊕ 1`: `b = 0, r = 2`; `b = 3, r + 1 ≡ 1 (mod 4)`, so `r ∈ {0, 4}`: three weights against `W = {Sym², det³}`. `p = 5`, `ω² ⊕ 1`: `{Sym¹, Sym¹ ⊗ det²}` on both sides. `p = 5`, `ω₂³ ⊕ ω₂^{15}`: `6b + r + 1 ∈ {3, 15}` gives `(0, 2)`, `(2, 2)`: two weights on both sides. The repair introduced one inexact route sentence: S02.

## Verified sound

Counts: 12 declarations of `Suggested.lean` read (4 `def`, 1 `abbrev`, 7 `theorem`); 60 numbered README sections and all 2693 lines read; 27 locators opened in the cached texts in this pass (list below); the Checks with numerical content recomputed while reading, 28 of them recorded with their values in the second table; 36 supplier sections resolved in 12 roadmaps; 26 pinned declarations located.

Dependency check on the head:

    depcheck: 239 roadmaps, 2169 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 263 of `merge-order/ORDER.txt`.

Policy: `git diff --stat origin/main...HEAD` changes only `packages/ModpRepresentationsOfGL2OverLocalFields/`; no pull-request number, round or reviewer wording in the README or the Lean file; no `lemma`, `set_option`, `#eval`, `example`; single `import Mathlib`.

Declared gaps: the seven slugs of `design/plan.json` are the seven "What … must provide" lines of the README, with the same suppliers and sections; each is one statement with its hypotheses. `filtered-grade-equality` is not provided by NoncommutativeAndEquivariantIwasawa §0.5 (its API has only `j_R ≥ j_{gr R}`), and §4.7 uses only that inequality (`d − j_R ≤ d − j_{gr}`).

Overlaps: the one listed pull request that changes this roadmap is this roadmap's own pull request in the roadmap repository; the roadmap is not on main, so there is no second copy. The 39 former identifiers (`MP.k`, `MP.k/slug`) cited at the open heads are all rows of the mapping table. HilbertModularVarietiesAndShimuraCurvesPartII §0.2 (later in the order) still states "For tame ρ with 1-deep parameter, W(ρ) equals MP.3's tame weight set", false at `p = 5`, `ω³ ⊕ 1`; the README's "Downstream consumers" records the correct comparison, and nothing in this package depends on that roadmap.

Headlines: coherence (§0.5), the three `ℚ_p` criteria (§§1.3, 1.5, 1.6), finite length and subobjects in `𝒞` (§2.4), the Banach approximation (§2.6) are stated; the counit with `Ord_B`, the absence of supersingular constituents, the Iwahori criterion (§4.7), the local bound (§7.6) and the lattice with its endomorphisms and relative projectivity (§§8.6, 9.1–9.3) are named in the module docstring with the missing carriers. Padding probe: no theorem follows from one tactic or one library lemma; each of the five definitions is used by a theorem. The 12 elaborated signatures supplied were compared with the README statements: every theorem carries its binders explicitly; nothing lost.

### Declarations

| Declaration (line) | Context | Instances and values | Result |
| --- | --- | --- | --- |
| `IsSmoothRep` (54) | `A`, `G` with topology, `V` | trivial `ρ`: stabiliser `G`, open; regular action of `ℤ_p` on `k[ℤ_p]`: stabiliser `{0}`, not open | discriminates |
| `IsTorsionAdmissible` (59) | plus `p : ℕ` | `G = 1`, `L/𝒪`: length `je`; `⊕_ℕ k`: infinite at `j = 1`; `j = 0`: kernel of `1`, length `0` | as §0.1 |
| `IsFinitelyPresented` (69) | `W_i : Rep.{uA}` | `G = 1`: holds iff `V` of finite length; `V = 0`: `W₁ = W₂ = 0`; `V = 𝒪`: no finite-length module maps onto it | as §0.3 |
| `smoothDualSpan` (84) | full dual | `V = k` trivial: dimension `1`; `V = 0`: `0`; set `{g | f∘ρ g = f}` is a subgroup, so `g` versus `g⁻¹` is immaterial | as §1.6 |
| `GL2ModScalar` (92) | `F` field with topology | `ϖ = 0`: defining set empty, quotient `GL₂(F)`; centre for `F = ℚ_p`: commutators have `det 1`, `det(p^n) = p^{2n}`, so `ℚ_p^×/p^ℤ ≅ ℤ_p^×` | `hϖ` or `p` in the theorems |
| `isFinitelyPresented_ker` (104) | both residue `CharP p`, `Irreducible ϖ` | `f = id`: kernel `0`; `f = 0`: kernel `V`; `G₀ ⊂ G′` of index `2` (`val det ϖ = 2`), also for `p = 2` | hypotheses complete |
| `isFinitelyPresented_of_finite` (121) | `k : Type` finite, `ℚ_[p]` | `V = 0`, `k`, `I(σ)`: all finitely presented; `F ≠ ℚ_p`: supersingular, false, excluded by the carrier | scope right |
| `isFiniteLength_of_bounded_semisimple_quotients` (133) | `∃ N` before `∀ X` | `V = k²`: `N = 1` fails at `X = 0` (`2 ≤ 1`), `N = 2` holds; `I(σ)`: no `N` | quantifiers right |
| `isFiniteLength_iff_finite_smoothDualSpan` (151) | same | `k`: (T, dim 1); `St`: (T, dim 0); `I(σ)`: (F, infinite); `⊕_ℕ St` excluded by `hfin` | both directions |
| `isFiniteLength_of_admissible_of_finitelyPresented` (166) | `GL (Fin 2) F`, centre not killed | `χ∘det`: length `1`; `c-Ind_K^G k`: not admissible; `ϖ` acts on the finite `V^{K_1}[p^j]` with finite order, so a power of it acts trivially | true on `G` |
| `isFinitelyPresented_subrepresentation_of_admissible` (180) | same | `W = 0`, `W = V`; `St ⊂ Ind_B^G(χ⊗χ)`: finitely presented | consistent with §2.4 |
| `exists_coind_approximation_of_lattice` (202) | `L` normed, `hF`, `IsModuleTopology` on `M` | `hF` at `ℚ_p`, `ℚ_{p²}`, `ℚ_p(√p)`: (T∧T), (T∧F), (F∧T), only `ℚ_p` excluded; `E = 0`: `M = 0`; `Θ = 𝒪` trivial: `M = 0`, cokernel `𝒪`; a multiplicative norm inducing the valuation topology has unit ball `𝒪[L]` | not vacuous |

### README statements recomputed in this pass

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| Conventions, `N`-deep | `p = 17`, `r = 3`, `N = 3` | `3 < 4 < 14`; `r = 2`: `3 < 3` false | consistent |
| Conventions, `ω_{f′}` norm | `r = 2` | `(q² − 1)/(q − 1) = 1 + q` | as stated |
| §0.2 crossed product | `ℤ_p ⋊ C₂` | `(1+T)^{−1} − 1 = −T + T² − …`; mod 2 the `T²` term remains | Check true |
| §0.3 Check 4 | `k[ℚ_p/ℤ_p]` | a finite set of `[x_i] − 1` generates the kernel for `ℚ_p/A`, `A` finitely generated, `A ≠ ℤ_p` | true |
| §0.5 | `G₀ = K *_I K^α` | stabiliser of a vertex in `{val det = 0}` is `K`; `G′/G₀ = ℤ/2` | route sound |
| §0.6 | `V = ⊕_ℕ k`, `W = k` | `(∏ k) ⊗ L′ → ∏ L′` not onto; for finitely generated `V`, `Hom(V, ⊕W) = ⊕Hom(V, W)` | hypothesis exact |
| §1.2 negative control | `𝔽₂₅/𝔽₅` | `2` is a nonsquare mod 5; `t⁵ = t·4 = −t`; `ac(25) = 1` | true |
| §1.4 | odd `p`; `p = 2` | `dim Hom_cont(ℚ_p^×, k) = 2`; `3` | as stated |
| §2.1 Check | `χ∘det`, `t` contracting | transfer has `q^m` equal terms, `0` in `k` | `Ord_B = 0` |
| §2.2 Hecke operator | `t = diag(a,d)`, `v(a/d) = 1` | `φ ↦ χ(ad) φ(q·/c)`, `v_F(q/c) = ef − 1` | nilpotent iff `ef ≥ 2` |
| §2.2 Check | `ℚ₅(√5)`, `diag(2ϖ, 1)` | `5/(2ϖ) = ϖ/2`, `ℓ(3ϖ) = 3`; `(q/c)² = 5/4` | true |
| §2.4 Check | `K_n`-invariants | `|ℙ¹(𝒪/ϖ^n)| = (q+1)q^{n−1}`; `q + 1 ≡ 1` in `k` | true |
| §3.2 `t_λ` | `p = 17`, `(5,0)`, `ω = ∓1`; `f = 2`, `((5,0),(6,0))`, `(1,0)` | `(0,−11)`, `(−1,−10)`; `((6,0),(−1,−10))` | equation (14), BHHMS23 lines 702–708 |
| §3.3 | `p = 3`, `μ = (0,0)`; `p = 2`, `f ≥ 2` | `t_μ(1) = (−1,−1)`: `det`; `GL₂(𝔽_q) = SL₂ × 𝔽_q^×`, `H¹ = 0` | consistent |
| §3.4 `W_BDJ`, reducible count | BDJ10 lines 1106–1116 | values `n_B + 1 − p^f … n_B`: one solution, two when `n ≡ n_B`; extremes `b_i ∈ {1, p}` | route sentence right |
| §3.4, 2-deep digits | `m_i + 1 ∈ [3, p−3]` | digits of `±n` in `[2, p−3]`; of `n_A` in `{0, 1, p−2, p−1}` | disjoint |
| §3.5 Check | `p = 17` | `3^5 = 5`, `3^{15} = 6`, `3^4 = 13`; `6+10+12+4 = 32` | true |
| §4.4 degree count | `f` | `2f`; `f(2f+1) + f`; total `1 + 4f + 2f²` | `7` at `f = 1` |
| §5.1, `q = 5` | `α` of order 4 | `2 ≡ −2 (mod 4)` | collision; see S03 |
| §5.2 | `p = 7`, `f = 2`, `j = 15` | `(1+1)(2+1) = 6` | true |
| §5.5 | `f = 1` | `[P_{Sym^{r±2}} : Sym^r]`: would need `det^{(p−1)/2} = 1` | `0` |
| §6.1 Check | `f = 2`, `ε = (+,−)` | `d = (0, 1)`: `B₀` odd, `B₁` even | true |
| §6.6 against §6.7 | `f = 1, 2` | `2 + 2 = 4`; `4 + 2·4 = 12` | agree |
| §7.1 Check | `{1, α, α²}`, `p = 17` | pairs `(1, α²)`, `(α², 1)` have middle `α`; `α ∉ soc W_{1,3}` | connected |
| §8.3 | `ψ_λ`, trace | `−2r(r+3) + 4(r+1) + c(r−1) = 0` gives `c = 2(r+2)` | third eigenvalue confirmed |
| §8.5 | `(R₁⊕R₂)/R` | `(x₁, x₂) ↦ x₂ − ι(x₁) mod p`: `R₂/p` | sequence exact, dimension `(3f+1) dim P_σ` |
| §9.1 | `f` | `2^f + f·2^f` | `2^f(f+1)` |
| §9.2 bounds | `6 ≤ r ≤ p − 8` | `p ≥ 14` | `p ≥ 17` |

Locators opened in this pass: BHHMS23 lines 230–237 (Theorem 1.4), 606–611 (§2.2), 684–708 (§2.4, equation (14)), 716–721 (Proposition 2.4.2), 2392 (Lemma 5.1.3), 2817–2832 (Corollary 5.3.5), 3818–3828 (Theorem 6.4.7), contents 16–59; BDJ10 lines 846–903 (§3.1), 1088–1118 (§3.2); CDN23 lines 776–790 (Lemme 1.23, Théorème 1.24), 823–832 (Théorème 1.26), 894–916 (Lemmes 1.31–1.32, Proposition 1.33); EMERTON1 lines 261–292 (2.2.15–2.2.18); EMERTON2 lines 89–100 (2.1.1), 316–322, 1166–1181 (§3.7, Remark 3.7.3), 1239–1250 (3.7.8); HW22 lines 377–379, 558–565 (Lemma 2.10). Each supports the statement cited to it, with the two exceptions recorded under Source issues.

Suppliers resolved (heading and content): SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4, SR.0d.1, SR.2.1 with *mackey-filtration*; PadicLocalLanglandsForGL2Qp §§0.1, 0.3, 2.1–2.3, 2.6, 2.7, 2.9, 5.1–5.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15; PotentialAutomorphyInfrastructure §3.7; CompletedCohomologyAndLocalGlobalCompatibility §0.1; NoncommutativeAndEquivariantIwasawa §§0.3, 0.5, 0.7, 0.8, 0.10, 0.11, 0.13, F.1; CompletedCohomologyPartII §5.8, F.1; DeformationAndDerivedPatchingAlgebra §3.4; SchemeAndStackFoundations §0.17; ClassFieldTheory Layer 7 (`geometricArtinMap`); RepresentationTheory/QuiverRepresentations §§2.1, 3.1 and ArtinAlgebras §2.3 on main. The only mismatch is S04.

Pinned declarations located: seventeen Tau Ceti names of the supplier contracts (among them `exists_isInjectiveEnvelope`, which carries `[Small.{v} R]`, satisfied under the one-universe convention) and Mathlib `ContRepresentation.coind`/`coindV` (`RepresentationTheory/Continuous/Basic.lean:541, 558`), `ContIntertwiningMap` (`:81`), `Module.jacobson`, `IsModuleTopology`, `Subrepresentation.quotient`, `MvPolynomial.ringKrullDim_of_isNoetherianRing_of_finite`, `RingTheory.Sequence.IsRegular`, the `ℚ_[p]` local-field instance. No pinned declaration proves a target of `Suggested.lean`.

Ownership: `roadmaps grep` over main and the open heads for the Buzzard–Diamond–Jarvis set, locally admissible injectives, the Gelfand–Kirillov dimension of an admissible representation and the gluing lattice finds no earlier owner; the two closest open roadmaps consume this one by its former identifiers.

Arrangement: BHHMS23 has 48 of the 161 source-key occurrences before the bibliography. Against its contents (BHHMS23 lines 16–59): Layer 3 draws on §2 with BP12 and BDJ10; Layer 4 on §5.1 and §5.3; Layers 5–7 divide §6 differently from its four subsections and add §4.1, HW22 and LMS22; Layers 8–9 divide §7. The order 4 → 7, 5 → 6 → 7 and 8 → 9 is forced by the *Needs:* lines of §§4.7, 6.6, 7.5–7.6, 8.6 and 9.1. Two layers coincide in scope with one subsection each (`Layer 7 ↔ §6.4`, `Layer 9 ↔ §7.4`); the layers do not map one to one onto a run of sections. No table, figure or list is taken over.

Source independence: 8 passages compared with 5 sources (§1.4 and the docstring of `isFiniteLength_iff_finite_smoothDualSpan` with CDN23 lines 776–790; §2.4 with CDN23 lines 823–832; §2.2 with EMERTON2 lines 1166–1181; §3.4 with BHHMS23 lines 609–611 and 716–721 and with BDJ10 lines 1088–1116; §5.6 with HW22 lines 558–565; §7.6 with BHHMS23 lines 3818–3828), none shared beyond formulas, standard names and one-sentence theorem statements; largest share BHHMS23, 48 of 161 locators; contents compared with BHHMS23: independent, with the two coincidences of scope named above; BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified) could not be read.

## Not verifiable

- BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified): cited by locator only.
- No Lean was run (read-only pass); the supplied elaborated signatures and the repair report's elaboration record were used.
- `isFiniteLength_iff_finite_smoothDualSpan` at `p = 2, 3` and §1.4 at every `p` rest on the declared gaps of PadicLocalLanglandsForGL2Qp.
- The comparison `W(ρ̄) = W_BDJ(ρ̄)` for irreducible `ρ̄` with a 1-deep, not 2-deep, presentation was computed only for `f = 1` (`p = 5`, `p = 17`) and, for `f = 2`, modulo `p² + 1` on the principal sign pattern; the general count rests on BDJ10 lines 872–890.
- Locators of Layers 0–2 and 4–9 not listed above were verified in round 1 and not reopened.
- Ownership against open pull requests was checked through `roadmaps grep` and the listed heads only.

## Source issues

- **Error** in BHHMS23 at Proposition 2.4.2, printed p. 16: the source says the Buzzard–Diamond–Jarvis set equals the extension-graph set whenever the parameter is 1-deep; it should assume irreducible `ρ̄` or a 2-deep parameter, or compare regular weights only (`p = 5`, `ω³ ⊕ 1`); affects a stated result.
- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p. 56: the source says for `p > 3` every other character occurs at most once in the third truncation; it should exclude `q = 5`, where `α² = α^{−2}` occurs twice; affects a stated result.
- **Gap** in CDN23 at the proof of Lemme 1.23, printed p. 18: the source says the comparison sequence of extensions is exact on the right; it should claim left exactness only (at `p = 2` the last map vanishes on the trivial character); affects the proof.

## For the human reviewers

- **Scope.** Layer 7 has the scope of BHHMS23 §6.4 and Layer 9 that of its §7.4 (contents at BHHMS23 lines 44 and 53); the other layers do not match single sections.
- **Not tested.** BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified) were not read; wording and locators against them were not compared.
- **Licence.** BP12, EMERTON1, EMERTON2, DEG, KOHLHAASE17, LMS22 and LMS22-CORR are read from author copies, as `sources.toml` and the README's References record; the hosts were not re-examined in this pass.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bee775a19eaeeabd7f62adbbcad518a8e975926d", "job": "RT-ModpRepresentationsOfGL2OverLocalFields~2b", "model": "fable", "worker": "chris-x51"} -->
