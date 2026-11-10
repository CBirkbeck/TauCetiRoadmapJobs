# Review of DGFloer (pull request #1798 at 334507b)

**Verdict:** needs changes

This is a full review of the folder at 334507b. The gate passes, `Suggested.lean` elaborates with only its seven `sorry` warnings, and the dependency check reports no problem.

Of the eight previous findings:
- **Repaired:** five (R03, R04, R05, R07, R08).
- **Repaired, with a new defect:** one (R02). Its repair introduces a false claim, written up here as R02.
- **Not repaired:** two, both in the description (R01 and R06). They are written again as R01 and R04.

The full read found four further defects: one P2 and three P3.

| Id | Priority | Defect |
| --- | --- | --- |
| R01 | P2 | Layer 1 items 2–4 hand their ordinary targets to AlgebraicTopology stages that main does not have, yet the description says nothing must merge first (previous R01). |
| R02 | P2 | 6.4's graph construction is false when `Σ` is disconnected, the case its new inward-component Check admits. |
| R03 | P3 | 6.4 restates the Liouville collar of ContactGeometry CG4 (on main) without citing it. |
| R04 | P3 | The order with the conflicting revision #963 is still not stated (previous R06). |
| R05 | P3 | The scope sentence claims every numbered statement of §§1–6.2 except Theorem B, but Definition 1.7 and Theorems G, H, I are deferred. |
| R06 | P3 | 7.5 gives no locator for the long exact sequence or the Viterbo transfer; Seidel §3 contains neither. |

