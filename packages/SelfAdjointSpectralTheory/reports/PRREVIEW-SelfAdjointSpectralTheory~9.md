# Review of SelfAdjointSpectralTheory (pull request #1854 at 8e4f220)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

## R01 (P2) — §3.2's support theorem is also UnboundedOperators UO-A06's

**Location.** README lines 529–532: "The spectrum is the support of `P`: … a real `λ` lies in `LinearPMap.spectrum A` exactly when `P((λ − ε, λ + ε)) ≠ 0` for every `ε > 0` (Teschl2009, Theorem 3.8 …)".

**Claim.** On main, UnboundedOperators owns `supp P_A = σ(A)`. From this roadmap it consumes only the one-way statement, former SA-E08. This head now proves the full equivalence as well, so the theorem has two owners.

**Witness.** UnboundedOperators README (main) line 305, §1.6 (UO-A06): "Prove `supp P_A=σ(A)` … (Teschl (2009), Theorem 3.8 and Corollary 3.9, p.97); consume SAST SA-E08 for `P_A(B)=0` on Borel resolvent regions."

**Repair.** Replace the bullet with: "Every nonreal number is a resolvent point, and a Borel set of real resolvent points has `P(B) = 0` (Teschl2009, Corollary 3.9, p. 97, line 4031)." Adjust the atoms Check at line 545 to match. Under Downstream consumers, name UnboundedOperators §1.6 as the owner of `supp P = σ(A)`. Do not cite it as a supplier, because that would create a cycle.

## R02 (P2) — §3.5 re-proves self-adjointness of the maximal multiplier, which UnboundedOperators UO-A07 owns

**Location.** README lines 620–623: "for a σ-finite measure `ν` … and real measurable `h`, the multiplication by `h` on `L²(ν)` with domain `{g : h g ∈ L²(ν)}` is self-adjoint, … and its spectrum is the essential range of `h`".

**Claim.** On main, UnboundedOperators owns the maximal multiplier on every measure space, with self-adjointness for real symbols (UO-A07). It also owns the spectrum API of multiplication operators (UO-C05). Here, former SA-E47 claimed only the spectral projections.

**Witness.** UnboundedOperators README (main) line 319, §1.7 API: "The realization is closed and dense; real symbols almost everywhere give self-adjointness." Line 309 (UO-A07) states `existsUnique_maximal_multiplier` "on every measurable space and every measure".

**Repair.** Replace the clause from "is self-adjoint" through "essential range of `h`" with: "has resolvent `M_{(z − h)⁻¹}` at every nonreal `z`, so `B ↦ M_{1_{h⁻¹(B)}}` satisfies `IsSpectralMeasure` for it (Teschl2009, (2.72), p. 74, line 3056)." Then list UnboundedOperators §1.7 and §3.5 under Downstream consumers.

## R03 (P3) — Six sections state theorems without a locator

**Location.** §1.2–§1.6 (lines 273–407), §3.4 (lines 577–600), §3.5 (lines 614–627), §4.2 (lines 682–697), and the commuting Duhamel estimate (lines 711–712).

**Claim.** None of these theorems carries a theorem or page locator. Every theorem needs one, and only seven of the fifteen sampled sections have one.

**Witness.** No `Teschl2009`, `Conway1990` or `Schmudgen2012` citation appears between lines 273 and 407, or between lines 577 and 712 outside §4.1 and §4.3.

**Repair.** Add a locator at each claim. Three are checked here:
- The spectral-gap inverse of §3.4 is the operator in Teschl2009's proof of Theorem 3.8, p. 97, lines 4025–4029.
- The multiplication operator of §3.5 is Teschl2009 (2.21), p. 59, line 2424.
- The essential range of §3.5 is Teschl2009 (2.73), p. 74, line 3064.

For §1.2–§1.6 and §4.2, which Teschl does not treat, cite the theorem of Conway1990 Chapter IX or Schmudgen2012 that states each.

## R04 (P3) — §3.3 cites a theorem that does not state the criterion, and Teschl's separability assumption is not recorded

