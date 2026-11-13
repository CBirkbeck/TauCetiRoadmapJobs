# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at dfb1f63)

**Verdict:** needs changes

## R01 (P2) — The cyclic-vector theorem has two owners

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:164` “This roadmap owns the cyclic-vector theorem over characteristic-zero differential fields with nonzero derivation (§RD.1.2–§RD.1.6) … FormalConnectionsOpers F6 consumes the `F=ℂ` specialization”; RD.1.7 (line 2499); `Suggested.lean:227–243` (`CyclicFor`, `katz_cyclic_vector`).

**Claim:** FormalConnectionsOpers owns this theorem at the same generality and states it in its `Suggested.lean`. It is earlier in the merge order (41 against 157) and imports nothing from this roadmap. Each roadmap names the other as its consumer.

**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:2806` at the head of pull request #1056 (`4b3f57b`): “§6.2 is the owner of the cyclic-vector theorem … PadicDifferentialEquationsAndRigidCohomology, later in the merge order … is to import §6.2”. Its `exists_cyclicVector` has `katz_cyclic_vector`'s hypotheses.

**Repair:**
- In `Suggested.lean`, delete `CyclicFor`, `katz_cyclic_vector` and the `RD1` section. Drop “the cyclic-vector theorem for a nonzero derivation over any characteristic-zero field (RD.1.7),” from the module docstring.
- Delete README line 2503 (“`Suggested.lean` states the cyclic-vector theorem as `RD1.katz_cyclic_vector` …”).
- Retitle RD.1.7 “Cyclic vectors over `F_ρ` and annulus function fields”, with this statement: “For `F_ρ` (the completion of `K(t)` for `|·|_ρ`, `∂ = d/dt`) and for the fraction field of the functions on an annulus, every finite-dimensional differential module has a cyclic vector. This is FormalConnectionsOpers §6.2 (`exists_cyclicVector`), applied with `∂t = 1 ≠ 0` in characteristic 0.” Set its *Needs* to FormalConnectionsOpers §6.2 *Cyclic vectors and the `GL_n` flag/oper equivalence* and §RD.1.1, and keep its Checks.
- In RD.1.5, delete the sentence “Over a differential field of characteristic zero with `∂t=1`, at least one of these candidates is cyclic”. It is FormalConnectionsOpers §6.2's form of Katz's theorem; the ring statements stay.
- Replace the first and third sentences of line 164 with: “FormalConnectionsOpers §6.2 owns the cyclic-vector theorem over characteristic-zero differential fields with nonzero derivation (`exists_cyclicVector`). This roadmap owns Katz's candidates over differential rings (§§RD.1.3–RD.1.5) and the finite-ramification formal normal forms, slopes and descent over `F((t))` (§RD.6.52a).”
- Add a FormalConnectionsOpers §6.2 bullet under “From other roadmaps”, and add the roadmap to Layer RD.1's Dependencies.

## R02 (P3) — RD.1.11 cites the wrong section of Christol–Dwork

**Location:** `README.md:2619` “Christol–Dwork, *Modules différentiels sur des couronnes*, Section 2.2, p. 676”; line 2614 “Christol-Dwork Section 2.2, where `R(M, r) = ω‖δ‖_sp^{-1} = min(lim inf ‖G_s/s!‖^{-1/s}, r)`”.

**Claim:** Section 2.2 of Christol–Dwork is *Corps des restes* (pp. 674–675). `R(M, r)` is defined in Section 2.3, *Rayons de convergence dans les disques génériques*, on p. 676.

**Witness:** `Christol-Dwork` line 394 (heading “2.2. Corps des restes”), line 429 (heading of §2.3), line 456 (the definition of `R(M, r)`, after the p. 676 header at line 437).

**Repair:** At line 2619 replace “Section 2.2, p. 676” with “Section 2.3, p. 676”; at line 2614 replace “Christol-Dwork Section 2.2” with “Christol-Dwork Section 2.3”.

## R03 (P3) — RD.4.34 re-derives the dagger Poincaré lemma that the pinned Tau Ceti proves

**Location:** `README.md:8006` “Overconvergent Poincaré lemma: the operator `∫ dx_n, x^I ↦ x^{I + e_n}/(i_n + 1)`, preserves `W_n` because |1/`(i_n + 1)|_p ≤ i_n + 1` grows polynomially …”

