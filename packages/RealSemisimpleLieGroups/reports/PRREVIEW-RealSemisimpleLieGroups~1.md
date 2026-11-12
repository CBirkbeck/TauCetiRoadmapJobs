# Review of RealSemisimpleLieGroups (pull request #2229 at 45403f2)

**Verdict:** needs changes

## R01 (P1) — `realRank` is `0` on every non-semisimple reductive algebra, refuting four README claims

**Location:** `README.md:446–448`: "For reductive `𝔤₀` the same definition with `IsReductiveCartanInvolution` gives `realRank 𝔤₀ = realRank [𝔤₀, 𝔤₀] + dim(𝔭 ∩ 𝔷(𝔤₀))`"; also line 460 (`𝔤𝔩_n(ℝ)`: "real rank `n`"), line 501 ("semisimple (or reductive)"), lines 587–595, 950–951.

**Claim:** `realRank` (`Suggested.lean:150`) takes its supremum over `IsCartanInvolution`. No algebra with nonzero centre has one, so `realRank 𝔤𝔩_n(ℝ) = sSup ∅ = 0` and `groupRealRank GL_n(ℝ) = 0`. This contradicts:
- the reductive formula and the `𝔤𝔩_n` Check in §1.3;
- §2.4's claims that `groupRealRank` is the maximal dimension of an `ℝ`-split subgroup and equals the Borel–Tits `ℝ`-rank;
- §5.5's claim that the rank of `X` equals `groupRealRank`, for reductive `G`.

**Witness:** Proved in Lean at the pins: `realRank (Matrix (Fin 2) (Fin 2) ℝ) = 0`. Since `ad 1 = 0`, `B(1, θ1) = 0` for every `θ`. The README formula gives `1 + 1 = 2`. `GL₂(ℝ)` has 2-dimensional split tori and 2-dimensional flats.

**Repair:** Scope `realRank` and `groupRealRank` to semisimple algebras.
- §2.1: replace "semisimple (or reductive)" by "semisimple".
- §1.3: replace the reductive sentence by "For reductive `𝔤₀` and a reductive Cartan involution `θ`, `finrank 𝔞 = realRank [𝔤₀, 𝔤₀] + dim(𝔭_θ ∩ 𝔷(𝔤₀))`; `realRank` itself is `0` on a non-semisimple algebra".
- §1.3 Check: replace the `𝔤𝔩_n` bullet by "`realRank 𝔤𝔩_n(ℝ) = 0` (no Cartan involution: the centre is `B`-isotropic), while `finrank 𝔞 = n` for `θ = −Xᵀ`". For `n = 2` the diagonal `𝔞` gives `2 = 1 + 1`.
- §2.4 and §5.5: state the reductive cases with `finrank ℝ 𝔞` of the `IwasawaData` or `CartanInvolution` datum, and keep `groupRealRank` for a semisimple Lie algebra.
- Docstring of `realRank`: "of a real semisimple Lie algebra (`0` when there is no Cartan involution)".

A supremum over `IsReductiveCartanInvolution` is no fix: it gives `1` for `𝔲(n)`, the Lie algebra of compact `U(n)`.

## R02 (P2) — The restricted root system and chamber facts have two owners: this roadmap and LieGroups Layer 9 (main)

**Location:** `README.md:89–92`: "Layer 9's restricted roots and root spaces of an `IwasawaData` are the case `𝔤₀ = Lie(G)`, `θ = dΘ` of §1.1–§1.2, identified there rather than constructed twice." Also §1.2 (lines 405–420) and §2.3 (lines 549–552, "every `W_G`-orbit in `𝔞` meets `𝔞̄⁺` exactly once").

**Claim:** LieGroups on main builds these objects itself and does not defer to this roadmap. A roadmap on main is the earlier owner, so §1.2 and §2.3 restate an owned construction.

**Witness:** LieGroups `README.md:1354–1360`: "Build the possibly nonreduced restricted root system and the actual normalizer quotient N_K(a)/Z_K(a) … compact normalizer representatives give the restricted reflections, root chambers and every orbit's intersection with this closed chamber".

