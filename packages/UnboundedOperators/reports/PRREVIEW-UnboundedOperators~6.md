# Review of UnboundedOperators (pull request #1027 at b46d79f)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Seven findings: one P2 and six P3. This is the head the previous review read. Its single finding (the family index has no entry for this child) is not repaired, and this review does not hold it; the reasons are under *Verified sound*. The push gate passes against the candidate merge order. All 14 declarations elaborate at the pins with exactly eight `sorry` warnings and nothing else. All 15 seeded targets were read at their locators.

## R01 (P2) — Statable spectral headlines are absent: the docstring's claim that the pins have no PVM carrier is false

**Location.** `Suggested.lean:20–23`: "The unbounded spectral-integral, normal spectral, joint-PVM, … headlines cannot yet be stated on their intended carriers: the pins have no normalized projection-valued-measure carrier or unbounded spectral integral." Also `Suggested.lean:25–27` (Friedrichs extremality) and `README.md:39–63`, `:596–597`.

**Claim.** The pinned Tau Ceti (2fd255d9) already implements SelfAdjointSpectralTheory's PVM layer:
- `TauCeti.ProjValMeasure X H`: a normalized PVM on any measurable space, with fields `proj`, `diag`, `proj_univ` and `proj_inter` (`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91`, SA-B14/B21);
- `ProjValMeasure.integral` on `BoundedBorelFunction X` (`Integral.lean:218`, SA-B44) and `norm_sq_integral_apply` (`:305`, SA-B52);
- `polarizedComplexMeasure` (`Polarization.lean:60`, SA-B40) and `integral_polarizedComplexMeasure_eq_inner_integral` (`MatrixElement.lean:83`, SA-B45);
- `map` (`Map.lean:40`, SA-B25) and `ae` (`Null.lean:42`, SA-B49).

On these carriers the following headlines are statable without sorry'd data: the unbounded spectral integral (UO-A01, §1.1), the normal spectral theorem (UO-B02, §2.2) and the joint PVM (UO-B04, §2.5). The docstring itself lists all three as headlines, so their absence is a statable headline left out.

Friedrichs extremality is the same case. The docstring omits it because "the form completion … is not at the pins". But README §4.7 states its equivalent in resolvent order, `(S_F−λ)⁻¹≤(T−λ)⁻¹`, and that form only needs Tau Ceti's `LinearPMap.resolvent` and Mathlib's Loewner order (`ContinuousLinearMap.le_def : f ≤ g ↔ (g - f).IsPositive`).

The README's supplier contracts name none of these Tau Ceti declarations. They cite only the roadmap, and with drifted ids: "the bounded normalized PVM and bounded integral (SA-B49–B57)" are SA-B14 and SA-B44. Lines 596–597 also use `P_{A_ℂ}.diagMeasure`, but the field at the pin is `diag`.

**Witness.** In a scratch file with `import Mathlib` and `import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.MatrixElement`, `#check @TauCeti.ProjValMeasure.integral` elaborates as `TauCeti.ProjValMeasure X H → TauCeti.BoundedBorelFunction X →⋆ₐ[ℂ] H →L[ℂ] H`. All four statements below elaborate at the pins with `sorry` as the only warning.

**Repair.** Add `import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.MatrixElement`, `open scoped InnerProductSpace ENNReal`, and the following statements under the matching layer comments. Each has been elaborated as written, and its truth is checked in the table below (rows A01*, B02*, B04*, F*):

```lean
/-- Unbounded spectral integral (README §1.1, UO-A01): exact second-moment domain,
matrix elements against the polarized measures, density, closedness, norm identity. -/
theorem existsUnique_spectralIntegral {X H : Type*} [MeasurableSpace X]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (P : TauCeti.ProjValMeasure X H) (f : X → ℂ) (hf : Measurable f) :
    ∃! T : H →ₗ.[ℂ] H,
      (∀ x : H, x ∈ T.domain ↔ ∫⁻ t, ‖f t‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      (∀ (x : T.domain) (y : H),
        ⟪y, T x⟫_ℂ = ∫ᵛ t, f t ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x]) ∧
      Dense (T.domain : Set H) ∧ T.IsClosed ∧
      (∀ x : T.domain, ‖T x‖ ^ 2 = ∫ t, ‖f t‖ ^ 2 ∂(P.diag x)) := by
  sorry

/-- Spectral theorem for a normal partial operator (README §2.2, UO-B02). -/
theorem existsUnique_projValMeasure_of_normal {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (N : H →ₗ.[ℂ] H) (hdense : Dense (N.domain : Set H)) (hclosed : N.IsClosed)
    (hdom : N.adjoint.domain = N.domain)
    (hnorm : ∀ x : N.domain, ‖N x‖ = ‖N.adjoint ⟨(x : H), by rw [hdom]; exact x.2⟩‖) :
    ∃! P : TauCeti.ProjValMeasure ℂ H,
      (∀ x : H, x ∈ N.domain ↔ ∫⁻ z, ‖z‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      ∀ (x : N.domain) (y : H),
        ⟪y, N x⟫_ℂ = ∫ᵛ z, z ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x] := by
  sorry

/-- Joint PVM of finitely many strongly commuting self-adjoint operators (README §2.5, UO-B04);
commuting resolvents at `i` is strong commutation by Fuglede's theorem. -/
theorem existsUnique_jointProjValMeasure {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] {n : ℕ}
    (A : Fin n → H →ₗ.[ℂ] H) (hA : ∀ j, IsSelfAdjoint (A j))
    (hcomm : ∀ j k, Commute ((A j).resolvent Complex.I) ((A k).resolvent Complex.I)) :
    ∃! P : TauCeti.ProjValMeasure (Fin n → ℝ) H, ∀ j,
      (∀ x : H, x ∈ (A j).domain ↔ ∫⁻ t, ‖((t j : ℝ) : ℂ)‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      ∀ (x : (A j).domain) (y : H),
        ⟪y, A j x⟫_ℂ =
          ∫ᵛ t, ((t j : ℝ) : ℂ) ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x] := by
  sorry
```