**Claim:** At `2fd255d`, Tau Ceti proves that one-variable primitives of overconvergent series are overconvergent, and that closed one-forms on `W_n` are exact. Neither step 2 nor the Tau Ceti contract cites these results.

**Witness:** `TauCeti.Dagger.primitive_mem_washnitzerAlgebra` (`TauCeti/RingTheory/Dagger/WashnitzerAlgebra.lean:639`) and `TauCeti.Dagger.washnitzerAlgebra.exists_pderiv_eq_iff` (`TauCeti/RingTheory/Dagger/Poincare.lean:64`). Both hold over any ultrametric normed field of characteristic 0.

**Repair:** Rewrite step 2 as: “Overconvergent Poincaré lemma: one-variable primitives preserve `W_n` (Tau Ceti `TauCeti.Dagger.primitive_mem_washnitzerAlgebra`), and a closed one-form on `W_n` is exact (`TauCeti.Dagger.washnitzerAlgebra.exists_pderiv_eq_iff`). The Koszul homotopy in `x_1, …, x_n` (induction on `n`) gives exactness in degrees `≥ 2`.” Add both declarations, with their files, to “From Tau Ceti” with “Used in RD.4.34”.

## R04 (P3) — RD.3.38's non-example proves nothing in residue characteristic 2

**Location:** `README.md:6784` “Non-example: the polynomial ring `O[t]` itself is not henselian along `π: 1 + πt` has no square root in `O[t]`.”

**Claim:** RD.3.38 allows any complete discrete valuation ring `O`. In residue characteristic 2, `s² − (1 + πt)` has no simple root modulo `π`, so the henselian property does not promise it a root. The missing square root then witnesses nothing.

**Witness:** `O = ℤ₂`, `π = 2`: `s² − 1 − 2t ≡ (s + 1)²` modulo 2, a double root.

**Repair:** Replace the bullet with: “Non-example, for every residue characteristic: `O[t]` is not henselian along `π`. The polynomial `s² + s − πt` has the simple roots `0` and `−1` modulo `π`, but it has no root in `O[t]` (compare degrees). In `O⟨t⟩†` it has the root `Σ_{n≥1} (−1)^{n−1} C_{n−1} (πt)^n`, where `C_m` is the `m`-th Catalan number.”

## R05 (P3) — RD.0.6 and RD.1.11 repeat Checks

**Location:** `README.md:908` “For `ℓ` with trivial valuation `W_r(ℓ, O) = W(ℓ, O)` for every `r`.”; line 910 “… lies in `W(ℓ, O)` but in no `W_r(ℓ, O)`.”; line 2631 “Trivial module: `R(O, ρ) = ρ, T = 1`.”

**Claim:** Each of these bullets restates an earlier Check of the same section, so the sections list more Checks than they test.

**Witness:** Line 905 “If `v_ℓ` is trivial then `W_r(ℓ, O) = W(ℓ, O)` for all `r ≥ 0`”. Line 907 states line 910's element and conclusion. Line 2625 “`R(O, ρ) = ρ` and `T(O, ρ) = 1`”.

**Repair:** Delete lines 908, 910 and 2631.

## R06 (P3) — Author initials, journal names and French words are set as code

**Location:**
- `README.md:14738` “`J`. `S`. Balakrishnan, `N`. Dogra, `J`. `S`. Müller”;
- line 5480 “Chapter `V` §7”;
- line 6776 “Solutions `d'`équations `à` coefficients”;
- line 2632 “equals `−0`.012, `−0`.002”.

**Claim:** These code spans contain no mathematics, and the last one splits a number in two. House style keeps code spans for ASCII mathematics.

**Witness:** After line 14727 (the References), 78 code spans hold a single capital letter followed by a full stop. `` `d'` `` occurs at lines 3044, 6776, 6798, 14766 and 14768. Split decimals occur at lines 2632 and 3503.

**Repair:**
- Remove the backticks around author initials, journal abbreviations, Roman chapter numerals, and `d'` and `à` in titles.
- Write the values at lines 2632 and 3503 whole, for example `−0.012`, `−0.002`, `−0.001`, `−0.0002`.

## R07 (P3) — The description lists three merged roadmaps as open dependencies