**Repair:**
- In Scope, §1.2 and §2.3, cite LieGroups Layer 9 ("Restricted roots and KAK") as the owner of the restricted root system, the reflections and the chamber-orbit statement.
- Obtain §1.1–§1.2 for `(𝔤₀, θ)` by applying Layer 9 to §0.2's adjoint datum on `Int(𝔤₀)`, as §1.3 already does for `Ad(K)𝔞 = 𝔭`.
- Keep here only what Layer 9 does not state (the `RootPairing` packaging, multiplicities, the comparison with `LieModule.genWeightSpace`), with a clause saying so.
- Rewrite lines 89–92 to match.

## R03 (P2) — Maximal compact subgroups have two other owners that §5.4 does not cite: LieGroups Layer 9 and ArithmeticLocallySymmetricSpaces ALS.F.1

**Location:** `README.md:926–929`: "every compact subgroup of `G` lies in a conjugate of `K`; `K` is a maximal compact subgroup; the maximal compact subgroups are exactly the conjugates of `K`".

**Claim:** Two earlier roadmaps already own parts of this:
- LieGroups Layer 9 owns the maximality of `K`.
- ALS.F.1 owns containment in a maximal compact subgroup and conjugacy, for real points of reductive groups.

Scope cites neither and does not say how §5.4's variant differs.

**Witness:** LieGroups `README.md:1226` (main): "identify K_H=H∩O(N) and its compactness/maximality". ArithmeticLocallySymmetricSpaces `README.md:591–593`: "every compact subgroup of `H(ℝ)` lies in a maximal compact subgroup, and any two maximal compact subgroups are `H(ℝ)`-conjugate".

**Repair:**
- In §5.4, replace "`K` is a maximal compact subgroup" by a citation of LieGroups Layer 9.
- Add to Scope: "Maximality of `K` is LieGroups Layer 9's, and conjugacy of maximal compact subgroups of real points of reductive `ℝ`-groups is ArithmeticLocallySymmetricSpaces ALS.F.1's; §5.4 proves containment and conjugacy for every `CartanInvolution` datum, nonlinear finite covers included."
- List both in Exact supplier contracts.

## R04 (P2) — AF §2.3a is cited for groups its class does not include

**Location:** `README.md:62–64`: "for real reductive groups in its supplied class (real points of connected reductive `ℝ`-groups and their identity components)". Also lines 631–633: "the identity component of the real points of the adjoint group of `𝔤₀`, which is in AF §2.3a's class".

**Claim:** §3.1's transfer needs §2.3a for `Int(𝔤₀) = 𝐆_ad(ℝ)°`. §2.3a's class is ALS.0.1–ALS.0.3: real points `H(ℝ)` and `G(F_∞)`, not their identity components. Only §2.3a's algebraic-comparison paragraph mentions identity components. The description concedes the point: "needs `Int(𝔤₀)` to be in §2.3a's class".

**Witness:** AutomorphicFormsOnReductiveGroups `README.md:374`: "Let `G` be a real reductive group in the supplied class (ALS.0.1–ALS.0.3)". ALS.0.3 (`README.md:1286–1290`) concerns `G(F_∞)` for `G` connected reductive over a number field.

**Repair:** Do one of the following, and in either case correct the class stated at lines 62–64:
- Prove §3.1's list directly for every `G` with an `IwasawaData` with `N = N₊`, by Knapp's route through LieGroups Layer 9, citing AF §2.3a only within its own class.
- Declare the dependency as a gap under Exact supplier contracts: "What AutomorphicFormsOnReductiveGroups must provide (gap:minimal-parabolic-identity-component): the conclusions of §2.3a for `G = 𝐆(ℝ)°`, `𝐆` connected reductive over `ℝ` with a transpose-stable realization". Add the slug to the plan's `gaps`.

## R05 (P2) — Cited Tau Ceti declarations and files do not exist at the pin

**Location:** `README.md:178–181`: "`TauCeti.isCompl_center_derivedSeries_one_of_compactSpace`, `TauCeti.killingForm_derivedSeries_one_self_neg_of_compactSpace_of_ne_zero` (`TauCeti/Geometry/Lie/Adjoint/Compact.lean`) and the form-level versions in `TauCeti/Algebra/Lie/InvariantForm/Positive.lean`". Also line 187 (`TauCeti.iwasawaDiffeomorph`). Used at §0.1 (line 275) and §2.1 (line 512).

