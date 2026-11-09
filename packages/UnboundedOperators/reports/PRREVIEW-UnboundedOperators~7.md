# Review of UnboundedOperators (pull request #1027 at 6235d4a)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Seven findings: one P2 and six P3. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

**Previous review (at b46d79f), finding by finding:**
- **R01, repaired.** The PVM headlines are now stated: `existsUnique_spectralIntegral` (`Suggested.lean:60`), `existsUnique_projValMeasure_of_normal` (`:94`), `existsUnique_jointProjValMeasure` (`:110`), the multiparameter Stone theorem (`:124`), the spectral-type split (`:140`) and the tensor pair (`:322`, `:342`). Friedrichs now carries the extremal clause (`:177`). The README has a From Tau Ceti paragraph naming SA-B14 and SA-B21 (`README.md:48–63`), and `diagMeasure` no longer occurs.
- **R02, repaired.** §1.2a (UO-A02a) is at `README.md:170–174`. §1.3's *Needs* now reads "§1.1–§1.2 and §1.2a" (`:182`), and the layer graph has no cycle.
- **R03, repaired in substance.** §1.2 now consumes V10.ClosedOperators and SA-E44 (`:166–168`), and §4.6 consumes the interval example (`:577`). The previous review placed that example in H6; it is in H7 (R04 below).
- **R04, repaired.** `:186` reads "(3.67), p.101; the injective recovery is Lemma 3.11". `:773` and `:1435` read "introduction, p.424", and `:862` reads "§8.3, pp.178–179".
- **R05, repaired.** `:1304` has `fourierBasis`. `:123` now names Tau Ceti's `ContinuousLinearMap.complexify`, which exists at the pin (`TauCeti/Analysis/Normed/Module/Complexification.lean:409`).
- **R06, repaired.** The essay prompt and the transcription instructions moved to `## Source provenance` (`:1326–1417`), and the worked-examples table (`:960`) no longer lists the essay.
- **R07, partly repaired.** `nelson` is now in the sources manifest. The lecture packet is still cited and still not recorded (R06 below).

## R01 (P2) — Three perturbation headlines are statable at the pins but absent; the docstring misnames one and omits two

**Location.**
- `README.md:3` lists "compact perturbations" among the roadmap's goals.
- §5.4 (`:820`): "prove the relative-compact perturbation theorem … and invariance of essential spectrum (… Theorem 6.19, p.146)".
- §5.7 (`:868`) states Kato's theorem for `L²+L∞` potentials on ℝ³.
- `Suggested.lean:39–40`: "The analytic-perturbation spectral-branch headlines need the spectral subspaces of a holomorphic family of type (A) (§5.5)".

**Claim.**
- **Weyl's theorem (§5.4, UO-E04).** It is not stated, and the docstring does not mention it. The essential spectrum of §3.2 (spectrum minus isolated eigenvalues of finite multiplicity, Teschl p.145) is a two-line definition on `LinearPMap`. Tau Ceti supplies `resolventSet` and `resolvent`, and Mathlib supplies `IsCompactOperator`.
- **Kato's theorem (§5.7, UO-E06).** It is not stated, and the docstring does not mention it. It is statable on the C_c∞ classes with Mathlib's Laplacian `Δ` on functions (`instLaplacian`, `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138`).
- **The simple-eigenvalue branch of §5.5.** It is λ(z) analytic with λ(0)=λ₀ and λ′(0)=⟨u₀,Bu₀⟩, and an analytic eigenvector v(z). The docstring calls it unstatable for want of spectral subspaces, but its statement uses none: only `AnalyticOnNhd`, `deriv`, `LinearPMap` and the pinned spectrum.

**Witness.** All four statements below elaborate inside a copy of `Suggested.lean` at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d), with no new import, giving 19 `sorry` warnings and no other diagnostic. One trap was found while testing: at this pin `ContDiff ℝ ⊤ f ↔ ContDiff ℝ ω f` holds by `Iff.rfl`. Written with `⊤`, the C_c∞ domain would contain only analytic functions with compact support, which is {0}.

**Repair.** Add the following under the Layer 5 comment. Keep `open scoped ContDiff` local: opened globally, it makes the file's `< ∞` ambiguous.

