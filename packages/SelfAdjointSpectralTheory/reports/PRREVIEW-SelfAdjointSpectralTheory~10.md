# Review of SelfAdjointSpectralTheory (pull request #1854 at 78bfc94)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

## R01 (P3) — Layer 1 §1.2–§1.6 still state theorems without a locator

**Location.** README lines 289–424, §1.2–§1.6. For example, line 291: "For a star homomorphism `π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H)`, not necessarily unital, define the essential subspace `H_π` as the range of `π(1)`".

**Claim.** Previous R03 is only partly repaired. §3.4, §3.5, §4.2 and the Duhamel estimate now have locators. The theorems of §1.2–§1.6 still have none: the degenerate-representation laws, regular pushforward and naturality, transport, restriction and direct sums, planar reduction and concentration, and the bidual embedding with the Goldstine comparison.

**Witness.** Searching the README for `Teschl2009|Conway1990|Schmudgen2012` finds line 261 (§1.1) and then line 445 (§2.1), and nothing in between.

**Repair.** Give each target of §1.2–§1.6 the theorem and page that states it, as §1.1 does with Conway1990 Theorem IX.1.14. Conway1990 is uncertified in the manifest, so cite it by locator alone. Where no source states a target in this form, cite the source result it specialises and say so. One locator is checked here: after "the support is `σ(T)`, not `K`" in §1.5, add "(Teschl2009, Theorem 3.8, p. 97, line 4015, for self-adjoint `T`)".

## R02 (P3) — The description's summary omits the BanachAlgebras supplier

**Location.** Description, `roadmap-summary` block: "That four-layer roadmap takes from BanachSpaceTheory only the finite regular measures …, from VonNeumannAlgebras the bounded Borel calculus and Cayley-transform spectral measure, and its other foundations from Tau Ceti".

**Claim.** The head also consumes BanachAlgebras §8.1 (for §2.1) and Mathlib. The sentence says that everything outside BanachSpaceTheory and VonNeumannAlgebras comes from Tau Ceti.

**Witness.** README lines 90–91: "BanachAlgebras §8.1 owns the compact spectral decomposition on Banach spaces, consumed by §2.1". The supplier contract at lines 235–238 says the same.

**Repair.** Replace the sentence with: "That four-layer roadmap takes from BanachSpaceTheory only the finite regular measures on a compact space and their Riesz isometry with the dual of C(K), from BanachAlgebras §8.1 the compact spectral decomposition, from VonNeumannAlgebras the bounded Borel calculus and Cayley-transform spectral measure, and its other foundations from Mathlib and Tau Ceti; six headline theorems replace seventy declarations."

## Previous findings

- R01 — repaired: §3.2 lines 546–547 now read "A Borel set `B ⊆ ℝ` of resolvent points of `A` … has `P(B) = 0` (Teschl2009, Corollary 3.9, p. 97, line 4031)". Scope lines 97–99 name UnboundedOperators §1.6 as the owner of the support theorem.
- R02 — repaired: §3.5 lines 643–647 now read "has resolvent `R(z) = M_{(z − h)⁻¹}` at every nonreal `z` … satisfies `IsSpectralMeasure` for `M_h`". Scope lines 99–100 leave self-adjointness and the spectra to UnboundedOperators §1.7 and §3.5.
- R03 — partly repaired: §3.4, §3.5, §4.2 and the Duhamel estimate cite Teschl2009 at lines 597, 609, 615, 644–646, 715, 717 and 741. §1.2–§1.6 (lines 289–424) still cite nothing: see this report's R01.
- R04 — repaired: line 569 cites "Teschl2009, Theorem 2.18, p. 77, line 3170 … with the remark after Theorem 3.8, p. 97, line 4030". Conventions lines 111–113 record Teschl's separability assumption.
- R05 — repaired: the §3.1 *Needs:* line 520 lists `MeasureTheory.Measure.ext_of_resolventTransform`. The §4.3 route at lines 745–750 now stays in the bounded calculus of `P`, and its *Needs:* lines 753–758 list every input.
- R06 — repaired: lines 800–803 read "Part A is SA-A01–SA-A24, … Part E SA-E01–SA-E47 (the numbering skips SA-C57–SA-C61, SA-C73–SA-C75 and SA-E42)".
- R07 — repaired: Downstream consumers no longer lists BanachAlgebras. SpectralSubspacePerturbation is now under "Owned by roadmaps that build on this one" (line 101).
- R08 — repaired (deferred as D01): the family index now gives the four layers (lines 48–52), the suppliers row (line 82), the dependency paragraph (lines 96–103) and the ownership notes (lines 122–141). Its OneParameterSemigroups link is `../../Completed/OneParameterSemigroups/README.md`.
- R09 — repaired: the summary now reads "MorseNovikov keeps its programme and headline theorems". The SelfAdjointSpectralTheory bullet states the new suppliers, the 70 dropped declarations and the id map. A separate sentence of the summary is this report's R02.