**Claim:** None of these exists at the pinned Tau Ceti. Two steps therefore cite a supplier that does not have them: the "compact ⇒ negative-definite Killing form" direction of `groupRealRank_eq_zero_iff_compactSpace`, and §0.1's reductivity of `𝔨`.

**Witness:** `#check` reports "Unknown identifier" for all three names. Neither file exists: `InvariantForm/` holds only `Basic.lean` and `Pi.lean`. No Tau Ceti file mentions both `killingForm` and `CompactSpace`.

**Repair:**
- For §2.1, cite LieGroups Layer 5A (main): for compact connected `G`, `[𝔤, 𝔤]` is semisimple with negative-definite Killing form.
- Add to §0.1 the target "a real Lie algebra with a negative-definite invariant form is reductive with semisimple derived algebra".
- Replace `TauCeti.iwasawaDiffeomorph` (`TauCeti/Geometry/Lie/Iwasawa.lean`) by `TauCeti.iwasawaHomeomorph` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Iwasawa.lean`).
- In the §0.4 Check, attribute the formula to `LieAlgebra.Symplectic.killingForm_cartanInvolution_apply`. `killingForm_cartanInvolution_self_neg` states only `B(X, θX) < 0`.

## R06 (P2) — Headlines statable at the pins are absent from `Suggested.lean`

**Location:** `Suggested.lean:35–37`: "the symmetric space `G ⧸ K` as a Riemannian manifold (§5.2–§5.5): the pins have no smooth structure on `G ⧸ K`". Also lines 205–209 (`exists_subgroup_eq_dynamicalParabolic`).

**Claim:** Three Summary headlines need neither `G ⧸ K` nor Layer 9 data, yet none is stated:
- conjugacy of maximal compact subgroups (§5.4);
- Cartan's fixed-point theorem on a Hadamard manifold (§5.4);
- §4.4's dynamical description, replaced by the stand-in "is a subgroup for every `X`".

**Witness:** The first two Lean shapes below elaborate at the pins in a scratch copy. The hypothesis `hK` of the pinned `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos` already states sectional curvature `≤ 0` with `leviCivitaConnection`.

**Repair:** Add the following, for connected `G` with `IsSemisimple ℝ (LeftInvariantDerivation I G)` and `Finite (Subgroup.center G)`:
- `exists_conj_eq_of_maximal_isCompact (h₁ : Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K₁) (h₂ : … K₂) : ∃ g : G, K₂ = K₁.map (MulAut.conj g).toMonoidHom`
- `dynamicalParabolic_isClosed_lie (hX : ⨆ c : ℝ, Module.End.eigenspace (ad ℝ _ X) c = ⊤) : ∃ Q : Subgroup G, (Q : Set G) = dynamicalParabolic X ∧ IsClosed (Q : Set G) ∧ (TauCeti.Lie.lieSubalgebraOfSubgroup Q).toSubmodule = nonnegEigenSubmodule X`
- Cartan's fixed-point theorem. Let `M` be connected, simply connected and `CompleteSpace`, with `IsRiemannianManifold I M` and sectional curvature of `leviCivitaConnection I M` at most `0` on independent pairs. Let `L` be a compact group with `ContinuousSMul L M` and `IsIsometricSMul L M`. Then `∃ x, ∀ l : L, l • x = x`.

Then delete `exists_subgroup_eq_dynamicalParabolic` and remove §5.4 from the docstring's list of statements that cannot be stated.

## R07 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean` lines 80, 84, 90, 98, 165, 169, 208, 226 and 261; definitions at lines 63 and 244.

**Claim:**
- `lie_mem_cartanK_of_mem_cartanP`, `killingForm_pos_of_mem_cartanP`, `isCartanInvolution_refl_iff` and `isCartanInvolution_symplectic` close in one tactic or restate a definition.
- `realRank_sl` and `realRank_sp` mirror §1.3's first Check.
- `exists_subgroup_eq_dynamicalParabolic`, `lie_mem_nonnegEigenSubmodule` and `displacementInjRad_smul` are elementary facts that do not need their hypotheses.
- No statement uses `IsReductiveCartanInvolution` or `IsRiemannianSymmetricSpace`.