```lean
/-- The discrete spectrum: isolated points of the spectrum that are eigenvalues of finite
multiplicity (Teschl, §6.4, p.145). -/
def discreteSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) : Set ℂ :=
  {z | z ∈ A.spectrum ∧ (∃ ε > 0, Metric.ball z ε ∩ A.spectrum = {z}) ∧
    LinearMap.ker (z • A.domain.subtype - A.toFun) ≠ ⊥ ∧
    FiniteDimensional ℂ (LinearMap.ker (z • A.domain.subtype - A.toFun))}

/-- The essential spectrum: the spectrum minus the discrete spectrum. -/
def essentialSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) : Set ℂ :=
  A.spectrum \ discreteSpectrum A

/-- Weyl's theorem (README §5.4, UO-E04; Teschl, Theorem 6.19, p.146). -/
theorem essentialSpectrum_eq_of_isCompactOperator_resolvent_sub {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) (z : ℂ)
    (hzA : z ∈ A.resolventSet) (hzB : z ∈ B.resolventSet)
    (hK : IsCompactOperator (A.resolvent z - B.resolvent z)) :
    essentialSpectrum A = essentialSpectrum B := by
  sorry

/-- Relatively compact symmetric perturbations (README §5.4, UO-E04). -/
theorem isSelfAdjoint_add_and_essentialSpectrum_eq {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A V : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hdom : A.domain ≤ V.domain)
    (hV : V.IsFormalAdjoint V)
    (hcpt : ∃ K : H →L[ℂ] H, IsCompactOperator K ∧
      ∀ y : H, ∃ h : A.resolvent Complex.I y ∈ V.domain, V ⟨_, h⟩ = K y) :
    IsSelfAdjoint (A + V) ∧ essentialSpectrum (A + V) = essentialSpectrum A := by
  sorry

/-- Analytic eigenvalue branch through an isolated simple eigenvalue (README §5.5, m = 1). -/
theorem exists_analytic_eigenvalue_branch {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hdom : A.domain ≤ B.domain)
    (hB : B.IsFormalAdjoint B) (a b : ℝ)
    (hbound : ∀ x : A.domain, ‖B ⟨x, hdom x.2⟩‖ ≤ a * ‖A x‖ + b * ‖(x : H)‖)
    (lam₀ : ℝ) (u₀ : A.domain) (hu₀ : ‖(u₀ : H)‖ = 1) (heig : A u₀ = (lam₀ : ℂ) • (u₀ : H))
    (hsimple : ∀ x : A.domain, A x = (lam₀ : ℂ) • (x : H) → ∃ c : ℂ, (x : H) = c • (u₀ : H))
    (hiso : ∃ ε > 0, Metric.ball (lam₀ : ℂ) ε ∩ A.spectrum = {(lam₀ : ℂ)}) :
    ∃ r > 0, ∃ (lam : ℂ → ℂ) (v : ℂ → H),
      AnalyticOnNhd ℂ lam (Metric.ball 0 r) ∧ AnalyticOnNhd ℂ v (Metric.ball 0 r) ∧
      lam 0 = lam₀ ∧ v 0 = u₀ ∧ deriv lam 0 = ⟪(u₀ : H), B ⟨u₀, hdom u₀.2⟩⟫_ℂ ∧
      ∀ z ∈ Metric.ball (0 : ℂ) r, ∃ h : v z ∈ A.domain,
        v z ≠ 0 ∧ A ⟨v z, h⟩ + z • B ⟨v z, hdom h⟩ = lam z • v z := by
  sorry

open scoped ContDiff in
/-- Kato's theorem (README §5.7, UO-E06). -/
theorem isSelfAdjoint_closure_neg_laplacian_add_potential
    (V₂ Vb : EuclideanSpace ℝ (Fin 3) → ℝ) (h₂ : MemLp V₂ 2 volume) (hb : MemLp Vb ⊤ volume)
    (T : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin 3))) →ₗ.[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin 3))))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : EuclideanSpace ℝ (Fin 3) → ℂ,
      ContDiff ℝ ∞ f ∧ HasCompactSupport f ∧ (u : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume] f)
    (hact : ∀ (u : T.domain) (f : EuclideanSpace ℝ (Fin 3) → ℂ), ContDiff ℝ ∞ f →
      HasCompactSupport f → ((u : Lp ℂ 2 volume) : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume] f →
      (T u : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume]
        fun x => -(Δ f) x + ((V₂ x + Vb x : ℝ) : ℂ) * f x) :
    IsSelfAdjoint T.closure := by
  sorry
```

Also add `Laplacian` to the file's `open scoped` line. Then make the following changes:
- **Docstring.** Name the four statements among those stated. Rewrite the §5.5 sentence so it lists only what is still unstated and which carrier is missing.
- **README §3.2.** Add one clause saying that this unbounded essential spectrum agrees, for bounded self-adjoint operators, with OperatorKTheory's Fredholm `essentialSpectrum` on `H →L[ℂ] H` (its open head, `TauCetiRoadmap/OperatorKTheory/Suggested.lean:86`). The fully qualified names differ.
- **README §§5.4, 5.5, 5.7.** Name the four declarations in their API bullets.

The truth of each statement is checked in the table below (rows E04, E04a and E06).

## R02 (P3) — Results that the pinned Tau Ceti already proves are consumed only as roadmap targets, and SA-B54–B57 are said to be at the pin when they are not

**Location.**
- `README.md:75–79`: "with their API SA-B49–B57 (all implemented at the Tau Ceti pin, above) … Kato–Rellich (SA-C55), nonreal resolvents (SA-D17)".
- `:820`: "Consume SAST SA-C55 for the Kato–Rellich conclusion". `:838`: "prove self-adjointness by SA-C55".
- `:392` (SA-D18), `:400` (SA-D20), `:482` (SA-D17).
- `:500`: "(Teschl (2.44), in the proof of Lemma 2.7, p.66)".
- `:291` and `:432`, the reducing subspaces.

