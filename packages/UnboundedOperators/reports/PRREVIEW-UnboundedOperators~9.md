# Review of UnboundedOperators (pull request #1027 at 45b4d4d)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Five findings: one P2 and four P3. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

**Previous review (r8, at 61a7f00), finding by finding.** All four are repaired.

- **R01, repaired.** `README.md:180–182` now reads "§4.7 proves that the identity of the underlying `TauCeti.Complexification H` is a complex-linear isometric equivalence between the two synonyms; J and `D_ℂ` are used on `H_ℂ` through it".
  - §4.7 (`:688–701`) constructs e_H, transports J and `D_ℂ` along it, and identifies `Fix J` with `ι_H(H)`.
  - The API bullet is at `:753` and the Check at `:760`.
  - At the pin, `WithLp.instComplexificationInnerProductSpace` (`TauCeti/Analysis/InnerProductSpace/Complexification.lean:159`) has the stated formula.
- **R02, repaired.**
  - `:63–68` cites `LinearPMap.exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero` and `LinearPMap.isSelfAdjoint_of_surjective_addSub` with their file.
  - `:128` reads "SA-A21, SA-C55 and these three are implemented at the Tau Ceti pin".
  - §4.1 (`:548`) cites "SA-A21, Tau Ceti's `LinearPMap.isSelfAdjoint_of_surjective_addSub`".
  - Layer 3 (`:451`) and §4.2 (`:566`) use the orthogonal-range lemma.
- **R03, repaired.** No lecture-packet locator remains: no "Grundling", "packet", "Exam", "Assignment" or "physical p." in `README.md`. The References (`:1423–1473`) list exactly the seven works of the sources manifest.
- **R04, repaired.** API blocks were added to:
  - Layer 3 (`:453–457`);
  - §4.8 (`:800–804`);
  - §5.1's `D_abs` (`:837–841`);
  - §6.2 (`:1004–1008`).

  Each was checked against its Checks in the table below.

## R01 (P2) — The resolvent/Stone-group half of §2.3's strong-commutation equivalence is statable at the pins, but it is absent and the docstring calls it unstatable

**Location.**
- `Suggested.lean:37–40`: "Not statable at the pins: every headline about the spectral measure `P_A` … This covers … the equivalent forms of strong commutation (§2.3)".
- `README.md:374`: "(ii) commuting resolvents at nonreal parameters, and (iii) commuting Stone groups".