## R01 (P2) — Layer 1 items 2–4 hand their targets to AlgebraicTopology stages that only open revisions define, and the description says nothing must merge first (previous R01, not repaired)

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:159–175`: "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there", mapping them to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- `:4434–4435`: "AlgebraicTopology consumes nothing of Layer 1".
- The description's merge-order paragraph: "No open pull request must merge before this one".

**Claim.** The README describes the state after an AlgebraicTopology revision has merged. The description does not order that revision first.

**Witness.**
- **Main, AlgebraicTopology (3090489).** Stage 4 stops at item 7, and there is no 5.0, 8.8c or 8.8d. Its 5.5 (`:915–916`) reads "Consume DGFloer Layer 1 item 2's homotopy LES and `arbitraryCWSerreSpectralSequence`".
- **#1652 (c204943).** Its README numbers "### 4.8 Compact generation and the pointed adjunction" (`:1795`), and its 5.5 (`:2035`) again consumes DGFloer Layer 1 item 2.
- **The cited stages** exist only at #1797, #1807, #1808 and #1854.

**Repair** (description only).
1. In the merge-order paragraph, place before this pull request the AlgebraicTopology revision that owns Stage 4 item 8, 5.0, the Serre sequences of 5.5, 8.8c and 8.8d. The description's body already names #1807 and #1808.
2. Add: "#1652 is rebased on that revision before it merges (its 4.8 renumbered, its 5.5 no longer consuming DGFloer Layer 1 item 2)."

**Test.** If this pull request merged alone, main's AlgebraicTopology 5.5 would cite DGFloer Layer 1 item 2, and DGFloer would send that citation back to AlgebraicTopology 5.5. The Serre spectral sequence would then have no owner. With the stated order it has exactly one owner at every step.

## R02 (P2) — 6.4's graph construction is false for disconnected `Σ`, which its new inward-component Check admits

**Location.** `TauCetiRoadmap/DGFloer/README.md:2303–2307`: "the flow of `Z` gives an embedding `Φ(r, x) = φ_{log r}(x)` of the symplectization `((0, ∞) × Σ, d(r α₀))` … On a component of `Σ` along which `Z` points out of `U`, `Φ` maps `(1, ∞) × Σ` into `T*Q ∖ Ū`". Also `:2318`: "equal to `r/f_α` near `Σ_α`".

**Claim.** In 6.4, `U` is any relatively compact open set, and the Lean form of Theorem A allows a disconnected `{F < c}`. Three statements of the graph construction then fail.

**Witness.**
- **(a) The README's own shell**, `U = {½ < |p| < 2} ⊂ T*S³`. Here `Φ(r, (q, p)) = (q, rp)`, so `Φ(4, x) = Φ(1, 4x)` for `x ∈ S*_{1/2}`. So `Φ` is not injective on `(0, ∞) × Σ`.
- **(b) Two shells**, `U = {1 < |p| < 2} ∪ {3 < |p| < 4}`. `U` contains the graph of `1.5·α` with `|α| = 1`, so Theorem A applies with `d = 1`. `Z` points out of `U` along `S*_2`, yet `Φ(7/4, S*_2) = S*_{3.5} ⊂ U`.
- **(c) An inward component with `f_α < 1`.** Near `Σ_α`, `U_α = {r > f_α}`, but `r/f_α < 1` holds exactly on `{r < f_α}`. So `{F_α < 1} = U_α` fails.

**Repair.**
1. State the graph construction for connected `Σ`, the source's setting (Remark 1.3, `bdho-cotangent` lines 223–228). For connected `Σ`, `Z` points outward everywhere by the README's Stokes argument, and forward orbits cannot recross `Σ`.
2. Alternatively, for disconnected `Σ`, add the hypothesis that forward `Z`-orbits from outward components and backward orbits from inward components never meet `Ū`. Under it, assert injectivity of `Φ` only on `(1, ∞) × Σ₊ ∪ (0, 1) × Σ₋`.
3. Take `F_α = f_α/r` near inward components.
4. Keep the shell Check, which satisfies that hypothesis, and add (b) as a negative control.

**Test.**
- On (a), the restricted claims hold: `Φ` maps `(0, 1) × S*_{1/2}` to `{|p| < ½}` and `(1, ∞) × S*_2` to `{|p| > 2}`, both disjoint from `Ū`.
- (b) is excluded by the hypothesis.

## R03 (P3) — 6.4 restates ContactGeometry CG4's Liouville collar without citing it

**Location.** `TauCetiRoadmap/DGFloer/README.md:2303–2305`: "Put `α₀ = λ_Z|_Σ` … Since `L_Z λ_Z = λ_Z`, the flow of `Z` gives an embedding … with `Φ^*λ_Z = r α₀`". No ContactGeometry row appears in the supplier contracts (`:835–880`).

**Witness.** ContactGeometry is on main (`TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:134–143`). Its CG4 proves two things:
- that `α = ι_Zω|_Y` is contact;
- that the flow collar `Φ(s, y) = φ_Z^s(y)` satisfies `Φ^*(−λ) = e^s α`.

It offers this collar "to Floer boundary constructions", under DGFloer's `λ_D = −λ`.

**Repair.**
1. Consume ContactGeometry CG4 for the contactness of `α₀` and the collar near `Σ` (with `r = e^s`).
2. Add a "ContactGeometry CG4" bullet under "From other roadmaps" and to 6.4's *Needs:*.
3. Own here only the extension of the collar to `(0, ∞) × Σ` under completeness of `Z`.

## R04 (P3) — The order with the conflicting revision #963 is not stated (previous R06, not repaired)

**Location.** The pull-request description, which does not mention #963.

**Witness.**
- The overlap check reports that #963 and #1798 conflict in `README.md` and `Suggested.lean`.
- #963 (62109eb) reads at `:555` "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base".
- This head hands the same target to AlgebraicTopology Stage 5.5 (`:167–170`).

**Repair** (description only). Add: "#963 changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its ownership of `arbitraryCWSerreSpectralSequence`, before it merges." If the intended order is the reverse, state that instead.

## R05 (P3) — The scope sentence claims every numbered statement of §§1–6.2 except Theorem B, but Definition 1.7 and Theorems G, H, I are deferred

**Location.** `TauCetiRoadmap/DGFloer/README.md:37–39`: "Every numbered statement of §§1–6.2 of the source paper … other than Theorem B (Theorem 5.14)". The Source coverage table (`:4511–4546`) has no row for Definition 1.7.

**Witness.**
- Definition 1.7 (abundance, `bdho-cotangent` line 415) and Theorems G, H and I (lines 384, 424, 430) are all stated in §1.
- The Continuation paragraph (`:50–54`) and the numbering note (`:192–197`) give them to DGFloerPartII §§4.1–4.6.

**Repair.**
1. Change the sentence to "other than Theorem B (Theorem 5.14), Definition 1.7 and Theorems G, H and I, which DGFloerPartII owns".
2. Add the coverage row "Def 1.7, Thms B, G, H, I | DGFloerPartII".

## R06 (P3) — 7.5 gives no locator for the long exact sequence or the Viterbo transfer

**Location.** `TauCetiRoadmap/DGFloer/README.md:2565–2568`: "(Abouzaid Chapter 1, §§1.5–1.6; Seidel §3); the zero-energy and positive-energy parts and the long exact sequence between them; the Viterbo transfer `ι_!` for exact codimension-zero embeddings."

**Witness.**
- Seidel §3 has only the map `H^{*+n}(M) → SH^*(M)` ((3.1), `seidel-biased` line 220). It has neither the long exact sequence nor the transfer.
- The transfer is Seidel §7(7a), lines 1323–1329.
- Abouzaid §§1.5–1.6 treat cotangent bundles only.

**Repair.** Cite:
- the transfer as "Seidel §7(7a), `seidel-biased` lines 1323–1329";
- the long exact sequence as "the source's Proposition 3.45 with classical coefficients, `bdho-cotangent` lines 2927–2930".

## Previous findings

| Id | Status | Evidence at this head |
| --- | --- | --- |
| R01 | Not repaired | The description's merge-order paragraph now reads "No open pull request must merge before this one". Written again as R01. |
| R02 | Repaired, with a new defect | 6.4 states Corollary E with restricted contact type and a complete Liouville field, for every contact form defining `ξ`, through the graph route of lines 308–317, and adds the `S*Q`, `α = fα₀` Check (`:2322–2329`, `:2344–2351`). The inward-component extension added with it is R02. |
| R03 | Repaired | `:4079–4092` reads "Fix, here and in item 5, the DG local system `𝓕 = C_*(Ω𝓛₀Q)`". The `𝓕 = ℤ` negative control is at `:4116–4120`. 10.5 names `𝓕 ⊗ ℤ/2` (`:4176–4179`). |
| R04 | Repaired | `:181–197` maps G0–G7 to 7.G, Layer 1 items 7–8 to DGFloerPartII §§1.3–1.4, Layer 5 item 7, Layer 10 item 5 (Theorem B) and the Layer 11 items. All target headings exist at DGFloerPartII 05e7c01. |
| R05 | Repaired | `:949–953` cites "Lemma 2.2 and its proof, `barraud-cornea-serre` lines 541–557" and "Proposition 5.2.6 … lines 1638–1694". The References are updated (`:4592–4594`). Both locators were read at the text. |
| R06 | Not repaired | The description does not mention #963. Written again as R04. |
| R07 | Repaired | `:3679–3685` reads "the image of the Morse cocycle of `−H` … under `(Ωi_X)_* : C_*(ΩX) → C_*(Ω𝓛₀X)`". |
| R08 | Repaired | A search for all nine garbled strings (`near0`, `application7`, `separate7`, `capped7`, `require7`, `scalar0`, `leading1/s`, "this roadmap PDE", ". this roadmap") finds none. |

## Verified sound

### Gate, dependency check and Lean

- **Gate.** Rerun on this head: every check passes (`set_option=0 … source-material=0 OK`). The worker's gate also records `build=0`.
- **Dependency check.** `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- **Signatures.** `#check @name` on all seven declarations, in one scratch file elaborated once, matches the README.
  - Every needed binder is present: `SimplyConnectedSpace Y`, `ConnectedSpace Q`, `CompactSpace S`, `FiniteDimensional ℝ E`, `IsUnit d`, `¬ IsMulTorsion …`, `IsEmpty (HomologicalOrientation …)`, `LieGroup I₀ ∞ G`.
  - No declaration lost a binder, and no change was needed.