**Claim.** The From Tau Ceti paragraph (`:39–73`) omits these declarations at the pin, all of which state what the cited targets need:
- `IsSelfAdjoint.add_of_isRelativelyBounded` (`TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean:118`) is Kato–Rellich over any `RCLike`. Note its convention: `IsRelativelyBounded V A a b` means `‖Vx‖ ≤ a‖x‖ + b‖Ax‖` with `b < 1` (`TauCeti/Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56`). That is the reverse lettering of §5.5's `‖Bx‖≤a‖Ax‖+b‖x‖`.
- `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero` and `IsSelfAdjoint.spectrum_subset_im_eq_zero` (`…/LinearPMap/Resolvent.lean:70`, `:76`) cover SA-D17 and SA-D18. `IsSelfAdjoint.adjoint_resolvent` (`:114`) covers SA-D20.
- `LinearPMap.IsFormalAdjoint.norm_smul_sub_sq` (`…/LinearPMap/SelfAdjoint.lean:155`) is the identity (2.44) of §4.2. `IsFormalAdjoint.isClosed_range_smul_sub` (`:216`) is the closed-range step there.
- `LinearPMap.IsReducing` and `IsReducing.isSelfAdjoint_restrict` (`…/LinearPMap/Reducing.lean:59`, `:144`) are the reducing-subspace API of §§2.1 and 3.3.

Conversely, SA-B54–B57 (normal Borel-calculus identification, identity recovery, full support, spectral commutant) are not at the pin. `TauCeti/Analysis/InnerProductSpace/BorelCalculus/` holds only `DiagonalMeasure.lean` and `Polarization.lean`. The only Fuglede consequence at the pin is the finite-dimensional `NormalOperator.lean`. SA-B49–B53 are present (`ProjValMeasure/Null.lean:42`, `Map.lean:87`, `Integral.lean:305`, `DominatedConvergence.lean:69`, `:77`).

**Witness.**
- `Resolvent.lean:70`: "Every nonreal scalar is a resolvent point of a self-adjoint partial linear map."
- `KatoRellich.lean:114–117`: "Then `A + V`, whose domain is `dom A`, is self-adjoint."
- `grep -rn "SA-B5[4-7]"` over the pinned Tau Ceti returns nothing.

**Repair.**
- Add the declarations above, with their files, to the From Tau Ceti paragraph, and cite them at `:820`, `:838`, `:392`, `:400`, `:482` and `:500`. Keep the SA ids as the owners' names.
- At `:77`, write "with their API SA-B49–B53 (implemented at the Tau Ceti pin) and SA-B54–B57".

## R03 (P3) — §4.7's complexification: the Hilbert carrier is at the Tau Ceti pin, and the unbounded `A_ℂ` is GeneralizedCohomology's `D_C`

**Location.**
- `README.md:119–125`: "G5.5-RealHilbert supplies the Hilbert complexification `RealHilbertComplexification H` … and the transport to that Hilbert carrier of Tau Ceti's `ContinuousLinearMap.complexify`".
- `:622–634`: "Construct the complexification `A_ℂ` … The unbounded complexification `A_ℂ` … are constructed here".
- `Suggested.lean:37–38`: "the real spectral restriction (§4.7) needs in addition GeneralizedCohomology's Hilbert complexification `RealHilbertComplexification`".

**Claim.**
- **The Hilbert carrier is at the pin.** The pinned `TauCeti/Analysis/InnerProductSpace/Complexification.lean` already provides:
  - the complex Hilbert space `WithLp 2 (TauCeti.Complexification X)`: `WithLp.instComplexificationInnerProductSpace` (`:159`) and `instComplexificationCompleteSpace` (`:136`);
  - the isometric real inclusion (`complexification_norm_toLp_ofReal`, `:108`);
  - bounded transport `ContinuousLinearMap.complexifyL2` (`:201`) with `complexifyL2_comp` (`:260`), `adjoint_complexifyL2` (`:282`) and `isSelfAdjoint_complexifyL2_iff` (`:340`).

  So the docstring's second missing carrier is in fact at the pin. Only the conjugation `J` is absent there.
- **`A_ℂ` already has an owner.** The unbounded complexification is planned on main by GeneralizedCohomology G5.5-RealHilbert, which this README already cites as a supplier. It reads: "For a densely defined real `LinearPMap` D define D_C(x+iy)=Dx+iDy on the actual complexified domain; prove graph/closure transport and (D_C)†=(D†)_C, including equality of domains" (`TauCetiRoadmap/GeneralizedCohomology/README.md:1962–1965`). That gives the domain, closedness and self-adjointness of `A_ℂ` that `:623–626` constructs again.

**Witness.** The pinned file says it puts "the complex inner product … on the type synonym `WithLp 2 (Complexification X)`". `adjoint_complexifyL2` there states that complexification commutes with adjoints.

**Repair.**
- Cite the Tau Ceti declarations above in the From Tau Ceti paragraph. Keep G5.5-RealHilbert for `J`, `Fix J=ι_H(H)` and `D_C`.
- In §4.7, consume `D_C` and its adjoint identity for `A_ℂ`. Prove here only `JA_ℂ=A_ℂJ`, the uniqueness among `J`-commuting self-adjoint extensions of the transported `A`, and the restriction to `Fix J`.
- In the docstring, give the real spectral restriction's missing carrier as `P_A` (SA-E01) alone.

## R04 (P3) — HilbertModules' interval example is in H7, not H6