**Location.** Line 553: "(Teschl2009, Theorem 3.8, p. 97, line 4015, with the quadratic form …)". Line 102: "`H`, `H′`, `H_i` are complete complex inner product spaces".

**Claim.** Theorem 3.8 characterises `σ(A)` by `P`; the lower bound ⇔ spectrum statement is a different theorem. Separately, Teschl assumes every Hilbert space is separable. This roadmap cites Teschl at arbitrary `H` and never says so.

**Witness.** Teschl2009 line 3170, Theorem 2.18, p. 77: `A − E ≥ 0` if and only if `σ(A) ⊆ [E, ∞)`. Teschl2009 line 1780, p. 42, assumes all Hilbert spaces are separable.

**Repair.** At line 553, write "(Teschl2009, Theorem 2.18, p. 77, line 3170, and the remark after Theorem 3.8, p. 97, line 4030)". Add to Conventions: "Teschl assumes separable Hilbert spaces (Teschl2009, p. 42, line 1780). The cited proofs do not use separability, and Schmudgen2012, Theorem 5.7, states the spectral theorem without it."

## R05 (P3) — Two proof routes use inputs that their *Needs:* lines do not name, and in §4.3 that no layer owns

**Location.** Lines 499–506 (§3.1 uniqueness by "Stieltjes inversion", with *Needs:* at line 503). Lines 713–718 (§4.3: "`S_n → A` in the strong resolvent sense …" and "the Duhamel estimate between `exp(i t S_n)` and `U(t)`").

**Claim.** §3.1's uniqueness uses a pinned theorem that its *Needs:* line omits. In §4.3, nothing here or at the pins owns strong resolvent convergence. The commuting Duhamel estimate is stated for bounded `S` and `T`, but the route applies it to `U(t)`, whose generator is unbounded.

**Witness.** Tau Ceti `MeasureTheory.Measure.ext_of_resolventTransform` (`MeasureTheory/Measure/ResolventTransform/Inversion.lean:173`) is Stieltjes uniqueness. `roadmaps grep 'strong resolvent'` matches only this README.

**Repair.**
- Add `MeasureTheory.Measure.ext_of_resolventTransform` to §3.1's *Needs:* line and to the Tau Ceti contract.
- In §4.3, replace both routes with this one: `exp(i t S_n)` is the integral of `s ↦ exp(i t s_n(s))`, by §4.2 and Mathlib `NormedSpace.map_exp` applied to `P.integral`. `U(t)` is the integral of `s ↦ exp(i t s)`, by §4.1 and polarisation. Then `‖(exp(i t S_n) − U(t)) ψ‖² = ∫ |exp(i t s_n(s)) − exp(i t s)|² dμ_ψ → 0` by `TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`.
- Name these inputs in §4.3's *Needs:* line.

## R06 (P3) — The dropped Part A–E labels, which other roadmaps cite, are not mapped

**Location.** Lines 762–766, "Former SA numbering": "Each former id is listed with where its content lives".

**Claim.** The table maps SA ids, but roadmaps on main also cite "SelfAdjointSpectralTheory Part B", "Parts C–E" and so on. Those headings are gone, and nothing says which rows they became.

**Witness.** On main, QuantumGroups line 65 and IndexTheory line 180 cite "SelfAdjointSpectralTheory Part B". VariationalMethods line 969 cites "Parts C–E", and UnboundedOperators line 7 cites "Part A … Part E".

**Repair.** Add after line 766: "Former Part A is SA-A01–SA-A24, Part B SA-B01–SA-B86, Part C SA-C01–SA-C87, Part D SA-D01–SA-D39 and Part E SA-E01–SA-E47; a citation of a Part resolves through its rows." These ranges were checked against main.

## R07 (P3) — Downstream consumers lists a supplier

**Location.** Line 751: "BanachAlgebras §8.1 names Layer 2's compact normal decomposition as its consumer." Also lines 93–95: SpectralSubspacePerturbation sits under "Left to named owners and consumed by section".