**Witness:**
- `simp [IsCartanInvolution]` closes `refl_iff`.
- `simp_all [cartanK, cartanP, add_eq_zero_iff_eq_neg, LieEquiv.map_lie]` closes `lie_mem_cartanK…`.
- `⟨cartanInvolution_cartanInvolution, fun _ h ↦ neg_pos.mpr (killingForm_cartanInvolution_self_neg h)⟩` closes `symplectic`.
- `lie_mem_nonneg…` holds for every `X`, because `ad X` is a derivation.

**Repair:** Delete these nine theorems and the two unused definitions from `Suggested.lean`; the README keeps their statements. Delete `displacementInjRad` too, since nothing uses it after its theorem goes. Keep `dynamicalParabolic` and `nonnegEigenSubmodule` only for R06's dynamical headline.

## R08 (P3) — `Suggested.lean` is framed as an API sampler and cites an unexplained "Annals" list

**Location:** `Suggested.lean:14–17`: "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap." Also `README.md:18–19`, and "Annals #1" (`Suggested.lean` lines 147, 189) and "Annals #62.5(c)" (line 254).

**Claim:** The file should be the roadmap's acceptance test, not a sample of suggested forms. The "Annals" numbers are defined nowhere in the README, so they are process references.

**Witness:** The form rule asks the docstring to say that the file "states the roadmap's headline theorems against the pinned APIs". `README.md` contains no "Annals".

**Repair:**
- Docstring: "This file is not the roadmap; the roadmap is `README.md`. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; the headline theorems not statable at the pins, and what each lacks, are listed below."
- README line 18: "`Suggested.lean` states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti."
- Delete the three "Annals …" tags.

## R09 (P3) — Eight subsections state targets without a locator

**Location:** `README.md` §0.3 (line 322), §1.3 (434), §2.1 (499), §3.1 (621), §3.2 (652), §4.2 (734), §5.1 (837), §5.2 (859).

**Claim:** Each states theorems with no source locator. Examples: conjugacy of maximal abelian subspaces (§1.3); `N_G(𝔞)/MA ≅ W_G` and the big cell (§3.2); completeness and `∇R = 0` of a symmetric space (§5.1).

**Witness:** None of these subsections has a parenthesised source citation. For example, §3.2 (lines 654–662) states five results with none.

**Repair:** Add the theorem number and page at each claim: Knapp Ch. VI for §0.3 and §1.3, Ch. VII for §3.1–§3.2 and §4.2, Helgason Ch. IV for §5.1–§5.2. Take each number from the text itself.

## R10 (P3) — Six definitions have fewer than three Checks

**Location:** §1.4 (split; lines 479–482), §4.1 (728–730), §4.2 (747–748), §4.3 (768–770), §4.4 (793–797), §5.6 (`displacementInjRad`; 987–992).

**Claim:** Each of these definitions has two Checks; the rule asks for at least three discriminating Checks.

**Witness:** For example, §4.2 has only "`SL₃(ℝ)` has exactly four subgroups containing the upper triangular group" and "`SL₂(ℝ)`: `P` and `G`".

**Repair:** Add one Check to each:
- §1.4: "`𝔰𝔬(2, 1)` is split (`𝔪 = 0`); `𝔰𝔬(3, 1)` is not (`𝔪 = 𝔰𝔬(2)`, real rank `1 < 2 = rank 𝔰𝔬₄(ℂ)`)".
- §4.1: "`𝔰𝔩₂(ℝ)`: `𝔮_∅` upper triangular, `𝔫_∅ = ℝE₁₂`, `𝔩_∅ = 𝔞`".
- §4.2: "`Sp(4, ℝ)` has four standard parabolics: `P`, Siegel, Klingen, `G`".
- §4.3: "`Sp(4, ℝ)` Siegel: `L ≅ GL₂(ℝ)`, `A = {diag(s, s, s⁻¹, s⁻¹)}`, `N ≅ Sym₂(ℝ)` of dimension `3`".
- §4.4: "`SO₀(n, 1)`: the only proper type is `∅`, so every proper parabolic is minimal".
- §5.6: "`Λ = {±1} ⊆ SL₂(ℝ)`: `−1` acts trivially, so the displacement radius is `0` everywhere".