**Location.**
- `README.md:95–98`: "Its interval example supplies the deficiency indices `(1,1)` of `−i d/dt` on `H₀¹([0,1])` and the parametrization of its self-adjoint extensions `D_λ`". This sentence is in the H6 paragraph.
- `:577`: "consume HilbertModules H6's deficiency indices `(1,1)`".
- `:579`: "*Needs:* … HilbertModules H6 interval example".

**Claim.** On main, H6 (`TauCetiRoadmap/HilbertModules/README.md:705–760`) has no interval example. The example, with `D_λ` and `α_+=λα_-`, is in H7 (`## H7`, starting at `:762`), at `:794–806`. H7 itself uses "H6's Hilbert-space deficiency API" for the parameter. The previous review's R03 gave this H6 location, and this head followed it.

**Witness.** `HilbertModules/README.md:794–797`: "Give a concrete selfadjoint nonregular example. Start with `D=-i d/dt` … parametrize its selfadjoint extensions D_λ by λ∈𝕋 using normalized deficiency vectors φ_± and the condition `α_+=λ α_-`", under `## H7`.

**Repair.** Write "HilbertModules H7 interval example (indices and `D_λ`)" at `:579`, "HilbertModules H7's deficiency indices" at `:577`, and move the sentence at `:95–98` to a separate "H7 supplies" sentence.

## R05 (P3) — Two seeded locators do not state the claim they are attached to

**Location.**
- §5.1, `README.md:743`: "prove D⊆dom A is graph-dense in `dom A` iff `(A−z)D` is norm-dense in `ran(A−z)` (Teschl (2009), Lemma 2.7, p.66; …)".
- §6.1, `:886`: "identify its adjoint as the closure of `A*⊙B*` for all closed densely defined A and B … (the self-adjoint case and its spectrum are Teschl (2009), Theorem 4.14 and Problem 4.5, p.121 …)".

**Claim.**
- **§5.1.** Lemma 2.7 is the range criterion for essential self-adjointness (`teschl line 2703–2706`). That is the next sentence's claim. The graph-density equivalence follows from the estimate (2.44) in its proof (`teschl line 2711–2713`).
- **§6.1.** The adjoint identity for closed, densely defined, non-self-adjoint factors has no locator. Theorem 4.14 (`teschl line 5134–5139`) treats real polynomials in self-adjoint factors only.

**Witness.** `teschl line 2703`: "A symmetric operator A is essentially self-adjoint if and only if one of the following conditions holds". The page states no core or graph-density equivalence.

**Repair.**
- At `:743`, attach "(from (2.44) in the proof of Teschl (2009), Lemma 2.7, p.66)" to the graph-density sentence, and "(Teschl (2009), Lemma 2.7, p.66)" to the following essential-self-adjointness sentence.
- At `:886`, add a locator for the closed densely defined case. Alternatively, state the proof route through the polar decompositions `A=U|A|` and `B=V|B|` and Theorem 4.14 for `|A|⊙|B|`.

## R06 (P3) — The lecture packet is cited for dozens of page locators but is not recorded in the sources manifest

Re-raised from the previous review's R07, which this head repairs only for Nelson.

**Location.** `README.md:1421`: "The primary course grounding is the 225-page PDF `5755 Mathematics of Quantum Mechanics notes - Grundling.pdf`, SHA-256 `d2cb7c97…`". Its page locators occur throughout: 29 "Grundling pp.…" plus "physical p.…", "Exam …", "Assignment …" and "Problems I …".

**Claim.** Every cited work must be recorded in `packages/UnboundedOperators/sources.toml`. That manifest has seven entries (teschl, kato, jones, flato-simon-snellman-sternheimer, eckhardt-gesztesy-nichols-teschl, weidmann, nelson), and none is the packet. No reader or reviewer can check its locators.

**Witness.** Neither the hash `d2cb7c97…` nor the file name occurs in the manifest. A web search for the notes (Grundling, MATH5755, UNSW) finds no public copy.

**Repair.** If the operators hold the packet legally, record it as a locally held text with this SHA-256. Otherwise, remove the page locators into it from the layers. The targets already state their corrected mathematics, and `## Source provenance` can then describe the corrections without page numbers.

## R07 (P3) — `exists_integralOperator` restates the construction of the integration operator

**Location.** `Suggested.lean:220–226`: "Integration exists as a partial operator whose domain is exactly the integrable classes and whose action is the Bochner integral there."

**Claim.** This is the README's construction of `I` (`README.md:747`) written as a `sorry`'d existence theorem. It proves nothing beyond the definition. The headline is `integralOperator_counterexample`, which is meaningful on its own, since its hypotheses `hdom`/`hact` determine `I`.

**Witness.** The statement is the bare existence of a `LinearPMap` with a prescribed domain and action. It holds by defining the domain submodule and the integral; a real-bodied definition with this domain and action elaborates at the pins in about 25 lines, using `Integrable.add`, `Integrable.smul`, `integral_add` and `integral_const_mul`.

**Repair.** Delete `exists_integralOperator` from `Suggested.lean`; the README keeps the construction as a target. If the author prefers, replace both declarations by a real-bodied `def integralOperator : L2 →ₗ.[ℂ] ℂ` and one theorem about it. That form was elaborated as described above.

## Verified sound

