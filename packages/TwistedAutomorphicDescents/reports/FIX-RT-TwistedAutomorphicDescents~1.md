# FIX-RT-TwistedAutomorphicDescents~1

The two reviews reuse finding identifiers. The sections under "Review r1a" concern r1a (F01–F08); those under "Review r1b" concern r1b (F01–F04). r1a/F03 and r1b/F02 are the same claim and are settled once, under r1a/F03; r1b/F02 points to that section. No finding is disputed.

# Review r1a

## F01 (P1) — applied

§1.1 claimed convergence when "at least one" input is cuspidal. Witness confirmed: V=H⊥<1>, W=H, index 0, f=g=1 gives ∫_(F^×\A^×)dt/t=∞. The proof JZ2020 offers (line 1135–1140) covers only a cuspidal ambient form. Old → new: ordinary periods are now defined only where the integral converges absolutely, with two convergent cases: (i) the ambient form is cuspidal; (ii) the stabilizer form is cuspidal and the stabilizer has trivial F-split centre. A new **regularized split-torus Bessel period** target (truncation plus continued exponent corrections, four computed Checks) covers split SO₂. gap:bessel-restriction-growth now asks for the two convergence cases, the split-torus expansion and the regularization, with no blanket convergence. The same change is made in §2.1 (statement, route, a new Check), §2.4, §4.1 (output transport) and §4.6. The periods in §§1.5, 4.7, 6.4 and 7.2 have a cuspidal ambient input (case (i)) and need no change.

## F02 (P1) — applied

The order-r ⇔ τ≅φ_(π′)∨ claim in §4.1 omitted the equal-rank condition. The reviewer's cubic-character witness has the non-discrete parameter χ⊞χ⁻¹, so it falls outside the generic-discrete hypothesis now stated. The defect remains for discrete parameters: on split SO₅ with φ_(π′)=μ₁⊞μ₂ and τ=μ₁, the pole order is 1=r while the degrees are 2≠4. New text: π′ has a generic discrete parameter; the pole order equals #{i : τ_i∨ occurs in φ_(π′)}; when a=N, order r ⇔ τ≅φ_(π′)∨. The SO₅ example is added as a Check. "a=N" is now cited where the transport is used, in the Proposition 5.4 paragraph of §4.1 and in §4.5; §4.6, §4.7 and §7.2 already assume a=N.

## F03 (P2) — applied

This is also pass b F02. Old → new: "a=N≥2" becomes "a=N≥1". New sentences: in the orthogonal branches a is even and at least 2; a=1 occurs only for U₁ with W=0, where p=p¹=[1,1]. The coincidence Check now lists both cases (odd-SO H_W at a=2; unitary at a=1). A new Check covers the positive-rank U₁ boundary: the [1,1] coefficient of ξ∘det is ξ≠0. The consumers in §§6.2–6.4 inherit the definition.

## F04 (P3) — applied

JZ2020 line 422 is basis (2.1) and line 434 is matrix (2.2), both on p.749. Line 2310 lies in the remarks on Theorem 5.7, and §6.1 begins at line 2353 (p.792). The Conventions now cite "ordered basis (2.1) and Gram matrix (2.2), §2.1, p.749, line 422, line 434", and line 2310 becomes line 2353. The same citation pattern in §0.4 ("basis and form normalization of (2.1)") becomes "basis (2.1) and Gram matrix (2.2)".

## F05 (P1) — applied

The witness is correct: the stabilizer of a complete flag has Levi (Res GL₁)^j×Isom, not GL_j×Isom. §0.1 now distinguishes the subspace parabolic (Levi GL_j×Isom) from the complete-flag parabolic (Levi GL₁^j×Isom), says they coincide for j≤1, and says N_j is the unipotent radical of the complete-flag parabolic (JZ2020 line 454, line 814). The datum API names the complete-flag parabolic. A new SO₇ Check computes Levi dimensions 5 against 7. §2.1 describes P_a as the subspace parabolic; §2.3 names "P_a and the complete-flag parabolic of index ℓ".

## F06 (P1) — applied