## R11 (P3) — §0.3's *Needs:* contradicts the Ordering

**Location:** `README.md:342`: "*Needs:* §0.1, §0.2; Mathlib's decomposition …", and line 364: "*Needs:* §0.1–§0.3". Against these, lines 1009–1011: "§0.1, §0.3 and §0.4 are otherwise self-contained Lie algebra and can be built first".

**Claim:** §0.2 needs LieGroups Layers 2, 4 and 9, so as written §0.3 and §0.4 cannot be built first. §0.3's proofs do not use §0.2.

**Witness:** Take a compact `𝔤₀`, a Cartan involution `θ` and a nonzero `X ∈ 𝔭_θ`. Then `B(X, X) = B_θ(X, X) > 0`, which contradicts negative definiteness without any conjugacy. The simple-ideal claims use only `B(𝔤_i, 𝔤_j) = 0`.

**Repair:** Replace line 342 by "*Needs:* §0.1; Mathlib's decomposition of a semisimple Lie algebra into simple ideals." Replace line 364 by "*Needs:* §0.1, §0.3; Mathlib's classical Lie algebras; Tau Ceti's symplectic Cartan involution."

## R12 (P3) — Downstream consumers lists roadmaps that come earlier

**Location:** `README.md:1018–1021`: "AutomorphicFormsOnReductiveGroups (standard parabolics and Langlands decompositions in its Langlands classification; real rank), ArithmeticLocallySymmetricSpaces (…), AdelicAlgebraicGroups (real rank of `G(ℝ)`)".

**Claim:** All three come before this roadmap in the merge order, and two of them supply it, so none can consume it. None of them cites it.

**Witness:** Merge order: AdelicAlgebraicGroups line 51, ArithmeticLocallySymmetricSpaces 58, AutomorphicFormsOnReductiveGroups 59, RealSemisimpleLieGroups 60. `roadmaps grep RealSemisimpleLieGroups` finds no roadmap citing it.

**Repair:** Delete those three entries. Keep ShimuraData (line 117) and NoncompactQuantumSymmetry (line 157).

## R13 (P3) — The description misstates ownership against NoncompactQuantumSymmetry, ArithmeticLocallySymmetricSpaces and LieGroups

**Location:** Pull-request description: "#1015 M0 overlaps with §0.2, §5.3 and §5.4 (Cartan involution existence, …); whichever merges second should consume the other. #871 ALS.0 is algebraic and has no metric, so it does not conflict."

**Claim:**
- Ownership follows the merge order, not merge timing.
- Existence of Cartan involutions is LieGroups Layer 7's.
- ALS.F.1 owns conjugacy of maximal compact subgroups (R03).
- The planned "one-line edit to the LieGroups README" would make a roadmap on main cite a later one (R02).

**Witness:** In the merge order, RealSemisimpleLieGroups is line 60 and NoncompactQuantumSymmetry line 157. ArithmeticLocallySymmetricSpaces `README.md:593`: "any two maximal compact subgroups are `H(ℝ)`-conjugate".

**Repair:** Replace with: "NoncompactQuantumSymmetry M0 is later in the merge order and should cite §0.2, §5.3 and §5.4 here; existence of Cartan involutions is LieGroups Layer 7's; ArithmeticLocallySymmetricSpaces ALS.F.1 owns conjugacy of maximal compact subgroups of real points, and §5.4 cites it." Delete "a one-line edit to the LieGroups README can record that after this merges."

## R14 (P3) — The description misdescribes the organisation and `Suggested.lean`

**Location:** Pull-request description: "following Knapp, *Lie Groups Beyond an Introduction*, Ch. VI–VII, and Helgason, …, Ch. IV–VI"; "`Suggested.lean` gives target signatures for selected milestones and compiles against current Tau Ceti `main`."