**Gate and dependency check.**
- The worker's gate at 6235d4a passes every rule (`OK`).
- My rerun of the brief's gate command, which reads the configured merge order, fails only on `depcheck: NOT IN ORDER: UnboundedOperators`. That is not a finding: the candidate merge order lists this roadmap at line 397.
- The brief's dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` lists only the folder's two files.

**Elaboration.**
- `lake env lean` on `Suggested.lean`: 15 `sorry` warnings, one per theorem, and nothing else.
- One scratch file with `#check @…` for all 21 declarations: every elaborated type matches its README statement, and no section binder is lost. The Nelson theorems carry `[CompleteSpace H]` explicitly, and the `def`s mention only `H` and `D`. The worker's `signatures.md` agrees.
- One redundancy, not a finding: `hclosed` in `existsUnique_projValMeasure_of_normal` is implied by `hdense`, `hdom` and `hnorm`. Normal operators are closed (`teschl line 3747–3749`), and the hypothesis matches README §2's definition of normality.

**One-tactic probe.** Each `sorry` was replaced by `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (decide; done) | (simp; done) | (aesop; done) | (exact?; done) | sorry`. 14 theorems stay at `sorry`. On `existsUnique_selfAdjoint_of_closed_form`, `simp` and `aesop` hit the maximum recursion depth through `hHermitian`, and the earlier tactics fail. No theorem closes. Padding by restatement is R07.

**Headline theorems.**
- **Stated (15):**
  - spectral integral (§1.1–1.2);
  - maximal multiplier (§1.7);
  - normal spectral theorem (§2.2);
  - joint PVM (§2.5);
  - multiparameter Stone (§2.6);
  - spectral types (§3.3);
  - spectrum alternatives (§4.2);
  - Friedrichs with extremality and the closed-form representation (§4.7);
  - the integration counterexample (§5.1, two declarations, one of them R07);
  - Nelson (§5.3, two);
  - closed tensor sum and product (§§6.2–6.3).
- **Absent but statable:** R01.
- **Named as not statable, and confirmed:** at the pins I found no Cayley spectral measure of a given unbounded operator (SA-E01), no Sturm–Liouville minimal or maximal operator, and no translation surface.