- **Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide`. All seven statements fail, so nothing is padding.
- **Headlines.**
  - Stated: mod-2 vanishing (1.4); Theorem 5.10 and both cases of Theorem A; Theorem 5.15 and Theorem C (10.5); the torus criterion (11.3).
  - Named in the docstring as not statable, with the missing carrier: Theorems J, K, L and M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion.
  - Corollaries D and E are not headlines.

### Library declarations opened at the pins

All 252 backticked Tau Ceti and Mathlib names of the README were checked mechanically against the pinned sources and resolve. The three regex misses (`…hurewicz₁`, `…mvfderiv_eval₂`, `mappingSpaceEval_comp_const'`) were confirmed by hand. Opened and read:

| Declaration | File and line at the pin | What was checked |
| --- | --- | --- |
| `TauCeti.IsRestrictedContactType` | `TauCeti/Geometry/Symplectic/Liouville/ContactType.lean:105` | global primitive and smooth transverse `Z`; no completeness, as 6.4 says |
| `TauCeti.SmoothForm.IsContactForm.reebVectorField_smul`, `…_neg` | `TauCeti/Geometry/Contact/Reeb.lean:177, 192` | `R_{cα} = c⁻¹R_α` for `c ≠ 0`; `R_{−α} = −R_α` |
| `TauCeti.SmoothTwoForm.IsNondegenerate.mfderiv_reebVectorField_mpullback` | `TauCeti/Geometry/Symplectic/Hamiltonian/Reeb.lean:60` | `dθ = −σ`, `θ(X_K) ≠ 0`, and `R` sent to `θ(X_K)⁻¹ X_K` |
| `TauCeti.fibrationLocalSystem` | `TauCeti/AlgebraicTopology/DGLocalSystem/Fibration.lean:66` | the DG local system of an arbitrary `p : C(E, B)`, as 10.4 uses it for `{⋆} → 𝓛₀Q` |
| `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` | `…/Hamiltonian/AlmostExistence.lean:167` | `∃ ε > 0, ∀ᵐ c'` in `(c − ε, c + ε)`, regular `c'` only |
| `CochainComplex.spectralSequenceFirstPageXIsoCokernel` | `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:425` | page 2, `H^{p+q}(F_{q+1}/F_q)` at `(p, q)`, so 1.3's `i₁ = p − 1`, `i₂ = p` |
| `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm` | `…/Cotangent/Bundle/Fiberwise.lean:114` | `τ_α^*ω = ω − π^*dα`, as 6.3 states |
| `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` | `…/Hurewicz/One/Basic.lean:705`, `…/One/Comparison.lean:160` | path-connected `X`; the sign `−1` against Stage 8.3's map |
| `TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology` | `…/Homotopy/LoopSpace/Aspherical.lean:229` | `[PathConnectedSpace X]`, path-connected `Ω²X` and `H_{m≠0} = 0` |
| the filtered spectral-sequence API (`filtrationFunctor`, `filtrationAbutmentIso`, `…OfFinite`, `…OfExhaustive`, `filtrationFunctorMap`, the comparison theorem) and `TauCeti.ComplexTower` | `Filtered/SpectralObject.lean:304`, `Convergence.lean:51, 118`, `Exhaustive.lean:177`, `Naturality.lean:83`, `Comparison.lean:70`; `Tower/Milnor/Basic.lean:106` | present as 1.3 lists them |