**Claim:**
- The layers are the roadmap's own, with locators into the sources; the roadmap does not follow a source.
- The file builds against the pinned Tau Ceti and is the acceptance test.
- The Layer 2 summary omits §2.4.

**Witness:** `lake-manifest.json` pins Tau Ceti at a fixed `rev`. The head contains "### 2.4 Hyperbolic elements, `ℝ`-split subgroups and split tori".

**Repair:**
- "… with exact locators into Knapp … and Helgason …".
- "`Suggested.lean` states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti".
- Add "hyperbolic elements, `ℝ`-split subgroups and split tori" to the Layer 2 sentence.

## R15 (P3) — "What can start now" contradicts the README's *Needs:* lines

**Location:** Pull-request description: "What can start now: §0.1, §0.3, §0.4, §1.1, §1.2 and §1.4, taking the Cartan involution as a hypothesis".

**Claim:** §1.4 needs §1.3, which needs LieGroups Layer 9. As written, §0.3 and §0.4 also list §0.2.

**Witness:** `README.md:484`: "*Needs:* §1.1–§1.3". Line 466: "*Needs:* §0.2, §1.1, §1.2; LieGroups Layer 9".

**Repair:** "What can start now: §0.1, §0.3, §0.4, §1.1 and §1.2, taking the Cartan involution as a hypothesis." This needs R11's *Needs:* repair first. Drop §1.2 as well if R02 routes it through Layer 9.

## Verified sound