**Claim.** BanachAlgebras §8.1 is a supplier (contract at line 219), not a consumer. Nothing is consumed from SpectralSubspacePerturbation; it consumes this roadmap.

**Witness.** The contract at lines 219–222 reads "From TauCetiRoadmap.BanachAlgebras. §8.1 …". SpectralSubspacePerturbation's `Suggested.lean` on main imports this roadmap's module at line 8.

**Repair.** Delete line 751. Move the SpectralSubspacePerturbation bullet (lines 93–95) to Downstream consumers.

## R08 (P3) — The family index still describes the old roadmap

**Location.** `TauCetiRoadmap/OperatorTheory/README.md` line 80: "| `SelfAdjointSpectralTheory` | `OrthogonalGeometry`, `OneParameterSemigroups`, `BanachSpaceTheory` B1/B5 (SA-B63/65 only) |". Also lines 47–50, 94–100, 118–123 and 131–135.

**Claim.** At this head, this roadmap consumes VonNeumannAlgebras, BanachSpaceTheory §5.4 and BanachAlgebras §8.1. It hands the bounded Borel calculus to VonNeumannAlgebras and takes Stone's theorem and the Sylvester equation from Tau Ceti. The index still assigns all of these to this roadmap's "Parts A and B".

**Witness.** Index line 132 says "`SelfAdjointSpectralTheory` owns the bounded Borel functional calculus". This README's lines 78–80 say "VonNeumannAlgebras owns the bounded Borel calculus".

**Repair.**
- Row 80: "`VonNeumannAlgebras` V2/V10, `BanachSpaceTheory` §5.4, `BanachAlgebras` §8.1".
- Lines 47–50: restate the Summary's four layers.
- Delete the roadmap's sentences at lines 94–100.
- Lines 118–123 and 131–135: attribute the Sylvester equation and Stone's theorem to Tau Ceti and the bounded Borel calculus to VonNeumannAlgebras.
- Relink OneParameterSemigroups as `../../Completed/OneParameterSemigroups/README.md`.

## R09 (P3) — The description says this roadmap keeps its programme, and omits the change of suppliers

**Location.** Description, roadmap-summary block: "SelfAdjointSpectralTheory and MorseNovikov keep their programmes and headline theorems." Also the bullet "SelfAdjointSpectralTheory, revised in full".

**Claim.** The head hands the bounded Borel calculus, the multiplication models and multiplicity to VonNeumannAlgebras and drops 70 `Suggested.lean` declarations. It adds VonNeumannAlgebras and BanachAlgebras as suppliers, drops OrthogonalGeometry, and retires every SA id into a mapping table. The description states none of this.

**Witness.** README lines 78–86 ("VonNeumannAlgebras owns … (V4.0.Multiplication)"). The worker's diff of the folder shows "Lean declarations: 70 removed, 7 added, 1 restated".

**Repair.**
1. Replace the sentence with "MorseNovikov keeps its programme and headline theorems."
2. Append to the bullet: "It now consumes VonNeumannAlgebras V2.BorelCalculus and V10.ClosedOperators and BanachAlgebras §8.1, and no longer OrthogonalGeometry. Former SA-B03–B13, B26–B30, B48, B54–B55, B57, B59–B61, B64, B79 and B85–B86 pass to VonNeumannAlgebras, and Parts A, C and D are consumed from Tau Ceti. `Suggested.lean` drops 70 declarations, and the README maps every former SA id."

## Previous findings