Strengthen `friedrichs_exists_selfAdjoint_extension` with the extremal clause in Tau Ceti's convention `R(t)=(tI−A)⁻¹`. The tested conclusion is: `∃ SF, IsSelfAdjoint SF ∧ S ≤ SF ∧ (bound γ on SF) ∧ ∀ T, IsSelfAdjoint T → S ≤ T → (bound γ on T) → ∀ t : ℝ, t < γ → T.resolvent (t : 𝕜) ≤ SF.resolvent (t : 𝕜)`.

Then:
- **Docstring.** Rewrite `Suggested.lean:20–27`. Name as not statable only headlines whose carrier is missing at the pins: the spectral PVM `P_A` of a given self-adjoint operator (SA-E01 is not at the pin), the Hilbert complexification, and the differential-operator, holomorphic-family and translation-surface constructions already named there. Before keeping either of the following on that list, check it against native carriers:
  - the spectral-type decomposition (UO-C03), against `TauCeti.ProjValMeasure ℝ H`, `Measure.MutuallySingular` and `NoAtoms`;
  - the tensor headlines (UO-F02/F03), against `UniformSpace.Completion (H ⊗[ℂ] K)`. Mathlib's `TensorProduct.instInnerProductSpace` (`Mathlib/Analysis/InnerProductSpace/TensorProduct.lean:146`, arbitrary inner-product spaces) and `UniformSpace.Completion.innerProductSpace` (`Mathlib/Analysis/InnerProductSpace/Completion.lean:92`) already give that Hilbert space.
- **README.** Add a From Tau Ceti paragraph naming the declarations above with their SA ids. Change "SA-B49–B57" at line 60 to "SA-B14 and SA-B44 with their API SA-B49–B57". Write `diag` for `diagMeasure` at lines 596–597.

## R02 (P3) — §1.3 and §1.8 each need the other

**Location.** `README.md:144`: "transport it to SAST's `P_A` through the identification of §1.2 rather than proving it again"; `:198`: "this identification is what transports V10.Affiliation's product rule to §1.3"; `:233`: "*Needs:* §1.1–§1.3 and §1.7".

**Claim.** §1.3's product law is V10.Affiliation's rule for V10's own affiliated calculus. Moving it to UO-A01 needs V10's `φ(T)` to equal UO's `φ[P_A]`. That comparison is not §1.2, which only identifies `A` with `∫λ dP_A`; it is UO-A08 in §1.8, as line 198 says. Yet §1.3's *Needs:* (line 146) omits §1.8, while §1.8 needs §1.3 and §1.7, and §1.7 needs §1.3 (line 182). So the stated route has two cycles: §1.3 → §1.8 → §1.3, and §1.3 → §1.8 → §1.7 → §1.3.

**Witness.** V10.Affiliation states the rule only "In this affiliated calculus" (`VonNeumannAlgebras/README.md:2313–2316` on main). §1.3's *Needs:* reads "§1.1–§1.2; VonNeumannAlgebras V10.Affiliation product rule; HilbertModules H6 natural sum/composition domains".