### Seeded sample: locators read at the text

| Target | Locator | Lines read | Result |
| --- | --- | --- | --- |
| 1.1 | Hatcher Thm 2A.1; relations `σ_{fg} ∼ σ_f + σ_g`, `σ_{f̄} ∼ −σ_f` | `hatcher-at` 7228–7258 | supported |
| 1.3 | Weibel 5.5.1(2), 5.5.10; Tau Ceti page convention | Tau Ceti `SpectralObject.lean:30–60, 425` | Tau Ceti part supported; Weibel not verifiable |
| 2.1 | Tau Ceti loop maps; no paper locator | — | the rescaling homeomorphism and its inverse recomputed |
| 2.2 | Hatcher remark after Prop 4.48; BDHO §7.1 | `hatcher-at` 16461–16466; `bdho-morse-dg` 3038–3056 | supported (BDHO cites DK69 Prop 5.5 for the replacement) |
| 5.3 | BDHO §5.3, Prop 10.6.1 | `bdho-morse-dg` 1870–1891, 7091–7095 | supported: closed oriented, equal dimensions, any DG local system |
| 5.4 | BDHO Thm 7.2.1 | `bdho-morse-dg` 3093–3111 | supported: closed manifold base, isomorphism of spectral sequences |
| 5.6 | BDHO Props 13.2.2–13.2.3, Def 13.3.1, Props 13.3.2–13.3.3; Abouzaid Prop 3.2.4, Lemma 3.2.6, Ex 3.2.7, Def 3.2.8 | `bdho-morse-dg` 8753–8865; `abouzaid-viterbo` 2861–2960 | supported; README's `δ/2 < δᵢʳ < δ` is Abouzaid (3.2.19) |
| 6.1 | Tau Ceti periodic orbits and flows; no paper locator | — | the Checks recomputed (below) |
| 6.3 | Corollary D | `bdho-cotangent` 261–292 | supported; `ν∘Ψ_σ∘ν⁻¹ = (q, p − σ)` recomputed |
| 6.4 (repair) | remark before Cor E; Cor E | `bdho-cotangent` 293–317 | statement supported; inward-component extension false (R02) |
| 7.5 | Abouzaid §§1.5–1.6; Seidel §3 | `abouzaid-viterbo` 17–18, 1087–1291; `seidel-biased` 11, 192–596, 1314–1329 | definition supported; LES and transfer unlocated (R06) |
| 8.2 | Def 3.7, Props 3.8–3.9 | `bdho-cotangent` 1786–1810 | supported |
| 8.4 | Props 3.14–3.29 | `bdho-cotangent` 1915–2258 (statement lines) | supported |
| 8.5 | Prop 3.30, Def 3.31, Prop 3.32, Def 3.35 | `bdho-cotangent` 2404–2517 | supported, including `Ψ¹ − Ψ⁰ = D⁻h + hD⁺` |
| 8.7 | Props 3.44–3.46, Thm 3.49 | `bdho-cotangent` 2924–2967 | supported (source misprint below) |
| 10.2 | Thm M / 6.4, Props 6.6–6.7, Cor 4.17 route | `bdho-cotangent` 741–757, 4382–4445 | supported |
| 0.1 (repair) | B–C Lemma 2.2; BDHO Prop 5.2.6 | `barraud-cornea-serre` 541–557; `bdho-morse-dg` 1629–1700, 9055–9065 | supported (over `ℤ/2` in B–C, oriented in BDHO) |
| 10.4–10.5 | Thm 5.10, Prop 5.11, Thm 5.15 | `bdho-cotangent` 4140–4180, 4291–4330 | supported |