**Location:** Pull request description: “In open pull requests of ours: … #1199 (ResolutionOfSingularitiesCharacteristicZero) … #785 (ReductiveGroupsPartII) … #1126 (AnalyticNumberTheoryPartI) …”

**Claim:** These three pull requests are no longer open: their roadmaps are on main. The description also omits FormalConnectionsOpers, which R01 makes a supplier.

**Witness:** `TauCetiRoadmap/ReductiveGroupsPartII`, `TauCetiRoadmap/AnalyticNumberTheoryPartI` and `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero` exist on main (`7342e8f`). None of #785, #1126 or #1199 is in the open-roadmap index of 2026-11-13.

**Repair:**
- Delete “#1199 (ResolutionOfSingularitiesCharacteristicZero), ”, “#785 (ReductiveGroupsPartII), ” and “#1126 (AnalyticNumberTheoryPartI), ” from that sentence.
- After the sentence, add: “In another author's open pull request: #1056 (FormalConnectionsOpers §6.2, the cyclic-vector theorem applied in RD.1.7).”

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| Previous R01: RD.4.10, RD.4.24, RD.4.38, RD.5.66 against CR.6.4 | `G_m` over `k` | Line 7409: “For smooth `X` and the constant isocrystal this is the theory of … §CR.6.4”; `H¹ = K·dt/t` both sides, Frobenius `p·dt/t` | Repaired |
| Previous R02: RD.0.42, RD.3.27 in Lean | `Suggested.lean:101, 255` | Both stated on `weakCompletion`/`washnitzerAlgebra`; imports at lines 4–5 | Repaired |
| Previous R03: pins and Tau Ceti contract | Headings, line 69 | `1b1ccf4…`, `2fd255d…`; four Dagger carriers listed; multivariable Tate Weierstrass at `MvPowerSeries/TateAlgebra/Weierstrass/` | Repaired |
| Previous R04: RD.0.56 non-example | `C(S², ℝ)`, `v = (x₀,x₁,x₂)` | `R³ = Rv ⊕ T` via `w ↦ (x·w)v + (w − (x·w)v)`; `Pv = e₀` would give `T ≅ R²` | Repaired (line 2296) |
| Previous R05: RD.2.45 locator | `be0376e` line 5462 | Already cited Serre GTM 67 IV §§1–3, V §7, VI §2 and Katz AM Studies 116 Ch. 1 | Finding was mistaken; no change |
| Previous R06: docstring | `Suggested.lean:15–22` | No line starts with `theorem`; change summary lists 19 declarations, file has 19 | Repaired |
| Previous R07: description | Summary block | “Freeness of projectives over overconvergent power series rests on commutative algebra owned here” | Repaired |
| `arabia_controlled_lifting` (RD.0.39) | `S = R`, `I = 0`; `I = R` | `I = 0`: `E = B`, `pE = p`, `eI = id`. `I = R`: `B/IB = 0`, leaving the étale lifting along `ker p` | Pass |
| `exists_frobenius_lift_weakCompletion` (RD.0.42) | `O = ℤ_p`, `S = O[x,1/x]`; `f = 0`; `O = ℤ_p[√p]` | `φ(x) = x^p(1+px)`, `(1+px)⁻¹ ∈ S†`, `φ(x) − x^p ∈ pS†`. `f = 0`: `σK ≡ id`. Ramified: `σK = id` | Pass; `Algebra.Smooth` gives `FiniteType` |
| `HasFiniteFreeResolution(LE)`, RD.0.55(a) | `0→2ℤ→ℤ→ℤ/2→0`; `I = (2,1+√−5)` | Lengths `0, 0, 1`. `I` is not stably free (`I ≅ R` fails), so neither `I` nor `R/I` has an FFR | Consistent both ways |
| RD.0.55(b): `isStablyFree`, iff | Tangent module `P`; `ℤⁿ` | `0→R→R³→P→0`, so `P` has an FFR of length 1 and is stably free; `ℤⁿ` satisfies both sides | Pass |
| RD.0.55(c), flat | `ℤ → ℚ`, `ℤ/2`, `n = 1` | `ℚ ⊗ ℤ/2 = 0`, length `≤ 1` with `k = 0` | Pass |
| RD.0.55(c), regular | `ℤ[t] → ℤ⟦t⟧`, `g = t`, `N = ℤ`; `A = ℤ[t]/(t²)` | `A ⊗ N = ℤ`, `0→A→A→ℤ→0`. In `ℤ[t]/(t²)`, `t·t = 0` violates `hgA` | Pass |
| RD.0.55(d), Serre | `ℤ[t]/(2,t)`; base `ℤ/4` | Koszul ranks `1, 2, 1`. Over `ℤ/4`, `ℤ/2` has no FFR, so `h` fails | Pass |
| `UnimodularEquiv`, `HasUnimodularExtension` | `(2,5)` over `ℤ`; `C(S²,ℝ)` | `P = [[3,−1],[−5,2]]`, `det 1`, `P(2,5) = (1,0)`; the sphere vector is not completable | Pass |
| RD.0.56(a), Lang XXI.3.4 | `f = (t²+1, t)` over `ℤ[t]` | `(t²+1) − t·t = 1`; two elementary moves give `(1,0) = f(0)` | Pass |
| RD.0.56(b), iff | Zero ring, `ℤ`, `C(S²,ℝ)` | Both sides true, true, false | Pass |
| `CyclicFor`, `katz_cyclic_vector` (RD.1.7) | `ℚ(t)`, `D = d/dt` on `K²`; `δ = 0`; `𝔽_p(t)` | `v = (1,t)`, `Dv = (0,1)`, `det 1`. `δ = 0` with `D = 0` fails; `∂^p = 0` kills dimension `p+1` | True; duplicate of FormalConnectionsOpers §6.2 (R01) |
| `rigid_quillen_suslin` (RD.3.27) | `n = 0, 1`; `ℚ_p`, `t − 1/p`, `t − 1` | `W₀ = K`; `W₁` a PID; `t − 1/p = −p⁻¹(1 − pt)` a unit on radii below `p`; `W₁/(t−1) = K` | Pass; FF Lemmas 6.1–6.3, Props. 6.4–6.6, Thm. 6.7 at `Kedlaya-FF` lines 486–585 |
| RD.0.6 (Definition) | `x = Σ[y^{q^i}]π^i`, `v(y) = −1`, `q = 2`, `r = 1` | `v_{2,1} = −2`, `v_{3,1} = −5`; `w_r(π) = 1`, `w_r([z]) = r·v(z)`. SFR Defs. 2.1.4–2.1.8, pp. 6–7 (`Kedlaya-SFR` lines 198–246) | Pass; repeated Checks (R05) |
| RD.3.28 (Definition) | `M = K⟨x⟩†/(x)` | A connection forces `1 = x′ ∈ (x)`: none exists, as Lemma 3.3.4 predicts. Def. 3.3.1, Rem. 3.3.3, Lem. 3.3.4, p. 22 (`Kedlaya-Finiteness` lines 808–836) | Pass |
| RD.1.11 (Definition) | Dwork `D = −πt⁻²`; `D = ∂+π` at `ρ = 1`; `p = 3`, `a = 1/10`, `s = 50` | `R = ρ²`; `R = 1`; the `j = 4` Lah term gives `−0.6/50 = −0.012`, as printed | Values pass; locator §2.2→§2.3 (R02) |
| RD.0.42 (Theorem) | `S = O_K[x, x⁻¹]` | `x^q` and `x^q(1+πx)` are two lifts. Arabia 3.3.2(b) pp. 636–637, 3.3.4(a) p. 637; van der Put (2.4.4)(ii) p. 37 | Pass |
| RD.4.24 (Theorem) | `G_m`, constant coefficient | `H¹(K⟨t,t⁻¹⟩†) = K·dt/t` matches the CR.6.4 Check. Finiteness Rem. 4.3.3 p. 27; Weil II §2.4 pp. 15–16; Crew (8.1.1) p. 749 | Pass |
| RD.0.27 (Theorem) | `log(1+t)`; `1 + p/t` | `log(1+t)` vanishes at `ζ_{p^n} − 1`, radii → 1: not a unit; `1 + p/t` a unit. SFR Cor. 2.5.12; LM Cor. 3.23 | Pass |
| RD.0.7 (Lemma) | `x = [z]π`, `y = [z′]π²` | Extremal indices `1 + 2 = 3`; `w_r(xy) = r(v(z)+v(z′)) + 3`. SFR Lemma 2.1.7 p. 6 | Pass |
| RD.0.8 (Lemma) | `u = 1 + [z]π`, `v(z) = −1` | `v_{1,r}(u) = 1 − r > 0 = v_{0,r}(u)` iff `r < 1`: a unit after shrinking `r`. SFR Rem. 2.1.10, Lem. 2.1.12 p. 7 | Pass |
| RD.0.10 (Lemma) | `x = [z]π^m` | `i = j = m`: total multiplicity 0, no slopes. SFR Rem. 2.4.6, Lem. 2.4.7 p. 15 | Pass |
| RD.0.11 (Lemma) | `x = 1` | `u₀ = 1`, all other `uᵢ = 0`. SFR Def. 2.5.2 p. 16, Prop. 2.5.5 p. 18; the README's `u_jπ^j` corrects the source | Pass |
| RD.0.12 (Lemma) | (e): `x ∈ Γ_b ∖ Γ_r`, `I = [b,b]`, `b < r` | `min_{n<0} v_{n,b}(x) = ∞` forces `x = y ∈ Γ_r`, which is false; the README's added hypothesis excludes this case. SFR Cors. 2.5.6–2.5.9 pp. 18–19 | Pass |
| RD.3.38 (Lemma) | `p` odd: `s² − (1+πt)`; `p = 2` | Binomial root in `O⟨t⟩†`; `(s+1)²` modulo 2. Étesse Prop. 2, Thms. 3–4, pp. 113–117; Elkik Thm. 3 p. 569, Thm. 6 p. 580 | Locators pass; non-example (R04) |
| RD.4.3 (Lemma) | `R = K×K`, `S = K×K×K`, `f(a,b) = (a,b,b)` | `Tr∘f = diag(1,2)`, with a componentwise projector. Finiteness Prop. 3.4.3, Rem. 3.4.4 p. 24 | Pass |
| RD.2.1 (Lemma) | `R_K/(log(1+t))` | Leibniz gives `f′ = 1/(1+t) ∈ (f)`, a unit, so a contradiction. Crew Prop. 6.1 p. 735; André §3.4 p. 10 | Pass |
| RD.4.34 (R03) | `W₁`: `f = 1`; `W₂`: `(x₂, x₁)` | Potentials `x` and `x₁x₂`, as `exists_pderiv_eq_iff` gives | True; cite the pin |