## Deferred findings

- D01 — resolved: this pull request revises `TauCetiRoadmap/OperatorTheory/README.md` (scope line, summary bullet, prerequisites row, dependency paragraph, ownership notes) to describe the four layers and the current suppliers.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §3.2 resolvent points are `P`-null (Cor. 3.9) | `A=diag(0,1)`, `B=ℝ∖{0,1}`; `A=0`, `B=ℝ∖{0}`; `H=0` | `P(ℝ∖{0,1})=0`; `P(ℝ∖{0})=0`; `H=0`: every real point is in the resolvent set and every `P(B)=0` | true | none |
| §3.2 Check (no converse) | `M_t` on `L²(ℝ)`, `B={t₀}` | `P({t₀})=0`, yet `t₀∈σ=ℝ`; no real resolvent points, so only `B=∅` meets the hypothesis | true | none |
| §3.3 / `forall_le_re_inner_iff_proj_Iio_eq_zero` (new locator) | `diag(0,1)`, `c=0`, `c=½`; Teschl Thm 2.18 with l.4030 | `c=0`: bound holds, `σ⊆[0,∞)`, `P(Iio 0)=0`; `c=½`: `⟪e₁,Ae₁⟫=0<½`, `σ⊄[½,∞)`, `P(Iio ½)=e₁₁` | agrees with source | none |
| §3.4 truncation (Thm 3.1) | `M_t`, `f_n=1_[−n,n]` | `f_n→1` pointwise with `sup≤1`; `‖(1−P_n)ξ‖²=∫_{\|t\|>n}\|ξ\|²→0`; `‖1−P_n‖=1` | strong, not norm | none |
| §3.4 `G_δ` = Teschl's `f_ε` | `λ₀=0`, `ε=δ=1`, `M_t` | `1_{ℝ∖(−1,1)}λ⁻¹=1_{\|s\|≥1}s⁻¹`; `A G₁=P(\|s\|≥1)`; `‖G₁‖=1=δ⁻¹` | matches l.4026–4028 | none |
| §3.4 grid (strong σ-additivity) | `diag(0,1)`, `ε=1`, `v=(1,2)` | `‖P[0,1)v‖²+‖P[1,2)v‖²=1+4=5=‖v‖²` | true | none |
| §3.5 multiplication form | `h=t` on `L²[0,1]`, `g=1`, `z=i`; the field of `−h`; `h=1_[0,½]` | both sides `−(log2)/2−iπ/4`; the `−h` field gives `(log2)/2−iπ/4`; `½/(i−1)+½/i=−¼−¾i` on both sides | true; Check discriminates | none |
| §4.2 `‖nR(±in)‖≤1`, `S_n=s_n(P)` | `A=1`, `n=1`; `M_t` | `\|R(i)\|=1/√2`; `r_{in}+r_{−in}=−2s/(n²+s²)`, times `−n²/2` gives `s_n`; `sup s_n=n/2` at `s=n` | true | none |
| §4.3 commuting Duhamel route | `S=diag(1,2)`, `T=0`, `ψ=e₂`, `t=π/2` | `‖(e^{iπ}−1)e₂‖=2 ≤ (π/2)·2=π` | true | none |
| §4.3 / `tendsto_ofBoundedExp_yosidaApproximant` (new route) | `A=a`; `M_t`; the integrand bound | `s_n(a)→a`; `\|e^{ix}−e^{iy}\|²≤4`; at `s=n` the phase gap is `tn/2` | true; strong only | none |
| Conventions: separability | Teschl l.1780; Thm 6.6 proof l.5767 | p. 42 assumes separability; Thm 6.6's finite-rank approximants are Teschl's definition of compactness (l.5752) | claim holds | none |
| Former Parts as id ranges | SA ids on main vs the head's table | main has 24/86/79/39/46 = 274 ids, with gaps C57–61, C73–75 and E42; the head's rows expand to the same 274 | exact | none |
| §1.2 degenerate | `K={0,1}`, `π(f)=f(1)e₂₂` on `ℂ²` | `π(1)=e₂₂`; `P_π({1})=e₂₂`, `P_π({0})=0`; `P_π(K)=e₂₂≠1` | true; no locator | R01 |
| §1.3 pushforward | `φ:{0,1,2}→{0,1}` with `0,1↦0`, `2↦1`; `π=diag(f(0),f(1),f(2))` | `P_π.map φ({0})=e₁₁+e₂₂`; `π∘φ*(g)=diag(g(0),g(0),g(1))` gives the same | true; no locator | R01 |
| §1.4 sums and transport | `T₁=diag(1,0)`, `T₂=3`; swap `U` on `ℂ²` | `‖T₁⊕T₂‖=3=max`; `P_{π′}({1})=Ue₂₂U⁻¹=e₁₁`, the measure of `diag(f(1),f(0))` | true; no locator | R01 |
| §1.5 concentration | `K=[−1,1]⊆ℂ`, `π=diag(f(−½),f(½))` | `σ(T)={±½}⊆K`; `P_π(K∖σ)=0`; `U=(0,1]`: `P_π(U)=e₂₂≠0` | true; no locator | R01 |
| §1.6 bidual embedding | `K={0,1}` | `C(K)=ℂ²`, `M(K)=ℓ¹(2)`, bidual `ℓ^∞(2)`; `ι=id`, `‖ι f‖=max\|f\|` | true; no locator | R01 |
| Description summary | suppliers it names vs the contracts | summary: BanachSpaceTheory, VonNeumannAlgebras, Tau Ceti; contracts at lines 216–238 add BanachAlgebras §8.1 | omission | R02 |