### Adversarial table

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 boundary formula | `I`; `I²` | `∂ι₁ = (1) − (0)`; `∂ι₂ = ∂ι₁×ι₁ − ι₁×∂ι₁`, four signed edges | holds |
| 1.1 Check | `S¹ ∨ S¹`; `S¹ ⊔ pt` | `σ_{aba⁻¹b⁻¹} ∼ a + b − a − b = 0`; `H₁ = ℤ` against `π₁(pt) = 0` | holds |
| 1.3 homological regrading | `(p, q)` | `(a, b) = (1 − 2p − q, p − 1)`; target `(p − r, q + r − 1)` gives `(a + r + 1, b − r)`, which is page `r + 1` of `coreE₂Cohomological` | holds |
| 1.3 cohomological regrading | `G_t = F^{−t}` | `b = −p − 1`, `a = 2p + q + 1`, `a + b = p + q` | holds |
| 1.3 Check | `F_p C = C` for all `p` | every `E^r = 0`, while `H(C) ≠ 0` | negative control holds |
| 1.4 mod-2 vanishing (Lean) | `pt`; `M(ℤ/3, 2)`; `S³` | trivial; `2·2 ≡ 1 (3)`; `H₃(S³; 𝔽₂) ≠ 0` excludes it | holds |
| 1.5 sign | `T²`, `N = S¹ × {y₀}` | Hatcher's cap: `[T²] ⌢ β = −1·[v₀₁, v₁₁] = −a = (−1)^{1·1} i_*[N]` | holds |
| 2.1 rescaling | `(L, γ) ↦ (L, γ(L·))`, inverse `δ(min(t/L, 1))` | stopped at `L`, continuous for `L > 0`; `B × S¹` fibres over durations `0` and `1` are `pt` and `Ω S¹` | holds |
| 5.3 `f_*f_! = d·Id` | `z ↦ z²` on `S¹`; `T² → S²` | `f_![pt]` is 2 points, `f_*` gives `2[pt]`; `f_*[S¹] = 2[S¹]`; `f_!f_*` kills `H₁(T²) = ℤ²` since `H₁(S²) = 0` | holds |
| 5.4 Check | double cover | `H₀(S¹; ℤ[ℤ/2]) = ℤ` (coinvariants), `H₁ = ℤ` (invariants) `= H_*(S¹)` | holds |
| 5.6 cut | `Q = S¹`, `r = 1`; constant loop of duration `1` | `𝓛¹ = {q₀ = q₁} = S¹`; `geo¹∘ev₁(c)` has duration `0 ≠ 1` | holds |
| 6.1 Check | `H = p²/2` on `T*ℝ` | `ι_{p∂_q}(dq ∧ dp) = p dp`; source `ι_X(dp ∧ dq) = −p dp` gives `p∂_q`, transported by `ν` to `−p∂_q` | holds |
| 6.1 Check | `(|q|² + |p|²)/2` | time-one map is rotation by `1`, eigenvalues `e^{±i} ≠ 1` | holds |
| 6.3 magnetic translation | `σ = x dy` on `T*ℝ²` | `Ψ'^*λ_can = λ_can − π^*σ`, so `−d(·) = ω_can + dx ∧ dy`; `ν(Ψ_σ(q, −p)) = (q, p − σ)` | holds |
| 6.4 Cor E Check | `S*Q`, `α = fα₀`, `f > 1` | `P = f(q, p)p` gives `|P| = f`, so `K = |P|/f(q, P/|P|) = 1` | holds |
| 6.4 negative rescaling | `α = −α₀` | `(−2)(−α₀) = 2α₀`, `f_α = 2`; `R_{−α₀} = −R_{α₀}` | holds |
| 6.4 embedding of `(0, ∞) × Σ` | shell `{½ < |p| < 2}` | `Φ(4, x) = Φ(1, 4x)` for `|x| = ½` | fails (R02) |
| 6.4 `(1, ∞) × Σ₊ ⊂ T*Q ∖ Ū` | two shells `{1<|p|<2} ∪ {3<|p|<4}` | `Φ(7/4, S*_2) = S*_{3.5} ⊂ U` | fails (R02) |
| 6.4 `F_α = r/f_α` | inward component, `f_α < 1` | `U_α = {r > f_α}` near `Σ_α`; `r/f_α < 1` on `{r < f_α}` | fails (R02) |
| 7.1 CZ normalization | `ε(q² + p²)/2` | `S = −εI`, `CZ = −sign(S)/2 = +1 = n − ind` | holds |
| 7.4 Check | `T²` height function | `FH_{−1}, FH_0, FH_1` of ranks `1, 2, 1` give `H₀, H₁, H₂` | holds |
| 7.4 / 8.4 estimate | `H + ε`, `0 → δ`; `H − ε`; bump `0 → 2δ → δ` | `c = −∫ε' = −δ`; `+δ`; `−2δ + δ = −δ = ε(−∞) − ε(+∞)` | holds |
| 7.5 Check | `a|z|²` | `X_H = 2a(p∂_q − q∂_p)`, 1-periodic at `a ∈ πℤ`; `∫ ½(q dp − p dq)` over the unit circle is `π` | holds |
| 8.2 Check | small Morse `H` | cocycle in `C_*(Ω𝓛₀X)` is `(Ωi_X)_*` of the Morse cocycle of `−H` in `C_*(ΩX)` | holds (R07 repaired) |
| 8.7 Check | `𝓕 = ⊕ ℤ[k]` via augmentation on `D²ⁿ` | `ε(m_{x,y})` is the signed count, so the complex is `𝓕 ⊗ FC(H)`; Künneth with `SH(D²ⁿ) = 0` gives `0` | holds |
| 9.3 truncation | `τ_{≥k}` | degree-0 `c` has `dc = 0`, so `Z_k·c ⊆ Z_k`; positive degrees raise degree; `d(𝓕_{k+1}) ⊆ Z_k` | sub-DG module |
| 9.3 S³ Check | `τ_{≥m}(⊕ℤ[k]) = ⊕_{k≤−m}ℤ[k]` | degree `n`: `⊕_{0≤p≤n−m} H_p(𝓛S³)`, with `H_p = ℤ` for `p = 0` and `p ≥ 2` (from `H_*(ΩS³) ⊗ H_*(S³)`) | holds |
| 9.4 Check | `ℝP²` | `H₂(ℝP²; o) = ℤ`, while `H₂(ℝP²; ℤ) = 0` | holds |
| 10.1 Theorem L | `D²ⁿ`, `𝓕 = ℤ` | `i_{W*}[W, ∂W] = 0` in `SH = 0`; `j_{U!}[W, ∂W] = [U, ∂U] ≠ 0` | holds |
| 10.2 Theorem M Checks | `T^r`; `S²` | `𝓛₀T^r ≅ T^r × Ω₀T^r`, `Ω₀T^r` contractible, so `i_{Q*}` is an isomorphism; `j_!α ∈ H_{−2}(C_*(Ω𝓛₀S²)) = 0` | holds |
| 10.4 Prop 5.11 | `S²`: `𝓕 = ℤ`, `𝓕 = C_*(Ω𝓛₀S²)` | `ev₀∘i_Q = id`, so the kernel is `0`; `ker(ℤ[ℤ] → ℤ)` is free of infinite rank | `𝓕` now fixed (R03 repaired) |
| 10.4 third case | `d = 2`, groups `ℤ/4` | `ℤ/4` is not 2-torsion but is `2²`-torsion | hypothesis correctly excludes it |
| 10.5 Thm 5.10 (Lean) | `π₃ = ℤ/3`, `d = 2`; `π₃ = ℤ/2`; `T³`; `Q = pt` | `a² = a⁻¹ ≠ 1`; `a² = 1` fails; every disjunct fails; trivial groups make `hQ` false | holds |
| 10.5 Thm 5.15 / C (Lean) | `ℝP²`; Klein bottle; `π₂ = ℤ/3`; `S = ℝP² ⊔ ℝP²` | doubling is not onto `ℤ`; `π_{ℓ≥2} = 0`; 5.15 accepts and C refuses; `(a, b) ↦ a + b ≠ 0` | holds |
| 10.5 non-orientable route | `ℝP⁴` | `Ω₀ℝP⁴ ≃ ΩS⁴`, `H₃(ΩS⁴; 𝔽₂) = 𝔽₂`, `π₄ = ℤ` | holds; source's path-loop step (lines 4315–4321) is the link |
| 11.1 Killing form | `𝔲(n)` at `iI`; `𝔰𝔩(2, ℝ)` at `h` | `2n(−n) − 2(in)² = 0`; `4 tr(h²) = 8 > 0` | holds |
| 11.2 Cartan 3-form | `SU(2) → SU(3)` block | `6 tr(¼ diag(−1, −1, 0)) = −3`; own Killing form gives `4·(−½) = −2` | sign `< 0` either way |
| 11.3 torus criterion (Lean) | `T^r`; `SO(3)`; trivial group; `∏_ℕ S¹` | both sides true; `π₃ = ℤ`; `Fin 0 → Circle`; `(ℤ/2)^ℕ` uncountable, excluded by `LieGroup` | holds |