- R01: repaired. There is no sorry'd data; `IsSpectralMeasure` and `yosidaApproximant` have real bodies (`sorry-data=0`).
- R02: repaired. The README's Parts A, C and D are consumed from Tau Ceti by name; `OneParameterUnitaryGroup` and `def spectrum` are gone; the old SA ids (GeneralizedCohomology's SA-D15–D17 included) map at lines 907–909.
- R03: repaired. Lines 78–86 consume V2.BorelCalculus and V10.ClosedOperators, map SA-B85/B86 to V4.0.Multiplication and drop the false Downstream sentence.
- R04: repaired. Summary lines 16–20 list six headlines, all stated in `Suggested.lean` in `∃!` or diagonal form, including the compact normal eigenbasis.
- R05: repaired. The imports are `Mathlib` and three `TauCeti.*` modules.
- R06: repaired. No padding remains, and the one-tactic probes fail.
- R07: repaired. The house shape is in place, with `**Checks.**` and `*Needs:*` in every section and Examples and Dependencies in every layer.
- R08: partly repaired. §1.1, §2.1, §3.1–§3.3, §4.1 and §4.3 have locators; R03 and R04 cover the rest.
- R09: repaired. Links are relative, and `../../../Completed/OneParameterSemigroups/README.md` resolves.
- R10: repaired. Line 130 now reads `AlgHom.spectrum_apply_subset`, and `readme-ids-missing` is 0.
- R11: repaired. The diff outside the pull request's folders is empty.
- R12: settled. The overlaps report lists no other open pull request that changes this roadmap.
- R13: repaired except for `export _root_.LinearPMap (spectrum)` in `TauCeti.LinearPMap` (lines 37–41). This is kept because SpectralSubspacePerturbation on main imports this module (its line 8) and uses `TauCeti.LinearPMap.spectrum` (its line 200). It is not raised, because deleting the alias would break a roadmap on main.
- R14: repaired. The scalar-measure layer and Goldstine come from Tau Ceti (lines 179–184), BanachSpaceTheory supplies only §5.4, and SA-B58 maps to Tau Ceti.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.1 / `projValMeasure_eq_of_regular_of_integral_eq` | K={0,1}, π=diag(f(0),f(1)) on ℂ²; labels swapped; K=[0,ω₁] with the Dieudonné measure | swapped labels: ∫1_{0}=e₂₂ ≠ π(1_{0})=e₁₁; Dieudonné vs δ_{ω₁}: both integrate f to f(ω₁), but give {ω₁} the values 0 and 1, and μ_D is not regular | true; regularity needed | none |
| §1.2 degenerate representations | K=[0,1], π(f)=f(0)e₁₁ on ℂ²; π=0; K=∅ | π(1)=e₁₁ is idempotent and self-adjoint, so P_π(K)=e₁₁≠1; π=0 gives H_π=0; unital π on ∅ forces 1=0, so H=0 | true | R03 |
| §1.3 pushforward | φ≡l₀; inclusion {0,1}→[0,1] | P.map φ(B)=1_B(l₀)·1, the measure of g↦g(l₀)·1; (0,1)↦P(∅)=0, {0}↦e₁₁ | true | R03 |
| §1.4 direct sums | T_i=i·1 for i∈ℕ; T=(1,2) on ℂ⊕ℂ; I=∅ | (1/(i+1))∈ℓ² (Σ=π²/6) maps to (i/(i+1))→1, not in ℓ²; ‖diag(1,2)‖=2=sup; I=∅: ℓ²=0 and sup ∅=0 | true; bound needed | R03 |
| §1.5 concentration | closed disc, π(f)=f(z₀), \|z₀\|<1; K={0,1} | T=z₀, σ={z₀}, P_π(K∖{z₀})=0, P_π(U)=1 for U∋z₀; diag(0,1) gives σ=K | true | R03 |
| §1.6 bidual embedding | K a point; atomic-part functional on M([0,1]); f=1_[0,½] | ι=id; point masses force f≡1, but ι(1)(Leb)=1 ≠ 0=atomic(Leb); \|a−1\|+\|a\|≥1, so ess sup\|g−f\|≥½ | true | R03 |
| §2.1 / `exists_hilbertBasis_forall_hasEigenvector_of_isStarNormal` | rotation (0,−1;1,0); Jordan block; the 5×5 Check matrix | R(1,−i)=i(1,−i); ⟨(1,−i),(1,i)⟩=0; ⟨e₁,Re₂⟩=−1≠1=⟨Re₁,e₂⟩, so the pinned symmetric theorem does not apply; Jordan: only ℂe₁; columns 45,128,2,350,280, all 10 cross products 0 | true; beyond pin | none |
| `IsSpectralMeasure` (definition) | A=a on ℂ; A=diag(0,1), ξ=(1,1); A=0 with δ₁ | \|ξ\|²/(z−a) on both sides, Teschl's sign gives the negative; 1/z+1/(z−1) on both; 1/(z−1)≠1/z, so the wrong measure is excluded | discriminating | none |
| §3.1 / `existsUnique_isSpectralMeasure` | H=0; A=a; Teschl2009 line 3983 | H=0: only the zero field, both sides 0; A=a: only δ_a·1; uniqueness from pinned `Measure.ext_of_resolventTransform` | true | R05 |
| §3.2 spectral subspaces | A=diag(0,1), λ=1, δ=½; λ=½; M_t on L²(ℝ) | restriction to ℂe₁ is 0, resolvent at 1 is 1≤2; P((½−ε,½+ε))=0 for ε<½, so ½∉σ; P({t₀})=0 while σ=ℝ | true; support clause duplicated | R01 |
| §3.3 / `forall_le_re_inner_iff_proj_Iio_eq_zero` | diag(0,1) with c=0 and c=½; M_t; M_{\|t\|}; H=0 | c=0: bound holds, P(Iio 0)=0; c=½: fails at e₁, P(Iio ½)=e₁₁; P(Iic 0)=e₁₁≠0 though the bound holds; M_t: both sides false for every c | true; open half-line needed | R04 |
| §3.4 cut operator, gap inverse, reassembly | M_t, δ=1, ξ=1_[0,½]; reassembly with c=∞; Q₁ alone on ℂ² | ‖G₁‖=sup_{\|t\|≥1} 1/\|t\|=1; AG₁ξ=0≠ξ; c=∞ forces Q_ix=0, so ‖x‖²=0; Q₁ with x=e₂, y=0: c·1≤0 fails | true | R03 |
| §3.5 bounded and multiplication operators | h=1_[0,½] on L²[0,1]; ν=0; T=diag(0,1) | σ(M_h)={0,1}, P({1})=M_h; L²(0)=0, σ=∅=supp 0; P=δ₀e₁₁+δ₁e₂₂ | true; self-adjointness duplicated | R02 |
| §4.1 / `inner_apply_eq_integral_exp` | A=a with a=1, t=π/2; diag(0,1), ξ=(1,1); t=0 | e^{ita}\|ξ\|² gives i\|ξ\|², Teschl's e^{−itA} gives −i\|ξ\|²; 1+e^{it}; ‖ξ‖² | true; sign pinned | none |
| §4.2 / `yosidaApproximant` | A=1, n=1; A=0; n=0; M_t | R(i)+R(−i)=−1, so S₁=½=n²a/(n²+a²); A₁⁺=(1−i)/2 is not real; A=0 gives S_n=0; S₀=0; sup n²t/(n²+t²)=n/2 at t=n | true | R03 |
| §4.3 / `tendsto_ofBoundedExp_yosidaApproximant` | A=a; M_t; S=(0,1;1,0), T=(0,1;1,−1) | e^{itn²a/(n²+a²)}→e^{ita}, e^{i/2} at a=t=n=1; at s=n the phase gap is tn/2, so convergence is not in norm; (S−T)e₁=0, but the t² terms differ by −½(0,1)≠0 | true; route unowned | R05 |
| Teschl hypotheses (all Teschl locators) | Teschl2009 line 1780 | p. 42 assumes separable spaces; Conventions line 102 allows arbitrary H | hypothesis dropped silently | R04 |
| "Former SA numbering" table | 65 SA ids cited by other roadmaps; Part labels | all 65 ids present (`comm` on the expanded table: no gap); "Part B" (QuantumGroups line 65) has no row | Parts unmapped | R06 |
| Supply direction | BanachAlgebras §8.1 | contract line 219 makes it a supplier; Downstream line 751 lists it as a consumer | inconsistent | R07 |