- **Gate.** The worker's gate at `dfb1f63` passes. My rerun with the default order reports only `depcheck: UPWARD: PadicDifferentialEquationsAndRigidCohomology (#120) -> CongruenceSpectralGap (#157)`, which is the move the worker makes. The prescribed depcheck on the moved order prints `depcheck: 206 roadmaps, 1915 edges, 0 problem(s)`. The diff outside the folder is empty.
- **Elaboration.** `lake env lean` gives 14 `declaration uses sorry` warnings and nothing else. The one-tactic probes (`rfl | simp | infer_instance | aesop | trivial`) fail on all 14. I compared the 19 elaborated `#check @` types with the README: no binder is dropped. `Algebra.Smooth` includes `FinitePresentation` (Mathlib `RingTheory/Smooth/Basic.lean:539`).
- **Sources.** I checked 56 locators against 14 texts: Kedlaya-SFR, -LocalMonodromy, -Finiteness, -WeilII, -Overview, -SwanI and -FF; Christol–Dwork, Crew, André, Arabia, van der Put, Étesse (Padova) and Elkik. Only R02's is wrong.
- **Library declarations opened at the pins (13).**
  - Mathlib: `Smooth/Basic.lean:539`; `Frobenius.lean:55` (`AlgHom.IsArithFrobAt`).
  - Tau Ceti: `Dagger/WashnitzerAlgebra.lean:111, 639`; `WeakCompletion/Basic.lean:185–190`; `WeakCompletion/Map.lean:78`; `DaggerAlgebra.lean:65`; `Omega/Basic.lean:79, 227`; `Poincare.lean:43, 64, 78`.
  - Tau Ceti `PseudoCoherent/FiniteProjectiveDimension.lean:69`: `IsFPD` is about projective resolutions, so a different object from an FFR.
  - No Robba, annulus or isocrystal carrier exists at `2fd255d`.