| Target | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| §0.1 Checks, `IsCartanInvolution` | `𝔰𝔩₂(ℝ)`, `θ = −Xᵀ`; `θ = 1`; abelian `ℝ` | `B = 2n tr = 4 tr`; `B_θ(H, H) = −4·2 = −8`; `B(1, θ1) = 0` | holds |
| §0.4 Killing constants | `𝔰𝔭(2n, ℝ)`, `𝔰𝔬(2, 1)`, `𝔰𝔲(p, q)` | Tau Ceti `killingForm_apply`: `2·card l + 2`; `p + q − 2 = 1`; `𝔰𝔩_{p+q}(ℂ)` gives `2(p + q)` | holds |
| §1.1 root spaces | `𝔰𝔬(3, 1)`; `𝔞 = ⊥` | `dim 6 = 1 + 1 + 2·2`; Lean `𝔤_0 = ⊤`, `Σ = ∅` | holds |
| §1.2 restricted roots | `𝔰𝔲(n, 1)`; `𝔰𝔩₂(ℝ)` | `(n−1)² + 1 + 2(2n−1) = (n+1)² − 1`; `H_α = H/4`, `H'_α = H`, `α(H'_α) = 2` | holds |
| §1.3 `realRank` | `𝔤𝔩₂(ℝ)` | Lean `realRank = 0` (proved); README formula `1 + 1 = 2` | fails, R01 |
| §1.4 split criterion | `𝔰𝔲(2, 1)`; `𝔰𝔩₂(ℂ)` as real | restrictions `2 + 2 + 1 + 1 = 6` roots; real rank `1` vs `rank_ℂ 2`, `𝔪 = i𝔞 ≠ 0`, `𝔞` not Cartan | holds |
| §2.2 global Cartan | `SO(2, 1)`; universal cover of `SL₂(ℝ)` | `K = S(O(2)×O(1)) ≅ O(2)`, two components; `K ≅ ℝ ⊇ Z ≅ ℤ`, noncompact | holds |
| §2.3 `W(Σ) = W_G` | `O(1, 1)`; `GL_n(ℝ)` | `Ad(diag(1,−1))X = −X`, `|W_G| = 2`, `W(Σ) = 1`, `M = {±1}` meets 2 of 4 components | holds |
| §2.4, §5.5 for reductive `G` | `GL₂(ℝ)` | split torus and flats of dimension `2`; `groupRealRank = realRank 𝔤𝔩₂ = 0` | fails, R01 |
| §3.1 nonlinear groups | double cover of `SL₂(ℝ)` | preimage of `{±1}` is `ℤ/4`; `Ad⁻¹(AN) = Z·ÃÑ`, four components | holds |
| §3.2 big cell | `SL₂(ℝ)` | `[[1,0],[c,1]]·[[a,b],[0,a⁻¹]]` has `(1,1)` entry `a`; every `g₁₁ ≠ 0` factors | holds; R09 |
| §3.3 Bruhat cells | `SL₃`, `Sp(4)`, `O(1, 1)` | lengths `0,1,1,2,2,3`; `|W(C₂)| = 8`; `N_G(𝔞)/MA` order `2` with `Σ = ∅` | holds |
| §4.1 dynamical subalgebra | `diag(1,1,−2)/3`, `diag(1,0,−1)` in `𝔰𝔩₃` | `α₁ = 0`, `α₂ = 1`: block `(2,1)`; `ad X` eigenvalues `1, 2, 1` on `E₁₂, E₁₃, E₂₃` | holds |
| §4.3 Langlands | `GL₃` block `(2,1)`; `SL₂`, `Q = P` | `|χ|` generated by `|det g|`, `|u|`; on `diag(a, a⁻¹)`, `|a| = 1` gives `{±1}` | holds |
| §4.4 types, `dynamicalParabolic` | `SL₃`; `X = ±diag(1,−1)` | line stabilizer block `(1,2)`, type `{α₂}`, codimension `2`; `x ↦ x e^{−2t}` bounded, `y e^{2t}` not | holds |
| §5.3 curvature | `SL₂`, `SO₀(n, 1)`, `SU(n, 1)` | `B(diag(½,−½)) = 2`, so Killing = 2·hyperbolic, `K = −½`; `−1/(2(n−1))`; `−1/(n+1)`, `−1/(4(n+1))` | holds |
| §5.5 vector distance | `SL₃/SO(3)`, `y = diag(e², 1, e⁻²)·o` | `B(Y, Y) = 6·8 = 48`, `d = 4√3`; `−w₀ diag(2,0,−2) = diag(2,0,−2)` | holds |
| §5.6 displacement | `⟨diag(e, e⁻¹)⟩`; `SL₂(ℤ)` | `d_hyp(i, e²i) = 2`, Killing `2√2`, radius `√2`; area `π/3 → 2π/3`; `−1` trivial, radius `0` everywhere | holds |
| §5.4 Cartan fixed point | `[[0,−1],[1,1]] ∈ SL₂(ℤ)` | trace `1`, det `1`, order `6`; fixed point `z² + z + 1 = 0`, `z = e^{2πi/3}` | holds |
| §0.3 without §0.2 | compact `𝔤₀`, any Cartan `θ` | `X ∈ 𝔭_θ ∖ 0` gives `B(X, X) = B_θ(X, X) > 0`, contradiction | holds; R11 |
| `finrank_eq_realRank` | zero algebra; `𝔰𝔩₂(ℝ)` | `θ = id` vacuous, `𝔞 = ⊥`, `sSup {0} = 0`; set `{1}`, `sSup = 1` | holds |
| `realRank_eq_zero_iff` | `𝔰𝔲(2)`; `𝔰𝔩₂(ℝ)` | rank `0` and `B < 0`; rank `1` and `B(H, H) = 8 > 0` | holds |
| `exists_restrictedRootPairing` | `𝔰𝔲(2, 1)`; zero algebra | coroot of `2λ` is `H'_λ/2`, `⟨2λ, H'_λ⟩ = 4 ∈ ℤ`; empty pairing, `span ∅ = ⊤` in `0` | holds |
| `iSupIndep_restrictedRootSpace` | `𝔰𝔩₂(ℝ)` | `ℝH ⊕ ℝE ⊕ ℝF = 𝔰𝔩₂`; holds for any abelian `𝔞 ⊆ 𝔭` | holds |
| `restrictedRoots_smul_mem` | `𝔰𝔲(2, 1)`; `𝔰𝔩₃(ℝ)` | ratios `±½, ±1, ±2`; `A₂` ratios `±1` | holds |
| `groupRealRank_eq_zero_iff_compactSpace` | `SU(2)`; universal cover of `SL₂(ℝ)` | rank `0`, compact; rank `1`, noncompact with infinite centre | holds |
| `realRank_sl`, `realRank_sp` | `n = 0, 1, 3` | `sl(Fin 0) = 0`, `0 − 1 = 0` in `ℕ`; `n = 3` gives `2`; `sp(Fin 0) = 0` | holds; R07 |
| `lie_mem_nonnegEigenSubmodule` | arbitrary `X` | `[E_a, E_b] ⊆ E_{a+b}` for the derivation `ad X`; `a, b ≥ 0 ⇒ a + b ≥ 0` | holds without `hθ`, `hX` |
| `exists_subgroup_eq_dynamicalParabolic` | any Hausdorff topological group | `S_{gh} ⊆ cl S_g · cl S_h`, compact; inversion continuous | holds for every `X`; R06 |