**Adversarial table.** Conventions: inner products are conjugate-linear in the first slot, `R_A(z)=(zI−A)⁻¹`, `U(t)=exp(itA)` and `N₊=ker(S*−i)`.

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| A01–A02 `existsUnique_spectralIntegral` | H=0; X=∅; atoms at 0,1 on ℂ², x=(1,2), f=(2,i); counting ℕ₊, f(n)=n, xₙ=1/n | X=∅ gives I=P(X)=P(∅)=0, so H=0; f[P]x=(2,2i), ‖·‖²=8=4·1+1·4; adjoint diag(2,−i)=conj f; Σxₙ²=π²/6, Σn²n⁻²=∞ | true |
| A02a §1.2a | A=M_x on L²(ℝ), f=1_[0,1] | V10's calculus gives multiplication by 1_[0,1], which is P_T([0,1]) by V10's Check (`VonNeumannAlgebras/README.md:2329`), equal to f[P_A] | true; no cycle |
| A03 §1.3 | A=M_n, f=λ, g=−λ; f=λ, g=0 | dom f∩dom g=D(M_n)⊊ℓ²=dom(f+g)[P]; dom(f[P]0[P])=ℓ², dom(0[P]f[P])=D(M_n)=dom f∩dom 0, as (3.39) gives | true |
| A06 §1.6 | diag(0,1); M_x on L²(0,1) | P((λ−ε,λ+ε))≠0 ∀ε iff λ∈{0,1}; 1_(λ−ε,λ+ε)∩(0,1)≠0 iff λ∈[0,1] | supp=σ |
| A07 `existsUnique_maximal_multiplier` | μ=0; one point, f=i; counting ℕ₊, f=n | Lp=0; T=iI, T*=−iI≠T; 1/n²∈dom with Σn²n⁻⁴=π²/6; 1_{|f|≤n}x→x without σ-finiteness | true |
| B01/B02 `…_of_normal` | diag(1,i); iM_n; [[0,1],[0,0]] | Re=diag(1,0), Im=diag(0,1); Re(iM_n)=0 total vs the algebraic part on D(M_n); ‖Ne₂‖=1≠0=‖N*e₂‖, so `hnorm` fails | true |
| B03/B03a §§2.3–2.4 | the gluing of `README.md:320–326` | 12 removed points form one class (via (0,1)∼(3,1)∼(2,1)∼(1,1)∼(1,0)∼…); angles 8·π+4·3π/2=14π and 4·π/2=2π; V−E+F=2−16+8=−6, g=4; e^{−X}e^{−Y}u⊂(0,1)×(1,2), e^{−Y}e^{−X}u⊂(1,2)×(0,1); e^Xe^Yu, e^Ye^Xu⊂(2,3)×(2,3) | all numbers match |
| B04 `existsUnique_jointProjValMeasure` | n=0; diag(0,1),diag(2,3); Pauli X,Z | Fin 0→ℝ is a point, P unique (P(∅)=0 from `inner_proj`); atoms (0,2),(1,3); (i−X)⁻¹=−(i+X)/2, so [(i−X)⁻¹,(i−Z)⁻¹]=[X,Z]/4≠0 | true |
| B05 multiparameter Stone | n=0; A=diag(0,1) | U(0)=I, P on a point; ⟨e₂,U(t)e₂⟩=e^{it}=∫e^{its}dμ with atom at 1; the opposite sign puts it at −1 | true |
| C01 §3.1 | Q=M_x, uₙ=√n·1_[λ,λ+1/n]; g of `:406` | ‖(Q−λ)uₙ‖²=n∫₀^{1/n}t²=1/(3n²); g⁻¹{1}=[0,1]∪{2}, σ_p={1}, σ_c=ℝ∖{1}, |g−id|≤1 | true |
| C02 §3.2 | diag(0,1); 0 on ℓ²; diag(1/n) | ∅; {0} (dim ker=∞); {0} (no eigenvalue, infinite-rank windows) | true |
| C03 `exists_spectralType_decomposition` | diag(0,1); M_x on L²[0,1]; Cantor; rational diagonal | H_pp=ℂ²; H_ac=H; H_sc=H; H_pp=H with σ_c=ℝ∖ℚ; μ^{x_n}→μ^x in total variation, by |‖P(B)x‖²−‖P(B)y‖²|≤(‖x‖+‖y‖)‖x−y‖ | true |
| C05 §3.5 | F=[0,1], D=ℚ∩[0,1]; m=2; H=0 | σ=[0,1], σ_p=D, σ_c=[0,1]∖ℚ; |F|≤2; all ∅ | true |
| D01 §4.1 | 2I; −i∂ on H₀¹(0,1); on H₀¹(0,∞); ℵ₀ copies ⊕ half-line | (0,0); e^{−x}∈N₊, e^{x}∈N₋, so (1,1); (1,0); (ℵ₀+1,ℵ₀)=(ℵ₀,ℵ₀) | true |
| D01a `resolventSet_alternatives…` | 2I, z=i; half-line; interval; H=0 | (i−2)R=1, ρ=ℂ∖{2}; |e^{iz̄x}|=e^{(Im z)x}∈L²(0,∞) iff Im z<0, so ρ={Im z>0}; interval ρ=∅; ρ=ℂ | all four alternatives occur |
| D03 §4.4 | Jψ=conj ψ(−x) with i∂; plain conjugation | AJψ=JAψ=−i conj ψ′(−x); +i conj ψ′ vs −i conj ψ′ | commute vs anticommute |
| D04 §4.5 | unit x₊, x₋; C=iI; C=[[1,1],[0,1]] | G(x₊,x₊)=−i−i=−2i, (i/2)G=1; x₋: 2i, −1; C*JC=[[c̄a−āc, c̄b−ād],[d̄a−b̄c, d̄b−b̄d]]=J for both | true |
| D05 §4.6 | φ₊=Ce·e^{−x}, φ₋=Ce^{x}, C=√(2/(e²−1)) | ‖e^{−x}‖²=(e²−1)/(2e²); λφ₊+φ₋: u(0)=C(1+eλ), u(1)=C(λ+e); λ=1 gives θ=0, λ=−1 gives (e−1)/(1−e)=−1 | true; locator R04 |
| D06 `existsUnique_selfAdjoint_of_closed_form` | ℂ, j=id, q=2ūv; j=2id, q=ūv; q=0 with α=1,2 | q(1,i)=2i=⟨2·1,i⟩; ⟨h,2v⟩=ūv gives A=I/4; A=0 for both α | true |
| D06 `friedrichs_extension_extremal` | −d² on C_c∞(0,1), γ=0, T=Neumann, t=−1, u=1 | ⟨1,R_T(−1)1⟩=−1; R_SF(−1)1=−u, u=1−cosh(x−½)/cosh(½), so ⟨1,R_SF(−1)1⟩=−(1−2tanh½)=−0.0758; −1≤−0.0758 | R_T≤R_SF holds; `(·−t)⁻¹` reverses it |
| D07 §4.8 | ν=½; ν=3/2; p=1_(0,½) | r^{½±ν}: 1, r (LC); r², r⁻¹ (LP); p⁻¹∉L¹_loc | true |
| E01 integral pair | fₙ=n⁻¹1_[0,n]; y∈ℂ | ‖fₙ‖₂²=1/n, ∫fₙ=1, so (0,1)∈closure of graph; f↦ȳ∫f is continuous iff y=0, so `adjoint.domain=⊥` | true; padding R07 |
| E01 kernels | u=1_I+i1_J, φ=1_J; Sylvester–Hadamard order 2^k | conjugated transpose −i on I, unconjugated +i; signed norm 1, absolute norm 2^{k/2}, pairing per block 2^{−k/2}·2^{k/2}=1, sum ∞ | true |
| E02 §5.2 | 2I, x=1; 0; M_n, xₙ=1/n | Σ2ⁿrⁿ/n!=e^{2r}; ‖x‖; x∉D(M_n) | true |
| E03 Nelson pair | k=1, 2I, C=R=2; iI; Pauli at e₁ | (1,2),(2,4),(4,16); ⟨i,1⟩=−i≠i, so `hsym` fails; foldr [X,Z]e₁=e₂, [Z,X]e₁=−e₂, so `hcomm` fails | true; FSSS (C) is the one-letter case |
| E04 §5.4 and R01 Weyl | A=0, V=P rank one on ℓ²; V=I; H=0 | R₀(i)−R_P(i)=(1/i−1/(i−1))P has finite rank, σ_ess={0} both (1 is discrete for P); (1/i−1/(i−1))I=((1−i)/2)I not compact, σ_ess {0}→{1}; both ∅ | statements true |
| E04a §5.5 and R01 branch | A=2I, B=3I on ℂ; diag(t,−t); B=0 | λ(z)=2+3z, λ′(0)=3=⟨u₀,3u₀⟩; branches ±t (sorted −|t|,|t| not analytic); λ≡λ₀, v≡u₀ | true |
| E06 §5.7 and R01 Kato | V=0; `ContDiff ℝ ⊤` | −Δ on C_c∞(ℝ³) is ess. s.a.; ⊤=ω at the pin makes the domain {0}, so ∞ is used | true as written with ∞ |
| F01–F03 tensor pair | 2I,3I; H=0; M_n,−M_n, x=Σn⁻¹eₙ⊗eₙ; ℕ₊ & {−n+1/n}; ℕ₊ & {0}∪{1/n} | 5I, 6I; both sides ∅; s+t=0 on atoms, Σn²n⁻²=∞, Σn⁴n⁻²=∞; m−n+1/n≠0 but →0; raw ℚ_≥0 vs [0,∞) | closures needed; true |
| F04 §6.4 | A=2I, B=3I, x=y=1 | Σ5ⁿtⁿ/n!=e^{5t}=e^{2t}e^{3t} | true |