Confirmed. GGP2012 line 2480–2483 needs the induction of τ⊗π_W to be irreducible for an arbitrary irreducible π_W, using Waldspurger's result. The generic-irreducibility theorem of SmoothRepresentationsOfLocalGroups SR.3.1 (supplier README, under "Generic irreducibility of induced representations") covers only cuspidal inducing data. A new gap:orthogonal-auxiliary-induction (supplier SmoothRepresentationsOfLocalGroups, section "SR.3.1, generic-irreducibility") is recorded in the README and in the plan's `gaps`. It is consumed in §1.4 (route, Needs) and in the Layer 1 Dependencies. A new Check contrasts the cuspidal GL₂×SO₀ datum with the non-cuspidal GL₂×SO₃ principal series.

## F07 (P2) — applied

Confirmed: local uniqueness modulo outer conjugation, place by place, allows 2^S mixed choices of outer labels. ModularityAndLanglandsExtensions keeps only outer orbits for even SO; its line "even-SO outer orbits need further data to select members" says so. Repair:
- New gap:oriented-even-orthogonal-packets to ModularityAndLanglandsExtensions §§3.13, 3.15 and 3.17: oriented local packets, with every member of an outer-stable packet outer-fixed, and every discrete member lying in one of the two coherent oriented global packets.
- The §7.2 local proposition is now exact uniqueness in the oriented packet, with no quotient by outer conjugation, and it is assumed for both orientations.
- The proof route now passes through the coherent orientation.
- A new Check counts four local tuples against two coherent ones.

## F08 (P3) — applied

The 15 listed bullets are deleted. Each restated a definition or a proof step and evaluated no instance. Every affected definition keeps at least three Checks: §0.2 4, §0.4 3, §0.5 3, §0.6 4, §1.2 4, §3.1 4, §3.3 6, §4.2 4, §5.3 3, §6.3 3, §7.2 3 (with the new r1a/F07 Check), §7.5 3. The §7.2 negative control is added as described under r1a/F07.

# Review r1b

## F01 (P3) — applied

At the GanGrossPrasadUnitaryGroups head, §3.7 is the nonarchimedean tempered theorem and §3.9 the real one. Scope now reads "§§3.7 and 3.9 supply the nonarchimedean and the real tempered theorems". The GanGrossPrasadUnitaryGroups supplier contract reads "nonarchimedean in §3.7 and real in §3.9". The §7.2 Needs line and the Layer 7 Dependencies now read "§§3.7, 3.9 and 3.11".

## F02 (P3) — applied

Same claim as r1a/F03; settled there.

## F03 (P3) — applied

Both primary texts were fetched through the sources service and recorded as certified open-repository copies in `sources.toml`. Waldspurger2012, Théorème 1 (Waldspurger2012 line 44, p.313): p-adic SO in codimension one. SunZhu2012, Theorem B (SunZhu2012 line 66, PDF p.2): SO(p,q+1)⊃SO(p,q) and SO_(n+1)(C)⊃SO_n(C). They are cited in the §1.4 statement and route "as collected in GGP2012 Theorem 14.1(i)", and both are added to the References.

## F04 (P3) — applied

§5.9 Needs gains §4.1 (output transport). §5.5 Needs gains §1.3 (tower calculation), replacing a duplicated §5.2. §7.2 Needs gains §4.1, §1.4 and §5.6. The Layer 5 and Layer 7 Dependencies are updated to match. All added edges point to earlier sections.

# Checks and notes

## Checks run