- Source locators checked in the Teschl2009 text (13): (3.40) line 3881, Thm 3.7 line 3983, Thm 3.8 line 4015, Cor 3.9 line 4031, Thm 3.21 line 4497, Thm 5.1 line 5183, Thm 5.2 line 5232, Thm 6.6 line 5757, (6.47) line 6588, Thm 6.31 line 6602, Lemma 6.36 line 6655, Thm 2.18 line 3170, p. 42 line 1780. Every cited printed page is correct.
- Pinned Tau Ceti declarations opened (19): `ProjValMeasure/Basic.lean:91,583`; `Integral.lean:218,279`; `DominatedConvergence.lean:77`; `Group/Stone/Basic.lean:35,72,86`; `Group/Unitary.lean:249,282,339`; `Stone/Unbounded.lean:106`; `LinearPMap/Resolvent/Basic.lean:169`; `InnerProductSpace/Spectrum.lean:152`; `SelfAdjointMaximal.lean:29`; `Dual/Goldstine.lean:50`; `ResolventTransform/Inversion.lean:173`; `VectorMeasure/Uniqueness.lean:100,122`; `Representation/DiagonalMeasure.lean:102`.
- Pinned Mathlib declarations opened (3): `RieszMarkovKakutani/Real.lean:408`, `Measure/Regular.lean:1183`, `Normed/Algebra/Exponential.lean:580`. All 189 backticked library names in the README were found at the pins.
- Cross-roadmap citations resolved: VonNeumannAlgebras on main, V2.BorelCalculus (l.863) and V10.ClosedOperators (l.2944), both anchors valid; BanachSpaceTheory §5.4 at this head (l.1354); BanachAlgebras §8.1 on main (l.1913); Completed/OneParameterSemigroups lines 39–48, which give this roadmap the imaginary-shift Yosida approximants.
- Gate: the worker's gate at 8e4f220 passes, every check 0. My rerun matches except `outside-folder` 4, which is BanachSpaceTheory and MorseNovikov, this pull request's own folders.
- Dependency check: `depcheck: 206 roadmaps, 1902 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean …/Suggested.lean` exits 0 with 6 warnings, all `sorry`.
- Signatures and probes: `#check @` on all 8 declarations matches the README's generality, with no lost binder. The one-tactic probes (`aesop`, `simp`, the pinned symmetric eigenbasis) fail on every headline. `IsUnitary` includes complex linearity, so the diagonal form of §4.1 determines `U(t)`.