**Sources read at their locators (seeded sample and locators touched by findings).** For `teschl`, printed page = PDF page − 12, and every locator below is on its stated printed page:
- Theorem 3.2 and (3.29) p.92 (`line 3752–3758`), normality p.91 (`3746–3749`), (3.23) p.91 (`3715`), Theorem 3.7 p.96 (`3983`).
- Lemma 3.5 with (3.38)–(3.39) p.94 (`3869–3872`), Theorem 3.8 and Corollary 3.9 p.97 (`4015–4032`), Problems 3.10–3.11 p.99 (`4088–4090`).
- Lemma 2.16 p.76 (`3144`), (6.27)–(6.28) and Lemma 6.17 p.145 (`6261–6277`), Lemma 6.18 and Theorem 6.19 p.146 (`6313–6324`), Theorem 2.21 p.78 (`3203`), (3.67) and Lemmas 3.11–3.12 p.101 (`4194–4210`).
- Theorem 2.26 p.82 (`3365`), Lemma 2.27 and Theorem 2.28 p.83 (`3402–3418`), Lemma 2.3 p.63 (`2587`), Lemma 2.7 and (2.44) p.66 (`2703–2713`, R05), Corollary 5.3 p.125 (`5271`).
- Theorem 6.4 p.135 (`5704`), Lemmas 6.22–6.23 p.148 (`6368–6384`), Theorem 4.14, (4.43)–(4.44) and Problem 4.5 p.121 (`5134–5157`), Problem 2.27 p.84 (`3453`).
- Theorem 2.12 p.70 (`2914`), Theorem 2.13 p.71 (`2960`), Lemma 4.5 p.116 (`4926`), (4.24), Lemma 4.9 and Problem 4.2 p.117 (`4967–4985`), Theorem 5.2 p.124 (`5232`), Lemma 3.19 and (3.83) p.105 (`4390–4391`).

The other sources:
- `jones`: Exercise 12.1.11(ii) p.86 (`2883–2887`) and Exercise 12.1.15 p.87 (`2902–2903`).
- `flato-simon-snellman-sternheimer`: analytic vectors p.424 (`54–62`), Hypothesis (C) p.428 (`230–232`) and Theorem 1 p.430 (`277–279`). Hypothesis (C) asks exactly for a dense invariant domain of vectors analytic for each basis representative, as §5.3 states.

The seeded sample (15 targets):
- **Supported as written (10):** §§1.2, 1.3, 1.6, 2.1, 3.1, 3.2, 3.5, 4.1, 5.2 and 5.4.
- **§5.1:** supported, with the misplaced locator of R05.
- **§6.1:** the self-adjoint part is supported; the general adjoint lacks a locator (R05).
- **§6.4:** its Teschl locator holds.
- **§§1.2a and 2.4:** no external locator. §1.2a resolves on V10 (below), and §2.4's numbers are computed in the table.