- `lake env lean packages/TwistedAutomorphicDescents/Suggested.lean` (from the content checkout): exit 0, no output. Suggested.lean is unchanged and declares nothing, so the `#check @name` signature audit has nothing to compare; no elaborated type changed.
- Dependency check: `depcheck: 56 roadmaps, 650 edges, 0 problem(s)` (exit 0). There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no unresolved citations and no Lean names found nowhere.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §1.1 convergence case (ii) | split SO₂, f=g=1 | ∫dt/t=∞ | excluded from case (ii) (split centre); target restated |
| §1.1 case (ii) domain | U₁ stabilizer; SO(W), dim W≥3; SO(hyperbolic plane) | centre U₁ anisotropic; finite centre; G_m split | only the last is excluded, as stated |
| §1.1 case (i) | SO₃ ⊃ split torus, f cuspidal | Hecke integral ∫f(diag(t,1))χ(t)d^×t converges (cusp-form decay at t→0,∞) | consistent with JZ2020 line 1139 |
| Regularized period, λ=0 | Φ=1 | exponent 0 → undefined; ordinary ∞ | neither assigns a value (Check) |
| Regularized period, agreement | Φ=min(t,1/t), T=1 | corrections 1+1=2 = ordinary 2 | agrees (Check) |
| Regularized period, T-independence | Φ=t^(1/2) | 2T^(1/2)−2T^(1/2)=0; naive 2T^(1/2) | independent of T (Check) |
| Regularized period, characters | g nontrivial on [H]^1, constant coefficients | fibre averages of the exponent terms are 0 | ∫Φ dt/t converges (Check) |
| §4.1 self-pair order | SO₅, φ=μ₁⊞μ₂, τ=μ₁ | order 1=r; degrees 2≠4 | equality needs a=N (Check) |
| §4.1 self-pair order, a=N | U₁, φ_π′=χ, τ=χ⁻¹ | weight χ⁻¹χ=1, order 1, degrees 1=1 | τ≅φ_π′∨ holds |
| §4.1 multiplicity-free hypothesis | hypothetical φ containing τ₁∨ twice | order 2>r=1 | excluded by the generic discrete parameter |
| §6.1 a=1 | U₁, m=0 | p=(1,1), p¹=(1,1^1), total 2=2a+m; k₀=0, p₀(2)=[1,1] | consistent |
| §6.1 coincidences | even-SO H_W: 2 vs a+2 parts; odd-SO H_W: 3 vs a+1; unitary: 2 vs a+1 | equal only at a=2 (odd-SO H_W) and a=1 (unitary) | Check updated |
| §6.1 orthogonal a | m even: a=d−1, d odd ≥3 → a≥2; m odd: a=d even ≥2 | — | a=1 is impossible there |
| §0.1 Levis | SO₇, j=2; j=1 | 5 vs 7; both GL₁×SO₅ | Check added |
| r1a/F06 gap scope | W=0, j=1; dim W=3 with principal series | cuspidal datum; non-cuspidal datum | gap needed only in the second case (Check) |
| §7.2 orientation | two places, nonfixed | 4 local tuples vs 2 coherent | Check added |
| §7.2 outer-stable local parameter | φ_v ε-stable | oriented packet ε-stable, members ε-fixed (part of the gap) | no information lost |
| §7.2 outer involution vs local Hom | even V, odd W, ε=−1_W | det(ε)=(−1)^m=−1; fixes σ and ψ | exact uniqueness modulo nothing is impossible without orientation; hence the oriented packets |

## Ownership and suppliers

- gap:orthogonal-auxiliary-induction → SmoothRepresentationsOfLocalGroups (earlier in the merge order). Its generic-irreducibility statement covers cuspidal data only, so the gap is the minimal extension.
- gap:oriented-even-orthogonal-packets → ModularityAndLanglandsExtensions (earlier). Its §§3.13, 3.15 and 3.17 keep outer orbits for even SO.
- gap:bessel-restriction-growth: same supplier (AutomorphicFormsOnReductiveGroups §§4.1–4.2); its `needs` is amended in both the README and the plan.
- Ownership against open pull requests was checked through `roadmaps show` for SmoothRepresentationsOfLocalGroups and ModularityAndLanglandsExtensions, and through the GanGrossPrasadUnitaryGroups head and board package. No other roadmap states orientation-refined even-SO packets or the regularized split-torus Bessel period.

## Notes for the maintainer

- No Lean names changed, since there are no declarations. No name cited by another roadmap changed.
- The section citation of GanGrossPrasadUnitaryGroups is now §§3.7, 3.9 and 3.11. Its consumer note already lists §§3.7 and 3.9.
- Two new supplier requests: SmoothRepresentationsOfLocalGroups (orthogonal auxiliary induction) and ModularityAndLanglandsExtensions (oriented even-SO packets).
- Source issue for the record (the plan's `sourceIssues` is outside this job's edit scope): JZ2020 line 1135 asserts convergence when either input is cuspidal; this fails for a split SO₂ stabilizer with a non-cuspidal ambient form.
- Other edits: `sources.toml` gained Waldspurger2012 and SunZhu2012, and the sources service reordered some `version_note` fields of existing entries without changing their values.
- No text was requested in `needs-references.toml`; every cited source was read.