- **Citations resolved.**
  - CrystallineCohomology §CR.6.4 *Rigid cohomology of smooth strata* (head of #857, line 11048).
  - AlgebraicKTheory §0.5 `tangentSections_stablyFree_not_free` (main).
  - FormalConnectionsOpers §6.2 (head of #1056).
  - The 5 `roadmaps resolve` leads are this file's own names.
  - No other roadmap owns Quillen–Suslin, the unimodular extension property or FFRs over arbitrary rings. PurityOfBranchLocus §0.3 covers local rings only.
- **Overlap check.**
  - Read: CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open); AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main). The third list is empty. I also read FormalConnectionsOpers and ColemanIntegration by object.
  - Owners of shared objects:
    - smooth constant-coefficient rigid cohomology: CrystallineCohomology §CR.6.4 (cited);
    - annulus and Robba extensions RD.0.1–RD.0.3, RD.0.18 and RD.0.27: this roadmap (PadicHodgeTheory consumes);
    - Frobenius lifts on weak completions (RD.0.42): this roadmap (ColemanIntegration L1.5 imports);
    - the §RD.0.54 rings: this roadmap (RelativeFarguesFontainePartII consumes);
    - dagger algebras and weak completions: AdicSpacesPartIV F1 with the Tau Ceti carriers;
    - polynomial Newton polygons: NewtonPolygons (cited);
    - the cyclic-vector theorem: both FormalConnectionsOpers and this roadmap (R01).
  - AInfCohomology shares nothing.