**Repair.** Make the V10-calculus comparison (the third sentence of §1.8's first paragraph) its own target, UO-A02a, at the end of §1.2. Its *Needs:* are §1.1–§1.2 and VonNeumannAlgebras V10.ClosedOperators (cyclic multiplier model) and V10.Affiliation (calculus and truncation cores). In §1.3, replace "the identification of §1.2" with "UO-A02a" and add UO-A02a to its *Needs:*. The H6 comparison and the source comparisons stay in §1.8.

Checked on the resulting graph: §1.3 → {§1.1, §1.2, A02a}, A02a → {§1.1, §1.2, V10}, §1.7 → §1.3, §1.8 → {§1.1–§1.3, §1.7}. There is no cycle.

Alternatively, prove `(3.39)` for UO-A01 directly (Teschl Lemma 3.5, p.94) and drop the transport.

## R03 (P3) — Two results that roadmaps on main already state are restated here instead of cited

**Location.** `README.md:136`: "Conversely, every self-adjoint partial operator is represented by the existing SAST spectral PVM and `f(λ)=λ`, with equality of domains and actions"; `:541`: "prove indices `(1,1)` and classify the self-adjoint domains `u(1)=e^{iθ}u(0)`".

**Claim.**
- *UO-A02's converse.* VonNeumannAlgebras V10.ClosedOperators already proves it for its spectral measure `P_T`, built from the same Cayley transform as SA-E01. SA-E44 identifies every real PVM satisfying the resolvent formula SA-E05 with SA-E01, so the result transports to `P_A` without being proved again.
- *UO-D05's interval case.* HilbertModules H6 already proves that `−i d/dt` on `H₀¹([0,1])` has deficiency indices (1,1), and parametrizes its self-adjoint extensions `D_λ` by `λ∈𝕋`.

Neither *Needs:* line cites these.

**Witness.** `VonNeumannAlgebras/README.md:2271–2276`: "prove ⟨ξ,Tη⟩=∫t dμ^T_(ξ,η)(t) for η in the domain, which equals {ξ : ∫t² dμ^T_ξ<∞} (Rudin, Theorem 13.30)". `HilbertModules/README.md:795–797`: "prove deficiency indices (1,1), and parametrize its selfadjoint extensions D_λ by λ∈𝕋".

**Repair.**
- In §1.2, cite V10.ClosedOperators' representation, transported to `P_A` along SA-E44, and add both to §1.2's *Needs:*.
- In §4.6, consume H6's indices and its `D_λ`. Prove here only that `D_λ` is the condition `u(1)=e^{iθ}u(0)` (with the explicit map λ ↦ θ) and the spectra `θ+2πℤ`.

Checked at θ=0: the periodic spectrum `2πℤ` is −i times V10's `2πiℤ` for `Tf=f′`, which is the scaling §4.6 itself prescribes.

## R04 (P3) — Three locators point at text that does not state the claim

**Location.** `README.md:150`: "(Teschl (2009), Lemma 3.11 and Lemma 3.12, p.101; Theorem 3.18, p.105)"; `:733` and `:1335`: "§I, p.424"; `:822`: "the oscillator core is Teschl (2009), Theorem 8.5, p.179".

**Claim.**
- (a) The pushforward `P_{f(A)}(B)=P_A(f⁻¹(B))` is Teschl's (3.67), p.101. Lemma 3.11 is the unitary for injective `f` (the recovery half of §1.4). Lemma 3.12 and Theorem 3.18 concern the spectrum of `f(A)`.
- (b) Flato–Simon–Snellman–Sternheimer define analytic vectors and their notions (a)–(c) in the introduction on p.424; §I begins on p.425.
- (c) Teschl's Theorem 8.5 is the three-dimensional oscillator. The one-dimensional Hermite span is derived in §8.3 before it.

**Witness.** (a) `teschl line 4194` gives (3.67); lines 4199–4207 give Lemmas 3.11–3.12. (b) `flato-simon-snellman-sternheimer line 58–74` is p.424; line 113 starts "I. — Structural preliminaries" on p.425. (c) `teschl line 7558–7562`: eigenbasis `ψ_{n1,n2,n3}`; the 1D derivation is at lines 7523–7556 (pp.178–179).

**Repair.**
- (a) Write "(Teschl (2009), (3.67), p.101; the injective recovery is Lemma 3.11, p.101)". Move Lemma 3.12 and Theorem 3.18 to the spectral-mapping sentence of §1.8.
- (b) Write "introduction, p.424" at both places.
- (c) Write "Teschl (2009), §8.3, pp.178–179 (Theorem 8.5, p.179, is the three-dimensional statement)".

## R05 (P3) — Two backticked library names are not declarations at the pins

**Location.** `README.md:1297`: "use native `AddCircle.fourierBasis`"; `:94`: "the transport of `ContinuousLinearMap.complexify` for bounded maps".

**Claim.**
- Mathlib's Fourier Hilbert basis is the top-level `fourierBasis`, at `Mathlib/Analysis/Fourier/AddCircle.lean:410`, after `end AddCircle` at line 101.
- `ContinuousLinearMap.complexify` exists in neither pinned library. The pinned Tau Ceti's `complexify` declarations are on semigroups, multilinear maps, germs and coordinates; none is on `ContinuousLinearMap`.

**Witness.** With `import Mathlib`, `#check @AddCircle.fourierBasis` and `#check @ContinuousLinearMap.complexify` both fail with "Unknown constant". `grep -rn complexify` over the pinned Tau Ceti finds no `ContinuousLinearMap` declaration.

**Repair.**
- Line 1297: write `fourierBasis`.
- Line 94: describe what G5.5-RealHilbert supplies without that name, e.g. "the complexification of bounded real maps through `RealHilbertComplexification`, with composition and adjoints". That name is GeneralizedCohomology's planned input, not a pinned declaration.

## R06 (P3) — Source-transcript instructions and an exam essay prompt are written into the targets

**Location.** `README.md:1163–1168`: "Preserve the complete first essay prompt from physical p.2 … The source asks for an essay of at least200 words"; `:485`: "retain the printed iA*ψ=ψ sign slip"; `:761`: "Keep the cropped p.206 notation and clipped p.208 remark without supplying unseen text".

**Claim.** Seventy sentences tell the implementer to preserve, retain or keep a lecture packet's literal errors, glyphs, crossed-out lines or notation. Besides the lines quoted, examples are at `:19`, `:205`, `:757`, `:1258` and `:1292`. None of these names a definition or theorem to formalize.

An essay prompt is not mathematics, yet the Worked examples table (`:920`) lists "the complete two-choice essay prompt" as an acceptance target. The repository README requires every item to be unambiguous (`README.md:216`) and puts provenance in a clearly secondary section (`README.md:293`). This README's own `:1321` calls these clauses "provenance qualifications".

**Witness.** No Lean statement, type or Check discharges "retain the printed iA*ψ=ψ sign slip" or "Preserve the complete first essay prompt"; an implementer cannot tell what to build.

**Repair.**
- Delete the essay material: the two essay choices at `:1163–1175` and the words "the complete two-choice essay prompt" at `:920`. Keep the mathematical Exam Q1 target: the momentum operator `P`, the symbol `f`, and its four spectral sets.
- Move every remaining preserve/retain/keep clause about a source's wording, glyphs or errors out of Layers 1–6 and the worked examples. Put them in one `## Source provenance` section before the references, one bullet per source location.
- In the layers, keep only the corrected statements, with their counterexamples as targets or Checks. For example, at `:485` keep the corrected `ψ+iA*ψ=0` and move the printed sign slip to the provenance list.

## R07 (P3) — Nelson (1959) and the lecture packet are cited but not recorded in the sources manifest

**Location.** `README.md:1327–1331` cites Nelson, *Analytic Vectors*, Annals 70 (1959), §10 and Lemmas 5.1 and 10.1. These support §2.3, §5.3 and §6.4. `:1321` cites the 225-page lecture packet by file name and SHA-256; it is the source of every "Grundling p.…", "Exam Q…", "Assignment …" and "Problems I …" locator.

**Claim.** `packages/UnboundedOperators/sources.toml` has six entries: teschl, kato, jones, flato-simon-snellman-sternheimer, eckhardt-gesztesy-nichols-teschl and weidmann. Neither work is among them, although every cited work must be recorded. The sources service finds no legal copy of the packet, so none of its page locators can be checked by a reader or a reviewer.

**Witness.** Neither Nelson's DOI `10.2307/1970331` nor the packet's hash `d2cb7c97…` occurs in the manifest. `sources fetch` on the packet's file name returns "no legal source found".

**Repair.**
- Add `nelson`: DOI 10.2307/1970331, `locator_scheme = "section"`, locator "§10; Lemmas 5.1 and 10.1", `status = "uncertified"` (the text is behind JSTOR's paywall).
- For the packet: if the operators hold it legally, record it as a locally held text with this SHA-256. Otherwise, remove the page locators into it. The targets already state their corrected mathematics, and the provenance section of R06 then needs no page numbers into an unreadable text.

## Verified sound

**The previous review's finding (r5 R01, family index): not repaired, and not held.** `TauCetiRoadmap/OperatorTheory/README.md` is byte-identical to main (`git diff origin/main` on it is empty), and `grep -c UnboundedOperators` on it returns 0. I do not hold the finding, for four reasons:
1. CONTRIBUTING.md:144 says a roadmap pull request touches only its own directory.
2. The repair round's gate counted the index edits as `outside-folder=2` at fa2b42c. The head commit b46d79f restored the index and deleted the family `Suggested.lean` in response.
3. r5's proposed table row lists HilbertModules, VonNeumannAlgebras and BanachSpaceTheory as family prerequisites. HilbertModules consumes OperatorTheory, which is the family-level cycle the earlier round removed from that table.
4. Nothing in the index conflicts with this roadmap's ownership. Its SelfAdjointSpectralTheory entry (index lines 47–50: "the spectral measure of an unbounded self-adjoint operator") is exactly what this README consumes (`README.md:7`).

**Gate and dependency check.** The worker's gate at b46d79f has every rule at 0 (`OK`). My rerun with the brief's command, which uses the configured merge order, gives every rule 0 except `depcheck=1 NOT IN ORDER: UnboundedOperators`. That is not a finding: the candidate order lists this roadmap at line 397. The brief's dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside the folder: `git diff --stat origin/main...HEAD` lists only the folder's two files.

**Elaboration.** I compiled a scratch copy of `Suggested.lean` with `#check @name` for all 14 declarations at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). It produces exactly 8 `sorry` warnings, one per theorem, and no other diagnostic. Each elaborated type matches its README statement; no binder is lost, and the worker's `signatures.md` agrees:
- `existsUnique_maximal_multiplier`: arbitrary measure space, `Measurable f`, `MemLp` domain, a.e. action, dense, closed, a.e.-real ⇒ `IsSelfAdjoint` (§1.7).
- `resolventSet_alternatives_of_isClosed_symmetric`: carries `[CompleteSpace H]`, `Dense`, `IsClosed` and `IsFormalAdjoint S S` (§4.2).
- The two §4.7 theorems: over `[RCLike 𝕜]`, with `[CompleteSpace H]` (and `[CompleteSpace V]`).
- The integration pair: `L2 →ₗ.[ℂ] ℂ` with domain `Integrable` (§5.1).
- The Nelson pair: `[CompleteSpace H]` and per-vector constants; the commutation theorem adds `Commute (D.action i) (D.action j)` (§5.3).

**One-tactic probe.** I replaced every `sorry` with `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (decide; done) | (simp; done) | (aesop; done) | sorry`. Seven theorems stay at `sorry`. On `existsUnique_selfAdjoint_of_closed_form`, `simp` and `aesop` stop with a recursion-depth error caused by the Hermitian hypothesis, and `rfl`, `trivial`, `infer_instance` and `decide` fail. No theorem is padding. `L2`, `CommonInvariantDomain` and its three definitions, and `MixedWordAnalyticBound` all have real bodies and are needed by the headlines.

**Headline theorems.** The seven stated headlines are §1.7, §4.2, the two §4.7 theorems, the §5.1 pair and the §5.3 pair. The statable-but-absent ones are under R01. For the remaining docstring items, `/usr/bin/grep -r` over both pins finds no Cayley spectral measure of an unbounded operator and no point, continuous or residual spectrum of a `LinearPMap`. Items that need `P_A` of a given operator are therefore genuinely unstatable. The tensor items are not settled: Mathlib has the inner product on `E ⊗[𝕜] F` and on completions, so they are referred back to the author in R01.

**Adversarial table.** Conventions throughout: inner products conjugate-linear in the first slot; `R_A(z)=(zI−A)⁻¹`; Stone group `U(t)=exp(itA)`; `N₊=ker(S*−i)`.

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| UO-A01 §1.1 Checks | H=0; atoms at 0,1 on ℂ², x=(1,2), f=(2,i); counting ℕ₊, f(n)=n, xₙ=1/n | 0=0; f[P]x=(2,2i), ‖·‖²=8=4·1+1·4; without conjugation ∫f²dμₓ=4−4=0≠8; Σxₙ²=π²/6, Σn²·n⁻²=∞ | true |
| A01* (R01 statement) | f=0; f=(2,i) on ℂ²; f(n)=n on ℓ² | dom=H, T=0; T=diag(2,i), ⟨y,Tx⟩=2ȳ₁x₁+iȳ₂x₂=∫f dμ_{y,x}; dom={Σn²‖xₙ‖²<∞} | statement true; uniqueness from domain plus all matrix elements |
| UO-A03 §1.3 | A=M_n on ℓ², f=λ, g=−λ; f=λ, g=0 | dom f∩dom g=D(M_n)⊊ℓ²=dom(f+g)[P]; dom(f[P]0[P])=ℓ²=D₀∩D₀, dom(0[P]f[P])=D(M_n) | (3.38)/(3.39) as stated; cycle → R02 |
| UO-A04 §1.4 | A=diag(−1,1), f=t², g=√; f=t³, g=∛ | P_{f(A)}({1})=I=P_A({±1}); g∘f=\|t\|, P_A({−1})≠0, g(f(A))=I≠A; g∘f=id, recovery holds | true; locator → R04 |
| UO-A02 converse / R03 | A=M_x on L²(ℝ) | dom M_x={∫x²\|ψ\|²<∞}={∫λ²dμ_ψ<∞}; ⟨φ,M_xψ⟩=∫λ dμ_{φ,ψ}: the same statement as V10.ClosedOperators' Rudin 13.30 clause | true; cite rather than restate |
| UO-A05 §1.5 | A=aI, a<b | E(a)=E(b)=I, P((a,b])=0, P([a,b])=I | right continuity discriminates |
| Exam Q1 target kept by R06 | f(λ)=λ (λ<0), ⌊λ⌋+1 (λ≥0), with P=−i d/dx | f([k−1,k))={k}, so ker(f(P)−k)≠0 and σ_p=ℤ₊; level sets at λ<0 are points, f⁻¹(0)=∅ but negative values accumulate at 0, so σ_c=(−∞,0]; \|f−λ\|≤1 gives dom f(P)=H¹(ℝ) | true; this mathematics stays |
| UO-B03a §2.4 | the eight squares and sixteen gluings | V=2, E=8 interior+8 glued=16, F=8, χ=−6, g=4; 12 loops at p, 4 edges p–q; angles 2π at q, 32·π/2−2π=14π at p; Σ(2π−θ)=−12π=2π·(−6); M∖{p}: ranks 1,8,0, χ=−7 | every number matches lines 304–316 |
| UO-B04 §2.5 | A=diag(0,1), B=diag(2,3); A=B=M_n; Pauli X,Z | atoms (0,2),(1,3), rank one; ∫(s+t)²dμₓ=4Σn²\|xₙ\|²; XZ=[[0,−1],[1,0]]=−ZX | Checks true |
| B04* (R01 statement) | n=0; Pauli X,Z | Fin 0→ℝ is one point, P=δ·I unique; (i−X)⁻¹=−(i+X)/2, (i−Z)⁻¹=−(i+Z)/2, commutator XZ/2≠0 so `hcomm` fails | statement true |
| UO-B02 / B02* | N=diag(1,i); N=iM_n; N=[[0,1],[0,0]] | atoms 1,i; dom N={Σn²\|xₙ\|²<∞}=∫\|z\|²; ‖Ne₂‖=1≠0=‖N*e₂‖, `hnorm` fails | statement true |
| UO-B05 §2.6 | A=2I on ℂ | README U(t)=e^{2it}; Teschl Thm 5.2 writes exp(−itA′), so A′=−2I | "opposite sign convention" correct |
| UO-C02 §3.2 | diag(0,1); 0 on ℓ²; diag(1/n); nonreal λ | ∅; {0} (rank P({0})=∞); {0} (0 not an eigenvalue, rank P((−ε,ε))=∞); A−λ invertible, hence Fredholm | both definitions agree at each |
| UO-C05 §3.5 | F=[0,1], D=ℚ∩[0,1]; F={1,2,3}; m=2 eigenvalues; H=0 | σ=[0,1], σ_p=D, σ_c=[0,1]∖ℚ, σ_r=∅; σ=σ_p=F; \|F\|≤2; all four sets ∅ | true |
| Layer 3 partition | backward shift; zero map on finite sequences | σ_p=open disc, σ_c=circle, σ_r=∅ (forward shift: open disc residual); λ≠0 continuous, 0 point | true |
| UO-D01 §4.1 | S=2I; −i∂ on H₀¹(0,1); on H₀¹(0,∞); ℵ₀ copies ⊕ half-line | (0,0); e^{−x}∈N₊, e^{x}∈N₋: (1,1); only e^{−x}: (1,0); (ℵ₀+1,ℵ₀)=(ℵ₀,ℵ₀) | Teschl's K₊=span{e^{−x}} (`teschl line 3387`) matches |
| `resolventSet_alternatives…` | S=2I, z=i; half-line; interval; H=0 | i·R−2R=1 for R=(i−2)⁻¹ (`smul_sub_apply`), ρ=ℂ∖{2}; \|e^{iz̄x}\|=e^{(Im z)x}∈L²(0,∞) iff Im z<0, so ρ={Im z>0}; interval ρ=∅; H=0: ρ=ℂ and self-adjoint | all four alternatives and the iff hold |
| UO-D02 §4.3 | defects (2,1) with a rank-one U | new defects (1,0); 2=1+1, 1=1+0 | cardinal sums, no subtraction |
| UO-D03 §4.4 | A=i∂ on the split line, Jψ=conj ψ(−x); plain conjugation | AJψ=−i conj ψ′(−x)=JAψ; plain: +i conj ψ′ vs −i conj ψ′ | commute vs anticommute, as stated |
| UO-D04 §4.5 | unit x₊∈N₊, x₋∈N₋ | G(x₊,x₊)=⟨ix₊,x₊⟩−⟨x₊,ix₊⟩=−i−i=−2i, (i/2)G=1; x₋: 2i, −1 | sign pinned; Checks true |
| UO-D05 §4.6 / R03 | −i∂ with u(1)=e^{iθ}u(0) | e^{iλ}=e^{iθ} gives λ∈θ+2πℤ; θ=0: 2πℤ=−i·2πiℤ | consistent with V10 and H6 |
| `friedrichs_exists_selfAdjoint_extension` | −d² on C_c^∞(0,1), γ=π²; S=2I; H=0 | Dirichlet ‖u′‖²≥π²‖u‖²; Neumann u=1 gives 0<π²; T=S | bound clause discriminates |
| F* (R01 extremality) | γ=0, T=Neumann, S_F=Dirichlet, t=−1, u=1 | ⟨(T+1)⁻¹1,1⟩=1; ⟨(S_F+1)⁻¹1,1⟩=Σ_{n odd}8/(n²π²(n²π²+1))<Σ_{n odd}8/(n²π²)=1 | R_T(−1)≤R_{S_F}(−1) as claimed |
| `existsUnique_selfAdjoint_of_closed_form` | V=H=ℂ, j=id, q=2ūv; j=2·id, q=ūv; q=0 with α=1, 2 | q(1,i)=2i=⟨2·1,i⟩, so A=2I; ⟨h,2v⟩=ūv gives h=x/4, A=I/4; A=0 total for both α | true; graph clause independent of α |
| UO-D07 §4.8 | q=(ν²−¼)/r², z=0 | r^a with (a−½)²=ν²; ν=½: 1, r (LC); ν=3/2: r², r⁻¹, ∫₀r⁻²=∞ (LP); LC iff ν<1 | Checks true |
| UO-E01 / integral pair | fₙ=n⁻¹1_[0,n]; y∈ℂ | ‖fₙ‖₂²=1/n→0, ∫fₙ=1, so (0,1) is in the graph closure; f↦ȳ∫f is continuous iff y=0, and Mathlib's `adjointDomain` is that continuity set | true |
| UO-E01 Wielandt | PQ−QP=cI, c≠0 | PQⁿ−QⁿP=ncQⁿ⁻¹ ⇒ n!\|c\|ⁿ≤(2‖P‖)ⁿ‖Qⁿ‖≤(2‖P‖‖Q‖)ⁿ, false for large n | true |
| UO-E02 §5.2 | A=2I, x=1; A=0; M_n, xₙ=1/n | Σ2ⁿrⁿ/n!=e^{2r}; series=‖x‖; Σn²·n⁻²=∞ | Checks true |
| `nelson_essential_selfAdjoint` | k=1, S=2I, x=1, C=R=2; S=iI; k=0 | (1,2),(2,4),(4,16) at n=0,1,2; ⟨i·1,1⟩=−i≠i=⟨1,i·1⟩ fails `hsym`; Fin 0: vacuous | true; one-letter words give FSSS Hypothesis (C) |
| `nelson_resolvent_commute`, `applyWord` | Pauli X,Z, x=e₁; 2I, 3I | `foldr` on [X,Z] gives X(Ze₁)=e₂, on [Z,X] gives Z(Xe₁)=−e₂, so `hcomm` fails; (i−2)⁻¹,(i−3)⁻¹ commute | true; word order matches `README.md:768` |
| `existsUnique_maximal_multiplier` | μ=0; one point, f=i; counting ℕ₊, f=n; Lebesgue, f=x | Lp=0, T unique; T=iI, T*=−iI≠T; 1/n excluded, 1/n² included with Σn²n⁻⁴=π²/6; cutoffs 1_{\|f\|≤n}x→x need no σ-finiteness | true |
| UO-E04 §5.4 | A=0 with V a rank-one projection; V=I; V=0 | V(A−i)⁻¹=iV compact, σ_ess={0} for both; iI not compact, σ_ess {0}→{1}; unchanged | Teschl's relative compactness (`teschl line 6358`) is the README's |
| UO-E04a §5.5 | A=2I, B=3I; diag(t,−t) | R=(w−2−3z)⁻¹, ∂_zR=3/(w−2−3z)²=RBR; branches ±t analytic, ordered −\|t\|,\|t\| not | true |
| UO-E05 §5.6 | Dirichlet −d² on (0,1); C_c^∞(0,1); oscillator cutoff | Σ(n²π²)^k r^k/k!=e^{n²π²r}; sin(πx) has u′(0)=π, so it is not in H₀² and C_c^∞ is not an operator core; H(χ_Rψ)−χ_RHψ=−2χ_R′ψ′−χ_R″ψ | true; locator → R04 |
| UO-F01/F02 §6.1–§6.2 | 2I,3I; A=M_n, B=−M_n, x=Σn⁻¹eₙ⊗eₙ | S=5I, P=6I; s+t=0 on the atoms, so x∈dom S; Σn²·n⁻²=∞, Σn⁴·n⁻²=∞ | S properly extends the intersection sum |
| UO-F03 §6.3 | ℕ₊ and {−n+1/n}; ℕ₊ and {0}∪{1/n} | m=n gives 1/n in the raw sum; m−n+1/n=0 is impossible, so 0 is only in the closure; raw product ℚ_≥0, closure [0,∞) | closure needed (Theorem 4.14 has it) |
| UO-F04 §6.4 | A=2I, B=3I, x=y=1; general analytic x,y | Σ5ⁿtⁿ/n!=e^{2t}e^{3t}; ‖Sⁿ(x⊗y)‖≤ΣC(n,k)‖A^kx‖‖B^{n−k}y‖ is the Cauchy product of the factor series | true below the smaller radius |

**Sources read at their locators.**
- `teschl`: printed page = PDF page − 12. The following were found at their stated printed pages: (3.25)–(3.27) p.91 (`line 3729–3740`), Theorem 3.2 p.92 (`3752`), Lemma 3.5 with (3.38)–(3.39) p.94 (`3869–3872`), (3.67) and Lemmas 3.11–3.12 p.101 (`4194–4207`), Theorem 3.18 and Lemma 3.19 p.105 (`4376–4394`), Lemma 4.5 p.116 (`4926`), Lemma 4.9, (4.24)–(4.25) and Problem 4.2 p.117 (`4967–4987`), Theorem 4.14 and (4.43)–(4.44) p.121 (`5134–5157`), Theorem 5.2 p.124 (`5232`), Corollary 5.3 p.125 (`5271`), Theorem 6.4 p.135 (`5704`), (6.27)–(6.28) and Lemma 6.17 p.145 (`6261–6281`), Lemma 6.18 and Theorem 6.19 p.146 (`6313–6324`), Lemmas 6.22–6.23 p.148 (`6368–6379`), Theorem 6.31 p.154 (`6602`), Lemma 6.34 p.155 (`6637`), Theorem 8.5 p.179 (`7558`), Lemma 2.3 p.63 (`2587`), Lemma 2.7 and (2.44) p.66 (`2703–2713`), Theorem 2.18 and Lemma 2.20 p.77 (`3170–3187`), Theorem 2.21 p.78 (`3203`), Theorem 2.26 p.82 (`3365`), Lemma 2.27 and Theorem 2.28 p.83 (`3402–3413`), Problem 2.27 p.84 (`3453`).
- `jones`: Exercise 12.1.11(ii) p.86 (`line 2883–2887`), Exercise 12.1.15 p.87 (`2902–2903`).
- `flato-simon-snellman-sternheimer`: the analytic-vector notions on p.424 (`line 58–74`), Hypothesis (C) on p.428 (`230–232`), Theorem 1 on p.430 (`277–279`).

Seeded sample, 15 targets: §§1.1, 1.3, 2.5, 2.6, 3.2, 3.5, 4.1, 5.1, 5.4 and 6.3 are supported as written. §1.4, §5.2 and §5.6 are supported in content with misplaced locators (R04). §2.4 has no external locator: its genus and homology are computed in the table, and its Tau Ceti inputs are below. §6.4's Teschl locator holds, and its Nelson locator is under *Not verifiable*.

**Library declarations opened at the pins.**
- Mathlib (`#check` in one scratch file): `LinearPMap.adjoint`, `adjointDomain`, `isSelfAdjoint_def`, `IsClosable`, `closure`, `IsFormalAdjoint`, `adjoint_graph_eq_graph_adjoint`, `adjoint_isClosed`, `smul_domain`, `HilbertBasis.repr`, `MemLp`, `Measure.pi`, `Measure.prod`, `Measure.singularPart`, `Measure.withDensityᵥ`, `Measure.HaveLebesgueDecomposition`, `Measure.absolutelyContinuous_iff_withDensity_rnDeriv_eq`, `MeasurableEquiv.piFinTwo`, `IsCoercive.continuousLinearEquivOfBilin`, `InnerProductSpace.rclikeToReal`, `InnerProductSpace.rankOne`, `banach_steinhaus`, `LinearMap.IsSymmetric.continuous`, `ContinuousLinearMap.isPositive_iff_complex`, `ContinuousLinearMap.le_def`, `LinearMap.continuous_of_isClosed_graph`, `ContinuousLinearMap.ofIsClosedGraph`, `ContinuousMap.toLp_denseRange`, `AbsolutelyContinuousOnInterval`, `polynomialFunctions.topologicalClosure`, `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Bundle.RiemannianBundle`, `IsContinuousRiemannianBundle`, `LindelofSpace`. All are present; the two absent names are in R05.
- Tau Ceti, resolvents and spectra: `LinearPMap.IsResolventAt` (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:65`), its fields `mem_domain`, `smul_sub_apply` and `apply_smul_sub` (`λ•I−A`), `IsResolventAt.unique` (`:75`), `resolventSet` (`:129`), `spectrum` (`:140`), `resolvent` (`:169`), and `TauCeti.LinearPMap.analyticAt_resolvent` (`TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean:58`).
- Tau Ceti, PVM: the declarations under R01, plus `BoundedBorelFunction` (`TauCeti/MeasureTheory/Function/BoundedBorel.lean:81`).
- Tau Ceti, semigroups and Stone: `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean:106`), and `StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top` and `.continuous_iff_domain_eq_top` (`TauCeti/Analysis/Semigroups/UniformlyContinuous.lean:233`, `:249`).
- Tau Ceti, geometry: `riemannianVolume` and `eq_riemannianVolume_iff` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`, `:93`).
- Tau Ceti, cellular homology: `finsum_finrank_singularHomology_of_finite_cwComplex` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:159`; finite CW complex, coefficients finite-dimensional over a division ring), `cellularSingularHomologyIsoUniv` (`Cellular/Comparison.lean:300`; CW structure on `Set.univ`, plus the `IsIso` hypothesis that the instance at `:219` supplies for finite-dimensional complexes), `cellularIncidence_zero` (`Cellular/EdgeIncidence.lean:58`), and `cellularIncidence_eq_inv_cellLocalClass` (`Cellular/LocalDegree.lean:659`). All are in namespace `TauCeti`, as written at `README.md:48–57`.

**Cross-roadmap citations resolved on main (12ed9bd).**
- SelfAdjointSpectralTheory: SA-A21 (`README.md:225`), SA-B39 (`:399`), SA-B49 (`:436`), SA-B57 (`:460`), SA-B85 (`:676`), SA-C39 (`:888`), SA-C55 (`:929`), SA-D17 (`:1103`), SA-D18 (`:1105`), SA-D20 (`:1109`), SA-E01 (`:1202`), SA-E05 (`:1211`), SA-E08 (`:1217`), SA-E26 (`:1260`), SA-E29 (`:1266`), SA-E43 (`:1307`), and SA-E44 (`:1316`, used in R03).
- PolarDecomposition: PD-B23 (`:371`), PD-B29 (`:384`), PD-B32 (`:389`), PD-B34 (`:393`).
- HilbertModules: H6 (`:705`).
- VonNeumannAlgebras: V2.RectangularL2 (`:634`), V10.ClosedOperators (`:2249`), V10.Affiliation (`:2305`).
- BanachSpaceTheory: B5 (`:42`), with `hilbertBasis_lift_mk_eq` and `nonempty_linearIsometryEquiv_iff_lift_mk_eq` in its `Suggested.lean:159`, `:165` over `[RCLike 𝕜]`, as the contract says.
- BanachAlgebras: Layer 2 §2.1 (`:440–442`).
- PDE: A1 (`:677`), A3 (`:769`), A4 (`:803`), A6 (`:905`).
- GeneralizedCohomology: G5.5-RealHilbert (`:1939`).
- LieGroups: Layers 2 and 5 (`:356`, `:518`).
- OperatorAlgebraDynamics: D8 (`:12`).
- Completed/OrthogonalL2Bases: Parts A and D (`:147`, `:372`).
- VariationalMethods: cited only as a consumer. At its open head it names UO-D06 as the owner and supplies nothing here.

**Ownership and overlaps.** The overlap listing reports no open pull request that changes this roadmap and no dropped ids, and I confirmed both. I ran `roadmaps grep` across the 466 open heads and main for: joint PVM, multiparameter Stone, deficiency indices, Nelson analytic vectors, Kato–Rellich, Friedrichs extension, unbounded Borel calculus, and normal-operator spectral theorem. Results:
- QuantumFoundations, NoncompactQuantumSymmetry, VariationalMethods and RelativisticQuantumFieldTheory consume UO targets and own none.
- AutomorphicSpectralTheory and MaassForms use the Friedrichs realization of one Laplacian.
- No roadmap on main owns analytic vectors or Nelson's theorem.
- The two overlaps with roadmaps on main are in R03.

**README form and policy.**
- No LaTeX delimiters, no `lemma`, no `set_option`, no pull-request numbers, no machine paths.
- Every layer ends with Examples and Dependencies.
- Imports are `import Mathlib` plus one existing `TauCeti.*` module.
- Every backticked name of this roadmap's own is declared in `Suggested.lean` (gate `readme-ids-missing=0`). The resolver's one lead, `applyWord`, is declared at `Suggested.lean:161`.

## Not verifiable

- **The 225-page lecture packet** (`README.md:1321`, SHA-256 `d2cb7c97…`). It is in neither the manifest nor the sources cache, and the sources service reports no legal copy. Every "Grundling p.…", "Exam", "Assignment" and "Problems I" locator is therefore unchecked; the mathematics stated beside them was tested where the table shows it. See R07.
- **Nelson, *Analytic Vectors*, Annals 70 (1959)**, §10 and Lemmas 5.1 and 10.1. The DOI resolves only to JSTOR (paywalled), and the manifest has no key for it (R07). The surface arithmetic and the Lemma 5.1 hypothesis used in §5.3 and §6.4 were checked mathematically.
- **Kato (1995)** and **Weidmann (1987)**: settled as uncertified in the manifest and cited by section only.

## Source issues

- **Misprint** in jones at Definition 12.1.13, printed p.87: the source says that, for ξ in the adjoint domain, the adjoint is T*ξ = η, after naming η the domain vector and σ its representative; it should be T*η = σ; affects nothing.
- **Misprint** in teschl at Theorem 4.14 (proof), printed p.121: the source says the test vector is ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{1,k}; it should be ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{n,k}; affects nothing.
- **Gap** in teschl at Theorem 4.14 (proof), printed p.121: the source says Weyl sequences with (A_j−λ_j)ψ_{j,k}→0 make (P−λ)ψ_k→0 for a polynomial P of degree N; it should be Weyl sequences in the ranges of P_{A_j}((λ_j−1/k, λ_j+1/k)), since for N ≥ 2 the first-order condition does not control (A_j^m−λ_j^m)ψ_{j,k}; affects the proof.