### Cross-roadmap citations resolved this round

- **Main (3090489).**
  - LieGroups Layers 4, 5, 5A and 6, and CompactGroups Layer 0 (under `RepresentationTheory/`).
  - SmoothBundlesConnections B6.0; MorseTheory M4; RiemannianGeometry R2–R3; HamiltonianReduction R1a.2; SymplecticGeometry S0.
  - HeegaardFloer F1.4, F1.5, F2.1 and Lane M; DGAInfinity Layer 5; MorseNovikov N1 and N4 (Layers 1–7 keep the names N1–N7, `:176`).
  - CharacteristicClasses C3.2; DifferentialGeometry Layer 5 and item 0.4; GeometricTopology Layers 1 and 3; PseudoholomorphicCurveAnalysis PH6.3 and PH7.2; UniversalCovers (`Completed/`).
  - AlgebraicTopology: R01. ContactGeometry CG4: R03.
- **Main's DGFloer ids.** The Layer 6–11 item numbering on main matches this head or is mapped by the numbering note. This covers Layer 11 item 3, which StringOrientation (#948, `:52`, `:340`) cites for the finite cover.
- **Open heads.**
  - DGFloerPartII (05e7c01): §§1.3, 1.4, 3.2, 3.3, 4.1–4.6 and Layer 2 exist. Its §3.3 still calls 6.4's input "the Liouville-flow argument", which is its own wording; the id Layer 6 item 4 resolves.
  - #963: R04. #1652, #1797, #1807, #1808, #1854: R01.
  - FukayaTheory's G0–G7, RiemannianGeometry's and ManifoldOptimization's Layer 1 item 7: resolved through the numbering note.