**Library declarations opened at the pins** (one `#check` file; all present):
- Mathlib: the backticked Mathlib names of the README, among them `LinearPMap.adjoint`, `adjoint_graph_eq_graph_adjoint`, `adjoint_isClosed`, `smul_domain`, `HilbertBasis.repr`, `IsCoercive.continuousLinearEquivOfBilin`, `InnerProductSpace.rclikeToReal`, `TensorProduct.instInnerProductSpace`, `UniformSpace.Completion.innerProductSpace`, `fourierBasis`, `banach_steinhaus`, `Measure.absolutelyContinuous_iff_withDensity_rnDeriv_eq`, `MeasurableEquiv.piFinTwo`, `Matrix.unitaryGroup` and `Matrix.specialUnitaryGroup`.
- Tau Ceti:
  - `ProjValMeasure` and its fields (`ProjValMeasure/Basic.lean:91–106`);
  - `integral` (`Integral.lean:218`) and `polarizedComplexMeasure` with `polarizedComplexMeasure_apply` (value `⟪ψ,P(B)ξ⟫`, `Polarization.lean:60`, `:68`);
  - `integral_polarizedComplexMeasure_eq_inner_integral` (`MatrixElement.lean:83`), `map` (`Map.lean:40`) and `ae` (`Null.lean:42`);
  - `IsResolventAt`, `resolventSet`, `spectrum` and `resolvent` (`Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:65`, `:129`, `:140`, `:169`), whose value off the resolvent set is junk. That value is never used: every `resolvent` argument in `Suggested.lean` lies in the resolvent set (nonreal, or below the lower bound).
- Findings R02–R03: the declarations cited there.

**Cross-roadmap citations resolved on main (94294cd).**
- SelfAdjointSpectralTheory: SA-A21, B14, B21, B25, B39, B40, B44, B45, B49, B52, B57, B85, C39, C55, D17, D18, D20, E01, E05–E08, E26, E29, E43 and E44 (`README.md:225`–`1316`). All are also present at the heads of the two open revisions #1187 and #1854.
- HilbertModules H6 (`:705`), and H7 for R04.
- VonNeumannAlgebras V2.RectangularL2 (`:634`), V10.ClosedOperators (`:2249`; its Rudin 13.30 clause at `:2274–2276`) and V10.Affiliation (`:2305`; truncation cores and the product rule at `:2312–2316`).
- BanachSpaceTheory B5 with `hilbertBasis_lift_mk_eq` and `nonempty_linearIsometryEquiv_iff_lift_mk_eq` (its `Suggested.lean:159`, `:165`; the same at #1854).
- PolarDecomposition PD-B23, B29, B32 and B34; BanachAlgebras Layer 2 §2.1 (`:442`); PDE §§1.1, 1.3, 1.4 and 1.6 (`:677`, `:769`, `:803`, `:905`); LieGroups Layers 2 and 5 (`:356`, `:518`).
- GeneralizedCohomology G5.5-RealHilbert (`:1939`; unchanged at #1187, #1854, #1807 and #1808); OperatorAlgebraDynamics D8 (`:12`); Completed/OrthogonalL2Bases Parts A and D.

**Ownership and overlaps.**
- The overlap listing reports no other pull request changing this roadmap and no dropped ids, and I confirmed both.
- `roadmaps grep` over main and the open heads, for joint PVM, Friedrichs extension, deficiency indices, Nelson, essential spectrum, Weyl's theorem, Kato–Rellich and relative compactness:
  - QuantumFoundations, RelativisticQuantumFieldTheory (`README.md:862`: "UnboundedOperators UO-E03"), NoncompactQuantumSymmetry (`:1219`) and VariationalMethods consume UO targets and own none.
  - OperatorKTheory (#866) owns the Fredholm essential spectrum of bounded operators only, which is a different carrier (R01's repair adds the comparison clause).
  - No roadmap on main or at an open head owns Nelson's theorem, the joint PVM or the closed tensor sum.
- Duplications with the pinned libraries and with main are R02 and R03.

**README form.**
- No LaTeX, `lemma`, `set_option`, pull-request number or machine path.
- Every layer ends with Examples and Dependencies, and the *Needs* graph of Layers 1–6 has no cycle.
- Imports are `import Mathlib` and two existing `TauCeti.*` modules.
- The resolver's single lead, `applyWord`, is declared at `Suggested.lean:269`.

## Not verifiable

- **The 225-page lecture packet** (`README.md:1421`). It is not in the manifest or the sources cache, and a web search for it finds no public copy. Every Grundling, Exam, Assignment and Problems I page locator is unchecked; the mathematics stated beside them was tested where the table shows it. See R06.
- **Nelson (1959)**, §10 and Lemmas 5.1 and 10.1, and the Source provenance remark on its support annotations (`:1415–1417`). This is uncertified (JSTOR paywall). The §2.3 support computations were checked mathematically in the table.
- **Kato (1995) and Weidmann (1987).** Settled as uncertified and cited by section only.
- **Eckhardt–Gesztesy–Nichols–Teschl.** §4.8 is outside the seeded sample, and its arXiv locators were not reread this round.

## Source issues

- **Misprint** in jones at Definition 12.1.13, printed p.87: the source says that, for ξ in the adjoint domain, one defines T*ξ = η, after calling the domain vector η and its representative σ; it should be T*η = σ; affects nothing.
- **Misprint** in teschl at Theorem 4.14 (proof), printed p.121: the source says the test vector is ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{1,k}; it should be ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{n,k}; affects nothing.
- **Gap** in teschl at Theorem 4.14 (proof), printed p.121: the source says Weyl sequences with (A_j − λ_j)ψ_{j,k} → 0 give (P − λ)ψ_k → 0 for a polynomial P of degree N; it should use vectors in the ranges of P_{A_j}((λ_j − 1/k, λ_j + 1/k)), since for N ≥ 2 the first-order condition does not control (A_j^m − λ_j^m)ψ_{j,k}; affects the proof.