**Claim.**
- Of §2.3's three equivalent forms, only (i), commuting spectral projections, needs `P_A`.
- Forms (ii) and (iii) need only resolvents and Stone groups, and both carriers are at the Tau Ceti pin:
  - `LinearPMap.resolvent`;
  - the unitary `StronglyContinuousGroup` with complex generator `I • A`, which is unique by `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.
- So (ii) ⇔ (iii) (Teschl (2009), (4.24)–(4.25), p.117) is a statable headline that is absent, and the docstring gives the wrong reason for its absence.
- It is also the bridge between the file's own notion of strong commutation, which is resolvent commutation (`existsUnique_jointProjValMeasure`, `nelson_resolvent_commute`), and the Stone groups of §2.6.

**Witness.** `TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean:106` states the Stone uniqueness. The statement below elaborates at the pin.

**Repair.** Add to Layer 2, with `import TauCeti.Analysis.Semigroups.Group.Stone.Unbounded`:

```lean
theorem commute_resolvent_iff_commute_stoneGroup {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (A B : H →ₗ.[ℂ] H)
    (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B)
    (U V : TauCeti.Semigroups.StronglyContinuousGroup H) (hU : U.IsUnitary) (hV : V.IsUnitary)
    (hUA : U.complexGenerator hU = Complex.I • A) (hVB : V.complexGenerator hV = Complex.I • B) :
    Commute (A.resolvent Complex.I) (B.resolvent Complex.I) ↔ ∀ s t : ℝ, Commute (U s) (V t) := by
  sorry
```

Then:
- name it in §2.3 next to the (4.24)–(4.25) locator;
- change the docstring's §2.3 item to "the spectral-projection form of strong commutation (§2.3, form (i))".

Tested:
- A scratch copy of `Suggested.lean` with this theorem (and R02's repair) elaborates with 21 `sorry` warnings and nothing else.
- For Pauli X and Z, `[R_X(i), R_Z(i)] = [X,Z]/4 ≠ 0`, and `U(π/2)V(π/2) = −XZ ≠ −ZX = V(π/2)U(π/2)`, so both sides are false.
- For A = B, and on H = 0, both sides are true.

## R02 (P3) — `Suggested.lean` writes Tau Ceti's `LinearPMap.smulSub` out by hand seven times

**Location.** `Suggested.lean:146–147`, `:163–165`, `:399–400`, for example "`LinearMap.ker (z • A.domain.subtype - A.toFun)`".

**Claim.**
- The shift `x ↦ z•x − Ax` on `dom A` is a pinned definition, `LinearPMap.smulSub z A`, whose body is exactly this expression.
- `discreteSpectrum`, `notMem_essentialSpectrum_iff` and `exists_realAnalytic_eigenvalue_branches` restate that body instead of using the definition.
- The From Tau Ceti paragraph (`README.md:40–120`) does not cite it.

**Witness.** `TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean:39` defines `smulSub c A := c • A.domain.subtype - A.toFun`. `example : LinearPMap.smulSub z A = z • A.domain.subtype - A.toFun := rfl` elaborates.

**Repair.**
- Add `import TauCeti.LinearAlgebra.LinearPMap.SmulSub`; it is not imported transitively.
- Replace the seven occurrences by `LinearPMap.smulSub z A` and `LinearPMap.smulSub (lam₀ : ℂ) A`.
- Cite `LinearPMap.smulSub` (`TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean`) in the From Tau Ceti paragraph, and use it in §3.2's sentence defining `discreteSpectrum` (`:479`).

Tested: the substituted scratch copy elaborates with 20 `sorry` warnings and no other message, and the `rfl` example above closes.

## R03 (P3) — LocalVariationalFieldTheory on main cites milestone names UO1–UO5 and an anchor that this README no longer has

**Location.** `TauCetiRoadmap/LocalVariationalFieldTheory/README.md:1167` on main: "[UnboundedOperators UO1–UO5](../OperatorTheory/UnboundedOperators/README.md#milestone-names-and-dependency-order) owns operator domains, closures, spectral calculus, cores and evolution."

**Claim.**
- When this pull request merges, the relative link resolves to this README.
- It has neither the names UO1–UO5 nor the heading the anchor needs. They come from this roadmap's first head (`bd1bbc0`, `README.md:211–221`), which grouped the targets as follows:
  - UO1 = UO-A01–A08;
  - UO2 = UO-B01–B05, B03a and C01–C05;
  - UO3 = UO-D01–D07 and E02–E03;
  - UO4 = UO-E01 and E04–E06;
  - UO5 = UO-F01–F04.
- The rule for a dropped id that another roadmap cites asks for an old → new line.

**Witness.** At `45b4d4d`, `grep -cE 'UO[1-5]\b|Milestone names'` on `README.md` returns 0. The overlap tool cannot see this case, because the roadmap is not yet on main.

**Repair.** Under `## How to read the build`, add `### Milestone names and dependency order`. Its anchor is the cited `#milestone-names-and-dependency-order`. Give it one line per name:
- "UO1 is Layer 1 (UO-A01–UO-A08)";
- "UO2 is Layers 2–3 (UO-B01–UO-B05, UO-B03a, UO-C01–UO-C05)";
- "UO3 is Layer 4 and §§5.2–5.3 (UO-D01–UO-D07, UO-E02–UO-E03)";
- "UO4 is §§5.1 and 5.4–5.7 (UO-E01, UO-E04–UO-E06, UO-E04a)";
- "UO5 is Layer 6 (UO-F01–UO-F04)".

Tested: every target named there is a heading of this README (`:205–1028`). Rerun the gate after the edit.

## R04 (P3) — The From Mathlib paragraph describes `IsCoercive.continuousLinearEquivOfBilin` backwards

**Location.** `README.md:33–36`: "`IsCoercive.continuousLinearEquivOfBilin` … is the real Lax–Milgram theorem: … it gives the continuous linear equivalence inverting `B♯`".

**Claim.**
- At the pin, the declaration is `B♯` itself, upgraded to an equivalence: `⟪B♯ v, w⟫ = B v w`.
- The solution map that §4.7 uses (`:658–663`) is its inverse, composed with the Riesz map.
- This is one of the README's claims about what a library provides, and as written it is false.

**Witness.** `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105–106`: `ContinuousLinearEquiv.ofBijective B♯ …`. `:109–110` gives `continuousLinearEquivOfBilin_apply : ⟪… v, w⟫_ℝ = B v w`.

**Repair.**
- At `:33–36`, write: "it upgrades `B♯ = InnerProductSpace.continuousLinearMapOfBilin B` (`⟪B♯ v, w⟫ = B v w`, `continuousLinearEquivOfBilin_apply`) to an equivalence `V ≃L[ℝ] V`. Its inverse, composed with `(InnerProductSpace.toDual ℝ V).symm`, sends ℓ to the unique u with `B u = ℓ`."
- At `:663`, write "the inverse of Mathlib's `IsCoercive.continuousLinearEquivOfBilin` for `q_α`, composed with the Riesz map".

Tested with V = ℝ, `B(v,w) = 2vw` and `ℓ(w) = 6w`:
- Mathlib's equivalence is v ↦ 2v, while the README's "inverting `B♯`" would mean v ↦ v/2.
- The Riesz vector of ℓ is 6, the inverse sends it to u = 3, and `B(3,w) = 6w = ℓ(w)`.

## R05 (P3) — Nelson's translation surface and its completion have Checks but no API block

**Location.**
- §2.3 `:379–385` constructs `M₁`, `M₂` and the gluing.
- §2.4 `:399–403`: "Construct its finite CW structure with eight faces, sixteen edges and two vertices … Define the genus of M as half the rank of `H₁(M; ℤ)`".
- §2.4 has Checks at `:405–411`.

**Claim.** Every definition must list its API in prose bullets. The surface, its completion and the genus are definitions with five Checks and no **API.** block. Their facts are scattered through two long paragraphs.

**Witness.** The README has 20 **API.** blocks (`:211`, `:255`, …, `:1004`). None lies between `:372` and `:417`.

**Repair.** After `:403`, add an **API.** block with three bullets:
- The regular quotient is a Hausdorff, second-countable, flat smooth surface. Its Riemannian volume is Lebesgue measure transported from `int M₁`, and the chart fields `X₀`, `Y₀` commute and are divergence free.
- Its metric completion adds one point, of cone angle `14π`, with disk chart `(r,θ) ↦ (r,θ/7)`. The completion M is a compact, connected, oriented topological surface without boundary.
- M has a finite CW structure with 2, 16 and 8 cells. Its integral homology is `ℤ, ℤ⁸, ℤ`, and its genus is 4.

Tested against the existing Checks:
- `2 − 16 + 8 = −6 = 2 − 2·4`;
- the eight non-corner boundary points have angle π each and the four hole corners `3π/2` each, giving `8π + 6π = 14π`;
- the 𝔽₂ dimensions are `1, 8, 1`.

## Verified sound

**Gate and dependency check.**
- The worker's gate at `45b4d4d` has every rule at 0 (`OK`).
- My rerun of the brief's gate command, which reads the configured merge order, has every rule at 0 except `depcheck: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`. That is not a finding: the candidate order lists this roadmap at line 10, after VonNeumannAlgebras, CStarAlgebras, HilbertModules and OperatorKTheory.
- The dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` lists only the two files of this folder.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` takes 8.5 s and gives 20 `sorry` warnings, one per theorem, and nothing else.
- One scratch file `#check`s all 28 declarations. Every elaborated type matches its README statement, and no section binder is lost:
  - the Nelson theorems carry `[CompleteSpace H]`;
  - `existsUnique_selfAdjoint_of_closed_form` carries `[CompleteSpace V]`;
  - the two `def`s need no completeness.
- `#print LinearPMap.IsRelativelyBounded` shows two fields, `domain_le` and `norm_apply_le`, with no sign or `b<1` condition. So the eigenbranch hypotheses are as general as the README's, or more.
- Nothing in the file was changed, so there is nothing to re-check.

**One-tactic probe.**
- Each `sorry` was replaced by `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (decide; done) | (simp; done) | (aesop; done) | (exact?; done) | sorry`.
- `simp` and `aesop` were dropped for the closed-form, Rellich and Kato theorems, where `simp` hits maxRecDepth or the heartbeat limit, which `first` does not catch.
- All 20 theorems stay at `sorry`.
- No declaration restates a definition. `integralOperator_counterexample` was considered as possible padding and kept: it is §5.1's named non-closability target, its proof is not one step, and it mirrors no Check.

**Headline theorems** (from README §§1–6), stated at the pins:
- §§1.1–1.2: `existsUnique_spectralIntegral`.
- §1.7: `existsUnique_maximal_multiplier`.
- §2.2: `existsUnique_projValMeasure_of_normal`.
- §2.5: `existsUnique_jointProjValMeasure`.
- §2.6: `existsUnique_projValMeasure_of_unitary_representation`.
- §3.2: `notMem_essentialSpectrum_iff`, with `discreteSpectrum` and `essentialSpectrum`.
- §3.3: `exists_spectralType_decomposition`.
- §4.2: `resolventSet_alternatives_of_isClosed_symmetric`.
- §4.7: `existsUnique_selfAdjoint_of_closed_form` and `friedrichs_extension_extremal`.
- §5.1: `integralOperator_counterexample`.
- §5.3: `nelson_essential_selfAdjoint` and `nelson_resolvent_commute`.
- §5.4: `essentialSpectrum_eq_of_isCompactOperator_resolvent_sub` and `isSelfAdjoint_add_and_essentialSpectrum_eq`.
- §5.5: `exists_analytic_eigenvalue_branch` and `exists_realAnalytic_eigenvalue_branches`.
- §5.7: `isSelfAdjoint_closure_neg_laplacian_add_potential`.
- §§6.2–6.3: `existsUnique_tensorSum` and `existsUnique_tensorProd`.

Confirmed as not statable at the pin:
- **`P_A`.** No constructor of a `ProjValMeasure` from a self-adjoint `LinearPMap` exists.
- **Sturm–Liouville operators.** There are no minimal or maximal operators, and stating them would need a long ad hoc encoding.
- **Nelson's surface.** There is no translation surface.
- The exception is R01.

**Adversarial table.** Conventions:
- inner products are conjugate-linear in the first slot;
- `R_A(z) = (zI−A)⁻¹` (Tau Ceti), against Teschl's `(A−z)⁻¹`;
- `U(t) = exp(itA)`;
- `N₊ = ker(S*−i)`.

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| A01–A02 `existsUnique_spectralIntegral` (sampled §1.1) | X=∅; atoms 0,1 on ℂ², x=(1,2), f=(2,i); counting ℕ₊, f=n | X=∅ gives I=P(X)=P(∅)=0, so H=0; ‖(2,2i)‖²=8=4·1+1·4, and unconjugated ∫f²dμˣ=4−4=0; Σn⁻²=π²/6 but Σn²n⁻²=∞ | true |
| A02a (sampled §1.2a) | A=M_n on ℓ², f(t)=t | on ran P_A({\|t\|≤k}) both calculi act as n on e_n, n≤k; union over k is the finite-support span, a graph core for both; domain Σn²\|x_n\|² on both sides | true |
| A04 (sampled §1.4) | A=diag(−1,1), f=t², g=√; f=t³, g=∛ | P_{f(A)}({1})=P_A({−1,1})=I; g∘f=\|t\|≠t at −1 with P_A({−1})≠0, so g(f(A))=I≠A; for t³, P_A({g∘f≠id})=P_A(∅)=0 and A is recovered | true, both directions |
| A05 (§1.5) | A=aI, a<b; diag(0,1) | E(a)=E(b)=I, so P((a,b])=0 and P([a,b])=I; E(1)−E(0)=diag(0,1) | true |
| A06 (sampled §1.6) | diag(0,1); M_x on L²(0,1) | P((λ−ε,λ+ε))≠0 for all ε iff λ∈{0,1}=σ; the indicator window is nonzero iff λ∈[0,1]=σ | supp=σ |
| A07 `existsUnique_maximal_multiplier` | μ=0; one point, f=i; counting ℕ₊, f=n | Lp=0; T=iI, T*=−iI≠T, so realness is needed; x=1/n² in the domain (Σ\|n·n⁻²\|²=π²/6), x=1/n not (Σ1=∞) | true |
| B01 (sampled §2.1) | diag(1,i); iM_n; [[0,1],[0,0]] | N*N=NN*=I, Re N=diag(1,0), Im N=diag(0,1); Re(iM_n)=0 on all H against the algebraic part on D(M_n), x_n=1/n; N*N=diag(0,1)≠diag(1,0)=NN* | true |
| B02 `…_of_normal` | diag(1,i); nilpotent | ‖Ne₂‖=‖N*e₂‖=1, atoms at 1 and i; nilpotent: ‖Ne₂‖=1≠0=‖N*e₂‖, so `hnorm` fails | true |
| B03 (§2.3, pullback convention) | u supported in (0,1)² | e^{−Y}u ⊂ (0,1)×(1,2), and x-translation is 1-periodic there; e^{−X}u ⊂ (1,2)×(0,1), and y-translation is 1-periodic there: the supports are disjoint; e^Xe^Yu and e^Ye^Xu ⊂ (2,3)² | true |
| B03a (sampled §2.4) | completed surface | the 12 non-corner points form one class: 8 at angle π plus 4 at 3π/2 gives 14π; V−E+F=2−16+8=−6, g=4; Σ(2π−θ)=0+(2π−14π)=2π·(−6); unglued 16−24+8=0; ranks 1,8,1 | true; API missing (R05) |
| R01 (new) `commute_resolvent_iff_commute_stoneGroup` | Pauli X,Z; A=B; H=0 | (i−X)(i+X)=−2, so R_X(i)=−(i+X)/2 and [R_X(i),R_Z(i)]=[X,Z]/4≠0; U(π/2)=iX, V(π/2)=iZ do not commute; A=B and H=0: both sides true | true; R01 |
| B04 `existsUnique_jointProjValMeasure` | n=0; diag(0,1), diag(2,3); Pauli X,Z | Fin 0→ℝ is a point with one PVM; atoms (0,2),(1,3); `hcomm` fails for X,Z | true |
| B05 multiparameter Stone | n=0; n=1, A=diag(0,1) | U(0)=U(0)² and unitary, so U(0)=I; ⟨e₂,U(t)e₂⟩=e^{it}, an atom at +1; exp(−i…) would put it at −1 | true |
| Layer 3 API (new) | backward shift S; 0 on c₀₀; diag(0,1,1,…) | ‖(1,z,z²,…)‖²=1/(1−\|z\|²) is finite iff \|z\|<1; S*−λ̄ is injective, so ran(S−λ) is dense on the circle; for S*, ran(S*−λ)⊥(1,λ̄,…), so the disc is residual; 0 is an eigenvalue with ran=e₁⊥, not residual | consistent |
| C02 `discreteSpectrum`/`essentialSpectrum` | diag(0,1); 0 on ℓ²; diag(1/n); rational diagonal | ∅; {0} (dim ker=∞); {0} (not an eigenvalue); ℝ; dropping isolation would give ℝ∖ℚ | true |
| C02 `notMem_essentialSpectrum_iff` (sampled §3.2) | P rank one, z=1,0,i; rational diagonal at q | z=1: dim ker=1, ran=ker P closed, codim 1, and 1∈σ_d; z=0: dim ker=∞, both sides false; z=i: ker 0, ran H; q: range not closed, so not Fredholm, and q∈σ_ess | true both ways |
| C03 `exists_spectralType_decomposition` | diag(0,1); M_x on L²[0,1]; Cantor | H_pp=ℂ²; H_ac=H; H_sc=H; μ^{x+y}≤2(μˣ+μʸ) | true |
| D01 (§4.1) | 2I; interval; half-line; ⊕ | (0,0); e^{∓x}∈L²(0,1) gives (1,1); only e^{−x}∈L²(0,∞) gives (1,0); (ℵ₀+1, ℵ₀+0)=(ℵ₀,ℵ₀) | true |
| D01a `resolventSet_alternatives…` (sampled §4.2) | 2I; half-line; interval; H=0 | ℂ∖{2} (fourth); \|e^{iz̄x}\|=e^{(Im z)x} is L² iff Im z<0, so ρ={Im z>0} (third); ρ=∅ (first); ρ=ℂ (fourth) and self-adjoint | all occur, true |
| D03 (sampled §4.4) | Jψ=conj ψ(−x) with i∂; plain K | i∂(Jψ)=J(i∂ψ)=−i·conj ψ′(−x); i∂(Kψ)=+i·conj ψ′, K(i∂ψ)=−i·conj ψ′ | commute vs anticommute |
| D04 (§4.5) | unit x₊, x₋; C=iI | G(x₊,x₊)=−i−i=−2i, (i/2)G=1; for x₋: 2i and −1; āc=0, b̄d=0, ād−c̄b=(−i)(i)=1 | true |
| D05 (§4.6) | φ₊=Ce·e^{−x}, φ₋=Ceˣ | ‖φ±‖²=C²(e²−1)/2=1; u(0)=C(1+eλ), u(1)=C(λ+e), \|λ+e\|²=\|1+eλ\|²=1+e²+2e Re λ | true |
| D06 `existsUnique_selfAdjoint_of_closed_form` (sampled §4.7) | ℂ: j=id, q=2ūv; j=2id, q=ūv; q=0 with α=1,2 | A=2I, both sides 2i at u=1, v=i; 2·conj(h)v=ūv with x=2u gives A=I/4; A=0 for both α | true |
| D06 `friedrichs_extension_extremal` | −d² on C_c^∞(0,1), Neumann T, t=−1, vector 1 | ⟨1,R_T(−1)1⟩=−1; u=1−cosh(x−½)/cosh½, ∫u=1−2tanh½≈0.0758, so ⟨1,R_SF(−1)1⟩≈−0.0758 ≥ −1 | R_T≤R_SF; true |
| D06 e_H (§4.7) | H=ℝ | ⟨i·1,1⟩=(0·1+1·0)+i(0·0−1·1)=−i on both synonyms; J fixes {y=0}; x+iy↦x−iy sends i·1 to −i, not to i | true |
| Lax–Milgram contract (R04) | V=ℝ, B=2vw, ℓ=6w | Mathlib: v↦2v; "inverting B♯" would mean v↦v/2; the solution is u=3 | README wrong; R04 |
| D07 Green (§4.8) | p=w=1, q=0 on (0,1), f=x², g=1 | ⟨g,τf⟩=−2, ⟨τg,f⟩=0, W₀−W₁=0−2=−2; Teschl's order W₁−W₀=+2; ν=½ gives solutions 1, r (both L²); ν=3/2 gives r⁻¹∉L² | README right; Source issues |
| E01 `integralOperator_counterexample` | f_n=n⁻¹1_[0,n]; y∈ℂ | ‖f_n‖²=1/n and ∫f_n=1, so (0,1)∈cl(graph); f↦ȳ∫f is continuous only for y=0 | true |
| E01 `D_abs` API (new) | ψ=Σn⁻¹s_n; u_n=1_{I_n}/√n | ‖ψ‖²=Σn⁻²<∞, P_K\|ψ\|=n·n⁻¹=1 on each I_n, so ψ∉D_abs; signed rows 0, so ψ∈D_max; A_K u_n=(n/√n)1_{I_n}=n·u_n | consistent |
| E02 | 2I, x=1; M_n | Σ2ⁿrⁿ/n!=e^{2r}; x_n=1/n∉D(M_n) | true |
| E03 `nelson_*` (sampled §5.3) | S=2I; iI; Pauli at e₁; k=0 | (1,2),(2,4),(4,16); ⟨i,1⟩=−i≠i, so `hsym` fails; XZe₁=e₂ and ZXe₁=−e₂; k=0 vacuous | true |
| E04 Weyl (sampled §5.4) | A=0, B=P; B=I | R₀(i)−R_P(i)=((1−i)/2)P has rank one and σ_ess={0} for both; for B=I it is ((1−i)/2)I, not compact, and σ_ess moves {0}→{1} | true |
| E04 `isSelfAdjoint_add_and_essentialSpectrum_eq` | A=0, V=P; V=I | V·R₀(i)=−iP is compact and σ_ess(P)={0}; V=I gives −iI, so the premise fails | true |
| E04a `exists_analytic_eigenvalue_branch` (sampled §5.5) | A=diag(0,1), B=[[1,1],[1,0]]; 2I, 3I | λ²−(1+z)λ+z−z²=0, λ=z−z²+O(z³), λ′(0)=1=⟨e₁,Be₁⟩; ∂_z(w−2−3z)⁻¹=3/(w−2−3z)² | true |
| E04a `…_branches` | A=0 on ℂ², B=diag(1,−1); B=0 | branches ±t with e₁,e₂ and σ∩ball={t,−t}; the ordered −\|t\|,\|t\| is not analytic at 0; B=0 gives λ≡λ₀ | true |
| E06 Kato (sampled §5.7) | u(λx); V₂=\|x\|⁻¹1_{\|x\|<1} | the GN bound scales as λ^{−3/8}·λ^{3/8}=1; R²=‖Δu‖/‖u‖ equalizes R^{3/2}‖u‖ and R^{−1/2}‖Δu‖; ∫_{\|x\|<1}\|x\|⁻²=4π; elaborated index `↑⊤` | true |
| F02–F03 `existsUnique_tensorSum/Prod` (sampled §6.3) | 2I,3I; H=0; M_n,−M_n with x=Σn⁻¹e_n⊗e_n; ℕ₊ and {0}∪{1/n} | 5I and 6I; ∅=∅; s+t=0 on the atoms, but Σn²n⁻²=∞ and Σn⁴n⁻²=∞; the raw product is ℚ≥0, its closure [0,∞) | true |
| F04 | 2I, 3I | Σ5ⁿtⁿ/n!=e^{5t}=e^{2t}e^{3t} | true |
| R02 `smulSub` | any A, z | `smulSub z A = z • A.domain.subtype - A.toFun` closes by `rfl` | identical; R02 |

**Sources read at their locators (the seeded sample).** For `teschl`, printed page = PDF page − 12; every locator below is on its stated printed page.

| Target | Locator | Lines | Verdict |
|---|---|---|---|
| §1.1 | (3.25)–(3.27) p.91; Thm 3.2 p.92 | `teschl line 3726–3740`, `3752–3758` | supported as written |
| §1.2a | no external locator | V10.Affiliation (`TauCetiRoadmap/VonNeumannAlgebras/README.md:2305–2314`) supplies the truncation cores and the product rule | route checked in the table |
| §1.4 | (3.67), Lemma 3.11, p.101 | `teschl line 4194`, `4199` | supported as written |
| §1.6 | Thm 3.8, Cor 3.9, p.97 | `teschl line 4015`, `4031` | supported as written |
| §2.1 | normality p.91; Problem 3.11 p.99 | `teschl line 3746–3749`, `4090` | supported as written |
| §2.4 | no external locator | the four Tau Ceti cellular declarations resolve | numbers computed in the table |
| §3.2 | (6.27)–(6.28), L6.17 p.145; L6.18, T6.19 p.146 | `teschl line 6256–6263`, `6277`, `6313`, `6321` | supported; the Lean `discreteSpectrum` is Teschl's general definition |
| §4.2 | Thm 2.18, L2.20 p.77; (2.44) in L2.7 p.66 | `teschl line 3170`, `3187`, `2703–2713` | supported as written |
| §4.4 | Thm 2.28 p.83 | `teschl line 3413` | supported as written |
| §4.7 | Thm 2.13 pp.71–72; Thm 2.12 p.70; L2.10 p.68 | `teschl line 2960–2966`, `2914`, `2803` | supported; (2.60) matches the graph characterization |
| §5.3 | FSSS p.424, (C) p.428, Thm 1 p.430 | `flato-simon-snellman-sternheimer line 58–60`, `230–232`, `277–279` | supported; Nelson Lemma 5.1 is uncertified |
| §5.4 | Thm 6.4 p.135; T6.19 p.146; L6.22–6.23 p.148 | `teschl line 5704`, `6321`, `6368`, `6377` | supported as written |
| §5.5 | Kato VII §§1–3, II §6 | none | uncertified; checked in the table |
| §5.7 | L10.1 p.221; T10.2 p.222 | `teschl line 9562`, `9578–9584` | supported; Teschl's bounded part vanishes at infinity, as the README says |
| §6.3 | Thm 4.14, (4.43)–(4.44), p.121 | `teschl line 5134–5156` | supported; the overlines are lost in the extraction (Problem 4.5, `5157`) |

Also checked:
- `teschl` (4.24)–(4.25), p.117 (`4978–4984`), for R01 and §2.5.
- Theorem 8.5, p.179 (`7558`), is three-dimensional, as §5.6 says.
- (9.4) and (9.7), p.182 (`7655–7673`): see Source issues.
- `jones` Exercises 12.1.11(ii) and 12.1.15, pp.86–87 (`jones line 2883–2903`).
- `eckhardt-gesztesy-nichols-teschl`: Hypothesis 2.1 (`227–229`), Theorem 2.2 (`257`), Lemma 2.3 (`268–271`, the correct Lagrange sign) and §11 (contents `55`).

**Library declarations opened at the pins** (manifest pins; file and line).
- Tau Ceti:
  - `LinearPMap.IsResolventAt`, `.unique`, `resolventSet`, `resolvent`, `spectrum` (`Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:65`, `:75`, `:129`, `:169`, `:140`);
  - `smulSub` (`LinearAlgebra/LinearPMap/SmulSub.lean:39`);
  - `exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero`, `norm_smul_sub_sq`, `isClosed_range_smul_sub`, `dense_domain_of_surjective_add_I`, `isSelfAdjoint_of_surjective_addSub` (`Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:122`, `:155`, `:216`, `:365`, `:393`);
  - `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, `spectrum_subset_im_eq_zero`, `IsFormalAdjoint.adjoint_resolvent_eq`, `IsSelfAdjoint.adjoint_resolvent` (`…/LinearPMap/Resolvent.lean:70`, `:76`, `:89`, `:114`);
  - `IsRelativelyBounded` (`Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56`);
  - `add_of_isRelativelyBounded` (`…/LinearPMap/KatoRellich.lean:118`);
  - `IsReducing`, `isSelfAdjoint_restrict` (`…/LinearPMap/Reducing.lean:59`, `:144`);
  - `HasCore.of_graph_subset_closure` (`…/LinearPMap/GraphCore.lean:79`);
  - `analyticAt_resolvent` (`Analysis/Normed/Operator/Resolvent/Analytic.lean:58`);
  - `ProjValMeasure` (`…/ProjValMeasure/Basic.lean:91`), `norm_sq_integral_apply` (`Integral.lean:305`), `polarizedComplexMeasure` (`Polarization.lean:60`), `integral_polarizedComplexMeasure_eq_inner_integral` (`MatrixElement.lean:83`), `integral_map` (`Map.lean:87`), `integral_congr_ae` and `tendsto_integral_apply_filter_of_dominated_convergence` (`DominatedConvergence.lean:69`, `:77`);
  - the complexification instances and lemmas (`Analysis/InnerProductSpace/Complexification.lean:108`, `:136`, `:159`, `:260`, `:282`, `:340`) and `realPoints` (`LinearAlgebra/Complex/Conjugation.lean:128`);
  - `StronglyContinuousGroup` (`Analysis/Semigroups/Group/Basic.lean:74`) and `existsUnique_isUnitary_complexGenerator_eq_I_smul` (`…/Stone/Unbounded.lean:106`);
  - `continuousAt_zero_iff_domain_eq_top` and `continuous_iff_domain_eq_top` (`Analysis/Semigroups/UniformlyContinuous.lean:233`, `:249`);
  - `riemannianVolume` and `eq_riemannianVolume_iff` (`…/VolumeDensity/Volume.lean:82`, `:93`);
  - `finsum_finrank_singularHomology_of_finite_cwComplex`, `cellularSingularHomologyIsoUniv`, `cellularIncidence_zero`, `cellularIncidence_eq_inv_cellLocalClass` (`AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:159`, `Comparison.lean:300`, `EdgeIncidence.lean:58`, `LocalDegree.lean:659`).
- Mathlib:
  - `IsCoercive.continuousLinearEquivOfBilin` (`Analysis/InnerProductSpace/LaxMilgram.lean:105`);
  - `continuousLinearMapOfBilin`, `toDual` (`Dual.lean:193`, `:136`);
  - `InnerProductSpace.rclikeToReal` (`Basic.lean:956`);
  - `banach_steinhaus` (`Normed/Operator/BanachSteinhaus.lean:40`);
  - `ContinuousLinearMap.isPositive_iff_complex` (`Positive.lean:458`);
  - `absolutelyContinuous_iff_withDensity_rnDeriv_eq` (`RadonNikodym.lean:69`);
  - `WithLp` is a structure (`Normed/Lp/WithLp.lean:49`), so e_H is `WithLp.toLp 2`, as §4.7 writes.

**Cross-roadmap citations resolved** (main at 172efce; OperatorKTheory at its open head).
- SelfAdjointSpectralTheory: all 32 ids cited, from SA-A21 (`:151`) to SA-E44 (`:1316`). They are also all present at the head of #1854, the open revision that touches it.
- HilbertModules H6 (`:705–760`, with the unitary criterion and the action `S*(x+u+Uu)=Sx+iu−iUu`) and H7's interval example (`:794–799`, with `α_+=λα_-`).
- VonNeumannAlgebras:
  - V2 (`:625`), V2.RectangularL2 (`:634`);
  - V10.ClosedOperators (`:2249–2290`: the Rudin 13.30 representation, the multiplier form, polar decomposition, and the interval derivatives with spectra ∅, ℂ, `2πiℤ`);
  - V10.Affiliation (`:2305–2314`).
- BanachSpaceTheory B5 `hilbertBasis_lift_mk_eq` and `nonempty_linearIsometryEquiv_iff_lift_mk_eq` (`Suggested.lean:159`, `:165`, also at the head of #1854).
- GeneralizedCohomology G5.5-RealHilbert (`:1939–1965`: the synonym, `J(x+iy)=x−iy`, and `D_C` with `(D_C)†=(D†)_C`).
- PolarDecomposition PD-B23–B34 (`:371–393`); BanachAlgebras Layer 2 §2.1 (`:442`); PDE §§1.1, 1.3, 1.4, 1.6 (`:677`, `:769`, `:803`, `:905`); LieGroups Layers 2 and 5 (`:356`, `:518`); OperatorAlgebraDynamics D8 (`:693`); Completed/OrthogonalL2Bases Parts A and D (`:147`, `:372`).
- OperatorKTheory §8.4 (`README.md:2108–2110`; `essentialSpectrum` at `Suggested.lean:86`, `{μ | ¬(T − μ).IsFredholm}`, namespace `TauCetiRoadmap.OperatorKTheory`).
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord` at `Suggested.lean:297`.

**Ownership and overlaps.**
- The overlap listing reports no pull request changing this roadmap, no dropped id and no id defined only by an open revision; I confirmed all three.
- `roadmaps grep` over main and the open heads finds no second owner of the essential spectrum of a partial operator, Weyl's theorem, the Friedrichs extension, Kato–Rellich, relatively compact perturbations or analytic vectors.
  - OperatorKTheory and ToeplitzOperators use bounded essential spectra, and §3.2 compares them.
  - AutomorphicSpectralTheory, CongruenceSpectralGap, MaassForms and PositiveMass use Friedrichs realizations of their own operators.
- The open consumers cite ids that exist here: QuantumFoundations (UO-A01, A04, A07, A08, B03, E01, F02, F03), NoncompactQuantumSymmetry (B04, B05, E03), AutomorphicSpectralTheory (A01–A02), CongruenceSpectralGap (A01–A03, D06), PositiveMass and RiemannianGeometry (D06, §4.7).
- Not a finding for this folder:
  - VariationalMethods (`README.md:841`, `:862`, `:1063`) and ComplexKahlerGeometry at #1234 (`:1301`) name UO-D06's `closedFormOperator`, which this file does not declare. Its counterpart is `existsUnique_selfAdjoint_of_closed_form`, and those roadmaps should repoint.
  - CongruenceSpectralGap declares `gap:form-rayleigh-core` against this roadmap. That is a consumer's contract, which the intake announces.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.UnboundedOperators`.

**Family index: considered and not held.** `TauCetiRoadmap/OperatorTheory/README.md` is identical to main and does not list this child. Reviews r2–r5 raised that, and r6 set it aside: CONTRIBUTING.md:144, and the gate counted index edits as `outside-folder`. I agree. On a scratch copy:
- adding a list bullet and a prose ownership paragraph leaves the family dependency check at its one problem already on main (`UPWARD: OperatorTheory -> OperatorKTheory`);
- a backticked table row adds `UPWARD: OperatorTheory -> UnboundedOperators`.

The pull-request description describes earlier heads ("eleven intentional admissions", `IntegralCounterexampleTargets.lean`). Nothing in the folder depends on it.

**README form.**
- There are no LaTeX delimiters, no `lemma`, no `set_option`, no pull-request numbers and no machine paths. "removed" occurs only for the removed vertices of the surface.
- Every layer ends with Examples and Dependencies.
- Every Lean name of the file appears in the README.
- Every definition has an API block and three or more Checks, except R05.

## Not verifiable

- **Nelson (1959), Kato (1995) and Weidmann (1987).** All three are settled as uncertified in the manifest and cited by locator or section only. The §2.3 surface, §5.3 and §6.4 uses of Nelson, and the §5.5 branch statements, were checked mathematically in the table.

## Source issues

- **Error** in teschl at (9.4) and (9.7), printed p.182: the source says the Lagrange identity's boundary term is `W_d(g*,f) − W_c(g*,f)` (respectively `W_b − W_a`); it should be `W_c − W_d` (respectively `W_a − W_b`), as f=x², g=1 on (0,1) shows (−2 against +2); affects a stated result.
- **Misprint** in jones at Definition 12.1.13, printed p.87: the source says that for ξ in the adjoint domain one defines T*ξ = η, after naming the domain vector η and its representative σ; it should be T*η = σ; affects nothing.
- **Misprint** in teschl at Theorem 4.14 (proof), printed p.121: the source says the test vector is ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{1,k}; it should be ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{n,k}; affects nothing.
- **Gap** in teschl at Theorem 4.14 (proof), printed p.121: the source says Weyl sequences with (A_j − λ_j)ψ_{j,k} → 0 give (P − λ)ψ_k → 0 for a polynomial of degree N; it should use vectors in the ranges of P_{A_j}((λ_j − 1/k, λ_j + 1/k)), since for N ≥ 2 the first-order condition does not control higher powers; affects the proof.
- **Misprint** in teschl at Lemma 6.22 (proof), printed p.148: the source factors K R_A(λi) as (K R_A(i))((A + i) R_A(λi)) with R_A(z) = (A − z)⁻¹; it should be (A − i) R_A(λi), the two differing by a sign already for A = 0; affects nothing.