- **Not raised: AnalyticStableMaps.** gap:genus-zero-stable-map-compactness names AnalyticStableMaps (#987), which is not on main. It is not raised for three reasons:
  - main's DGFloer already consumes AnalyticStableMaps M3 (main `:240`);
  - the dependency check reports no edge;
  - the dependence is a stated gap, which waits for no merge.
- **Ownership against open pull requests** was checked by object, with `roadmaps grep`, for symplectization, Liouville collars and the Weinstein conjecture, and against FukayaTheory and DGFloerPartII. No object found by these checks has two owners, apart from R01's AlgebraicTopology hand-off and R03's collar.

## Not verifiable

- **Weibel**, *An Introduction to Homological Algebra*, 5.5.1(2) and 5.5.10 (1.3): no legal copy in the cache, and not in the manifest. The statements are consumed from AlgebraicTopology Stage 5.0.
- **Serre 1951 and 1953** (1.2, 1.4): not in the cache.
- **Settled as uncertified** and cited by locator: Hofer–Zehnder (6.4, 6.5), Struwe, Palais, Bröcker–tom Dieck, Massey, Whitehead and Hofer–Salamon.
- **Outside the sample and not in the cache:** McDuff–Salamon, Abraham–Marsden, Chernoff–Marsden, Hartman, Floer–Hofer–Salamon and Piunikhin–Salamon–Schwarz.

## Source issues

- **Gap** in bdho-cotangent at Corollary 4.17, p. 87: the source states the corollary for every DG local system and derives it from Theorem K, which assumes `H_*(𝓕)` bounded below (lines 688–689, 3763–3766); it should add that hypothesis or extend Theorem K by truncation and colimits; affects a stated result.
- **Error** in bdho-cotangent at the proof of Theorem 5.15, p. 99: the source says the abelian groups killed by tensoring with `ℤ/2` form a Serre class (lines 4322–4323); they do not, since `ℚ` lies in it and its subgroup `ℤ` does not; affects the proof.
- **Misprint** in bdho-cotangent at Theorem 3.49(ii), p. 67: the source says the spectral sequence converges to `SH_*(W)` (line 2967); it should say `SH_*(W; 𝓕)`; affects nothing.
- **Misprint** in bdho-cotangent at Corollary D, p. 7: the source takes `Q` orientable while asserting Theorem C, whose `Q` is non-orientable (lines 265–268); it should drop "orientable" or restrict it to Theorems A and B; affects nothing.