The rows for the untouched statements (§1.1, §2.1, `IsSpectralMeasure`, §3.1, §4.1) stand as in the previous review, of 8e4f220.

- **Teschl2009 locators checked against the text (14), all on the stated printed page (the page markers are offset by 12):** l.1780 p.42; (2.21) l.2424 p.59; (2.72) l.3056 p.74; Thm 2.18 l.3170–3172 p.77; l.3587 and (3.7) l.3605 p.88; Thm 3.1 l.3687 p.90; Thm 3.8 proof l.4025–4029, remark l.4030 and Cor 3.9 l.4031 p.97; Thm 5.1 proof l.5215 p.124; l.5752 and Thm 6.6 l.5757.
- **Pinned declarations opened (8):** Tau Ceti `ProjValMeasure/Integral.lean:248` (`continuous_integral`), `ResolventTransform/Inversion.lean:173`, `Normed/Operator/Exponential.lean:79`, `Group/Stone/Basic.lean:35,64,86`; Mathlib `Normed/Algebra/Exponential.lean:521,580` (`NormedSpace.exp_add_of_commute`, `NormedSpace.map_exp`).
- **Cross-roadmap citations resolved:**
  - UnboundedOperators on main: §1.6 (l.303–307, which consumes SA-E08, mapped here to §3.2), §1.7 (l.309, 319) and §3.5 (l.580).
  - The family index at this head.
  - Main's SelfAdjointSpectralTheory cites V4.0.Fields, BanachAlgebras A8, OrthogonalGeometry and BanachSpaceTheory B1/B5, as the description says.
- **Gate:** the worker's gate passes every check at 78bfc94. My rerun matches except `outside-folder` 5: BanachSpaceTheory (2 files), MorseNovikov (2 files) and `OperatorTheory/README.md`, all folders of this pull request. The diff outside those folders is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1902 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Elaboration:** `lake env lean …/Suggested.lean` exits 0 with 6 warnings, all `sorry`. The change touches one docstring line, and the 8 elaborated types in the signatures file are unchanged, with no lost binder.

Overlap check: read UnboundedOperators (main, §§1.6, 1.7 and 3.5) and the OperatorTheory index (this pull request). `roadmaps grep` over every open head and main found the changed objects only here and in UnboundedOperators. QuantumFoundations, VonNeumannAlgebras, OneParameterSemigroups, AutomorphicSpectralTheory, SmoothBanachRepresentations and VariationalMethods stand as read at 8e4f220. Shared objects and their owners:
- `supp P_A = σ(A)`: UnboundedOperators §1.6.
- Self-adjointness of the maximal multiplier and the spectra of multiplication operators: UnboundedOperators §1.7 and §3.5.
- The multiplication-operator spectral measure and the Yosida approximation of the Stone group: this roadmap.

## Not verifiable

- Conway1990, Theorem IX.1.14 and Chapter IX: the manifest settles it as uncertified, and there is no legal open copy.
- Schmudgen2012, Theorem 5.7: the manifest settles it as uncertified, and there is no legal open copy.

## Source issues

- **Gap** in Teschl2009 at Theorem 2.18 and its proof, p. 77: for symmetric `A` the source states that `A − E ≥ 0` exactly when `σ(A) ⊆ [E, ∞)`, and the proof's "resp. `A ≥ E`" drops self-adjointness; it should assume `A` self-adjoint, since the closed minimal `−d²/dx²` on `(0, ∞)` is nonnegative with negative spectrum; affects nothing.