- **Gate and dependency check.** The worker's gate at this head passed every check. Dependency check: `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`. Nothing changed outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean` runs in 16 s with 16 `sorry` warnings and nothing else. I ran `#check @` on all 29 declarations and compared each with its README statement. The dropped binders (`FiniteDimensional`, `T2Space`, `BoundarylessManifold`) are on definitions whose bodies do not use them, so no statement changes.
- **Scratch probes.**
  - Four declarations close in one step (R07).
  - `realRank 𝔤𝔩₂(ℝ) = 0` is proved.
  - R06's two group-level statements elaborate.
- **Source locators checked against the text: 2 of 2 readable, both support their claims.**
  - Borel–Tits, *Groupes réductifs*, Thm 14.4, p. 146 supports §2.3's `𝐆(ℝ) = 𝐆(ℝ)°·𝐒(ℝ)`.
  - Kostant 1973, Prop. 2.4, p. 422 supports §2.4 for elements. §2.4's subalgebra step is the roadmap's own argument; I checked it.
- **Library declarations checked at the pins:** 41 by `#check` and 10 by source file and namespace; 3 are absent (R05).
- **Cross-roadmap citations resolved: 20.**
  - On main: LieGroups Layers 0–5, 5A, 7 and 9; RiemannianGeometry R1.2, R1.3, R2, R4 items 1, 4 and 6, and R5a; SmoothBundlesConnections B1.4; ReductiveGroups Layers 4 and 7; LieHighestWeight Layer 0; RootSystems; CompactGroups Layer 0; HopfRinow.
  - At open heads: AF §2.3a and ALS.F.1.
- **Description's unchecked values:** I recomputed the §5.3 curvatures and the §5.6 volumes and radii (table above); all hold.
- **Overlap check:** I read the scope of FlagVarieties, AutomorphicFormsOnReductiveGroups, LieHighestWeight, ShimuraData and RiemannianGeometry (open list), of LieGroups, LieHighestWeight and RiemannianGeometry (main list), and of NoncompactQuantumSymmetry, which the description names. The third list is empty. Shared objects and their owners:
  - restricted root system and chamber orbits: LieGroups Layer 9 (R02);
  - maximality of `K`: LieGroups Layer 9; conjugacy of maximal compact subgroups of real points: ALS.F.1 (R03);
  - minimal parabolic `P = MAN`: AF §2.3a, already cited;
  - conjugacy of maximal compact subgroups in NoncompactQuantumSymmetry M0: this roadmap owns it, and NoncompactQuantumSymmetry should cite it.

## Not verifiable

- Knapp, *Lie Groups Beyond an Introduction*, 2nd ed. (2002): every Knapp locator (VI §§2, 4–6; Thm 6.16, Cor 6.19, Prop 6.28, Thm 6.31, Prop 6.52, Thm 6.57, Prop 6.59; VII §§2, 7, Thm 7.40; App. C). The sources service found the Springer DOI paywalled and no legal copy. Check against the book whether Thm 7.40, cited at §3.3, lies in VII §7 or VII §4.
- Helgason, *Differential Geometry, Lie Groups, and Symmetric Spaces* (1978): I §13, III §7, IV, V, VI §2, VII §2, X. The sources service found no legal source.
- Eberlein (1996), Warner (1972), Borel–Ji (2006), Bourbaki *Lie* IV §2: publisher-only books with no open copy.

## Source issues

- none