Overlap check: read UnboundedOperators, VariationalMethods and the OperatorTheory index (main); QuantumFoundations, OneParameterSemigroups (#1325 and Completed), AutomorphicSpectralTheory, SmoothBanachRepresentations and SpectralManifolds (open); VonNeumannAlgebras, BanachAlgebras and BanachSpaceTheory (suppliers). Shared objects and their owners:
- `supp P_A = σ(A)`: UnboundedOperators UO-A06 (R01).
- The self-adjoint maximal multiplier: UnboundedOperators UO-A07 (R02).
- The bounded Borel calculus, the multiplication models and the Cayley-transform spectral measure: VonNeumannAlgebras, consumed here.
- The imaginary-shift Yosida approximants: this roadmap.
- Everything else these roadmaps share with this one, they consume.

## Not verifiable

- Conway1990, Theorem IX.1.14 (§1.1): settled in the manifest as uncertified. There is no legal open copy, so the text was not read.
- Schmudgen2012, Theorem 5.7 (§3.1): settled in the manifest as uncertified. There is no legal open copy, so the text was not read.

## Source issues

- **Misprint** in Teschl2009 at (3.40), p. 94: the source says "which is know as the Borel transform"; it should be "known"; affects nothing.
- **Misprint** in Teschl2009 at Theorem 6.31, proof, p. 154: the source introduces the cutoff as `χ_n` but bounds and uses it as `χ_m`; it should be `χ_m` throughout; affects nothing.