## Not verifiable

- Lang, *Algebra*, Chapter XXI (RD.0.55, RD.0.56): no legal open copy exists. I cross-checked the numbering against Kedlaya-FF §6.
- Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*, Chapter 1 (RD.2.45): a Princeton book with no open copy.
- Berthelot 96-03, Prop. 2.5.2(ii), Cor. 2.5.6 and §2.1.2, and Berthelot *Finitude* Prop. 1.10 (RD.4.24): not read this round. The Kedlaya and Crew locators of the same target were checked.
- Étesse, ASENS 2002, Prop. 6, p. 586 (RD.3.38(3)), and Kedlaya–Xiao Def. 1.2.8 (RD.1.11): not fetched this round.

## Source issues

- **Error** in Kedlaya-SFR at Lemma 2.5.11, p. 19: the source says that for any closed `I ⊆ [0, r]`, some `y ∈ Γ_r` approximates `x` to within `min_{n<0} v_{n,s}(x)`; it should require `r ∈ I` or that minimum to be finite, since `x ∈ Γ_b ∖ Γ_r`, `I = [b,b]`, `b < r` forces `x = y`; affects a stated result.
- **Misprint** in Kedlaya-SFR at Lemma 2.5.3(a), p. 17: the source writes the summand of the partial sum as `u_iπ^i`; it should be `u_jπ^j`; affects nothing.
- **Misprint** in Kedlaya-SFR at Definition 2.4.2, p. 14: the source says the intervals `I ⊆ J` are bounded away from 0; it should say bounded away from `r_0`; affects nothing.
- **Misprint** in Kedlaya-SFR at Corollary 2.5.6, proof, p. 18: the source writes `v_{j,n}(x)`; it should be `v_{j,r}(x)`; affects nothing.
- **Misprint** in Kedlaya-Overview at Definition 5.1.3, p. 28: the source defines the `ρ`-spectral norm as the minimum of `p^{−1/(p−1)}ρ^{−1}` and the lim sup; it should be the maximum; affects a stated result (Definition 5.1.4 would give `R ≥ ρ`).
- **Gap** in Kedlaya-FF at Propositions 6.4–6.5, pp. 14–15: the source applies Lemma 6.2, stated for complete discretely valued fields, to any complete nontrivially valued `K`; it should state Lemma 6.2 for such `K`, whose proof uses only `ρ_n^m ∈ |K^×|`; affects the proof.
- **Gap** in Kedlaya-Finiteness at Proposition 3.4.3, proof, p. 24: the source says that `Trace ∘ f` is multiplication by a positive integer; for `S` of non-constant rank over a disconnected `R` it is a locally constant function, so the argument must be run componentwise; affects the proof.
