# FIX-RT-SmoothRepresentationsOfLocalGroupsPartII~2: repair of red-team round 2 (passes a and b)

Files changed: `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md`, `packages/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean`, `packages/SmoothRepresentationsOfLocalGroupsPartII/sources.toml`. `design/plan.json` and `metadata.toml` are unchanged (no new supplier gap was needed).

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F01 (P2) — applied

Old: §5.28 stated signatures and the affine/graded comparison only, while the Layer 5 Dependencies, §5.5 and §6.2 pointed to a "generic/sign adapter" that did not exist; §5.5 (all characteristics) consumed §4.3 (characteristic zero). New: §5.28 states two targets, the split adapter (Gelfand–Graev I-fixed module ≅ H(G,I) ⊗_(H(K,I)) sgn, Whittaker dimension = multiplicity of sgn, for every split connected reductive group over every nonarchimedean local field, with ψ_K) and the unramified adapter (same for quasi-split groups split over an unramified extension, with the compatible datum ψ₀ ∘ Tr_(k_a/k) and unequal parameters), each with route, locator (MP21 Theorem 3 with χ = 1 and its characteristic-free depth-zero proof; Luo26 Corollary 5.1–5.2; CS18 uncertified), five Checks and a Needs list; §5.5 and §6.2 now consume these adapters, §4.3 names the adapter as its all-characteristic form, the build-order sentence lists 5.5 and 5.27 as users of 5.28, and the Scope paragraph records ownership. Ownership: `roadmaps grep` finds the Gelfand–Graev representation only as a definition in SmoothRepresentationsOfLocalGroups SR.2.3; no roadmap on main or at an open head states the Iwahori-level identification.

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F02, RT-SmoothRepresentationsOfLocalGroupsPartII~2b/F03 (P1) — applied

Both findings concern the same §4.6 example. Old: "χ = q^ρ … On the ray −mω₂^∨ … = 1 … St … q^(−2m)". New: χ = δ_B^(1/2) = q^(−ρ) in the SRU.5.1 convention; the ray is a_m = (mω₂^∨)(ϖ) ∈ T⁻ = {|α(a)| ≤ 1}; the intermediate exponent gives 1 and the Steinberg exponent δ_B = q^(−2ρ) gives q^(−2m) (1 and ¼ at q = 2, m = 1); on the opposite ray the coefficient is read through the contragredient π_(α₁), whose two exponents give q^(−m). The route sentence "escaping antidominant ray" now names T⁻ explicitly. Both reviewers' repair texts agree with each other and with the recomputation below.

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F03 (P3) — applied

Old: "that of (0, ½, 1) is ¾". New: "is ½, the squared norm of the difference (−½, 0, ½) (the squared norms of the two points are ¾ and 5/4)". Recomputed: (0,½,1) − (½,½,½) = (−½,0,½), squared norm ¼ + 0 + ¼ = ½.

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F04 (P3) — applied

Old: "The trivial representation does not contain st_G and is not generic". New: qualified by positive semisimple rank, plus the split-torus case: U = 1, W = 1, I = K = T(O), st_G = 1_K, every unramified character has π^I ≠ 0, contains st_G and is generic with one-dimensional Whittaker space; ramified characters have π^I = 0 and lie outside the statement. Verified: for 𝔾_m, Hom_U(1,1) = ℂ, st_G = inflation of the trivial representation of 𝔾_m(𝔽_q) (SRU.4.1 torus Check).

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F05 (P1) — applied

Old: §7.10 lists ½h^∨ + ½ Σ εⱼ ω^j_(⌊rⱼ/2⌋) for every orthogonal factor of dimension rⱼ ≥ 3. New: the shift uses the vector direction v_r = ε_(⌊r/2⌋) in the standard orthogonal coordinates of so(r); for r ≥ 5 this is ω_(⌊r/2⌋) of SRU.5.16–5.17, for r = 3 it is ε₁, for r = 4 it is ε₂ = ω₁ + ω₂ of D₂ = A₁ × A₁; the route derives the standard-coordinate condition ⟨εᵢ, ν⟩ ∈ ½ℤ from the standard representation (half-integer sl₂ weights for Sp(2n), integer ones for Spin(n)) and treats r = 3 and r = 4 separately; the Sp(8), (2,2,2,2) example gives the dominant real part (0, ½, ½, 1) with standard weights 0, ±½, ±1, both A₁ pairings ½, and shows that the printed ½ω₂ gives weights ±¼, ±¾. The source misprint is recorded in the statement. The Sp(6) remark now reads ½h^∨ + ½v₃ = ½h^∨ + ½ε₁ = (0, ½, 1).

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F06 (P3) — applied

Old: "(CIK71, Lemma 4.3 and Theorem 4.4, example (b), PDF p. 15; CIK71 line 502)". New: "Lemma 4.3 and Theorem 4.4, printed p. 94, PDF p. 15, and Example 4.6(b), printed p. 95, PDF p. 16; CIK71 lines 502, 514 and 534–556", in the README and in the CIK71 manifest locator. Verified at CIK71 line 502 (Lemma 4.3), 514 (Theorem 4.4), 534 (Examples 4.6), 537 (page-16 marker, printed p. 95), 553 (example (b)).

## RT-SmoothRepresentationsOfLocalGroupsPartII~2a/F07 (P3) — applied

Added a Check to SRU.1.3: the affine group (a,b)(c,d) = (ac, b + ad), a, c > 0, with left Haar measure da db/a², modular function Δ(a,b) = a⁻¹ in BHV's convention ∫ f(xg⁻¹) dμ = Δ(g) ∫ f dμ (BHV line 12095; Lemma A.3.4 at line 12144); for f(½,0) = 1 the stated involution gives f*(2,0) = 2, the inverse convention gives ½, and f** = f because Δ(g⁻¹)Δ(g) = 1. The Check also records that all other Checks of SRU.0–SRU.1 use unimodular groups.

## RT-SmoothRepresentationsOfLocalGroupsPartII~2b/F01 (P1) — applied

Old: `TauCeti.ContRepresentation.IsUnitary` at Suggested.lean lines 78, 90, 168, 185, 186. New: `ContRepresentation.IsUnitary` (the pin's `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` opens `namespace ContRepresentation` at line 29 with no enclosing `TauCeti`; `IsUnitary` is at line 48). The file now elaborates; the `#check` audit below shows `π.IsUnitary` where the elaborated types previously had `sorry`.

## RT-SmoothRepresentationsOfLocalGroupsPartII~2b/F02 (P3) — applied

Old: twelve backticked `TauCeti.ContRepresentation.*` names (supplier bullets at lines 61–66, Needs of 0.1 and 0.4, API bullet of 0.4) and one unbackticked one in the 0.4 API bullet. New: the prefix `TauCeti.` dropped on all thirteen; file paths unchanged. The names with a genuine `TauCeti` namespace (`TauCeti.GL2Steinberg`, `TauCeti.finrank_GL2Steinberg`, `TauCeti.character_GL2Steinberg`, `TauCeti.character_GL2PrincipalSeries_one_one_eq_one_add`, `TauCeti.IsPositiveDefiniteSub`) were checked at the pin (`namespace TauCeti` at Steinberg.lean line 91 and AddGroup.lean line 72) and kept.

## Checks run

Elaboration, from the content checkout, `lake env lean <Suggested.lean>` (Tau Ceti object files for both imported modules were already present, no `lake build` was needed). The file header is the module form (`module`, `public import Mathlib`, `public import TauCeti.…`, docstring, `@[expose] public section` before the namespace), which the worker's build requires; it was changed from plain `import` lines after the worker's check logged the "imports `Mathlib` … consider adding `module`" warning, and nothing else in the file changed (the declarations moved down by four lines):

```text
Suggested.lean:78:8: warning: declaration uses `sorry`
Suggested.lean:90:8: warning: declaration uses `sorry`
Suggested.lean:129:8: warning: declaration uses `sorry`
Suggested.lean:140:8: warning: declaration uses `sorry`
Suggested.lean:153:8: warning: declaration uses `sorry`
Suggested.lean:166:8: warning: declaration uses `sorry`
Suggested.lean:182:8: warning: declaration uses `sorry`
exit=0
```

`#check @name` audit: a scratch copy of the file with `#check @` for all 14 declarations elaborated with exit 0; all 14 types printed, none contains `sorry`, and the five unitarity binders read `π.IsUnitary`, `σ.IsUnitary`, `(π i).IsUnitary`. Each elaborated type was compared with its README statement: no section binder is lost (the theorems carry `[IsTopologicalGroup G]`, `[T2Space G] [LocallyCompactSpace G]`, `[SecondCountableTopology G]` only in `isCompact_positiveTypeSubunit_integrals` and `godement`, `[CompleteSpace]` in the two approximation theorems, as the README states). Nothing changed except the unitarity conjuncts.

Dependency check:

```text
depcheck: 236 roadmaps, 2216 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the new slugs compact-induction, geometric-lemma, iwahori-components, reductive-quotient-of-special-fibre, hyperspecial-vertices, iwasawa-decomposition were also checked by hand in the SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII READMEs).

## Adversarial pass on every statement added or changed

| Statement | Instances tried; values computed on each side | Result; change |
| --- | --- | --- |
| §4.6 ray example | A₂, χ = q^(−ρ), w = s₂s₁: s₁ρ = α₂, s₂α₂ = −α₂, so ρ + wρ = α₁; J(w) = {α₂} since wα₁ = −α₁−α₂ < 0, wα₂ = α₁ > 0. a_m = (mω₂^∨)(ϖ): \|α(a_m)\| = q^(−m⟨α,ω₂^∨⟩) ∈ {1, q^(−m)} ≤ 1, so a_m ∈ T⁻. Unnormalised exponent q^(−⟨α₁, mω₂^∨⟩) = 1; St: q^(−⟨2ρ, mω₂^∨⟩) = q^(−2m) = ¼ at q = 2, m = 1. Other exponent of π_(α₂) (w = s₁): ρ + α₂ = α₁ + 2α₂, value q^(−2m). Contragredient: (w₀ψ)^(−1) = (w₀ww₀)χ, w₀s₂s₁w₀ = s₁s₂ with J = {α₁}; ρ + s₁s₂ρ = α₂ and ρ + s₂ρ = 2α₁ + α₂ give q^(−m) twice at a_m. Trivial representation control: exponent δ_B^(−1/2), unnormalised value 1 on all of T, matching the constant coefficient. | passes; text replaced |
| Convention q^ρ = δ_B^(−1/2) | PGL₂, λ^∨ = ω^∨, δ_B(ω^∨(ϖ)) = \|ϖ\|^(⟨α,ω^∨⟩) = q^(−1); q^ρ(ω^∨(ϖ)) = q^(⟨ρ,ω^∨⟩) = q^(1/2) = δ_B^(−1/2) | agrees with Conventions line and §5.1; §4.6 corrected to q^(−ρ) |
| §7.9 squared distance | (0,½,1) − (½,½,½) = (−½,0,½): ½; norms ¾ and 5/4 unchanged; Weyl non-conjugacy still follows from the norms | passes; ¾ → ½ |
| §7.10 vector direction | Sp(8), (2⁴): weights of ℂ⁸ restricted to so(4) × sl₂ are ±εᵢ ± ½; ν = ½ε₂ gives {±½, ±½, 1, 0, 0, −1} → (0,½,½,1); A₁ pairings ⟨ε₁ ± ε₂, ½ε₂⟩ = ±½, modulus ½ < 1. ν = ½ω₂ = ¼(−ε₁+ε₂) gives ∓¼ ± ½ ∈ {±¼, ±¾} ∉ ½ℤ. Sp(6), (2³): so(3), ν = ½ε₁: weights ±½ ± ½ and 0 ± ½ → (0,½,1), the printed Remark 8.6. D₂ half-integral points with \|ν₁ ± ν₂\| < 1: (0,0), (±½,0), (0,±½); (½,½) fails (sum = 1); W(D₂) = {±id, ±swap} makes the nonzero ones one orbit. Spin(n): sl₂ weights of an odd-dimensional module are integers, so ±εᵢ(ν) + ℤ ∈ ½ℤ iff εᵢ(ν) ∈ ½ℤ, same condition. r ≥ 5: ω_(⌊r/2⌋) = ε_(⌊r/2⌋) in SRU.5.16 (ωₙ = εₙ) and SRU.5.17 (ωᵢ = εᵢ + ⋯ + εₙ for i ≥ 3). r = 2: so(2) has no roots and is excluded by r ≥ 3, and its split dual torus has no nonzero generic unitary real parameter. | passes; lists and route rewritten |
| §4.3 torus Check | 𝔾_m: U = 1, W = 1, st = 1_K; trivial representation: contains st once, Hom_U(1,1) = ℂ (dimension 1), π^I = π ≠ 0; ramified character: π^I = 0. GL₂ (semisimple rank 1): trivial representation is 1-dimensional, st_G has dimension q ≥ 2, so not contained; Hom_U(1, ψ) = 0 for nontrivial ψ | passes; Check qualified |
| §1.3 affine-group Check | (a,b)(c,d) = (ac, b + ad); left translation by (c,d) has Jacobian c² and preserves da db/a²; right translation by (c,d) has Jacobian c and multiplies the measure by 1/c, so Δ(c,d) = 1/c in BHV's convention μ(Eg) = Δ(g)μ(E). g = (2,0), g⁻¹ = (½,0), Δ(g⁻¹) = 2: f*(2,0) = 2; alternative Δ(g) = ½: value ½; f** = Δ(g⁻¹)Δ(g) f = f | passes; Check added |
| Split adapter: well-definedness of the generator | I = preimage of B(𝔽_q): U ∩ I = U(O); w₀ I w₀⁻¹ = preimage of B⁻(𝔽_q); U ∩ that = U(𝔭) = U ∩ K⁺; ψ_K factors through ∏ x_α(F) and is trivial on x_α(𝔭) | passes |
| Split adapter: sign eigenvalue at q = 2 | Σ_(u∈𝔽₂) ψ₀(u) = 1 + (−1) = 0; T_s has eigenvalues q = 2 and −1 on H(W,q), distinct | passes; Check added |
| Split adapter: Whittaker dimension formula | torus: ℂ[ℤ] free rank one, dimension 1 = multiplicity of sgn = triv in ℂ. GL₂: 1 ↦ T_s = q, multiplicity 0, Hom_U(1,ψ) = 0; St ↦ sgn, 1; irreducible unramified principal series ↦ regular H(W,q), sgn once, generic; SL₂(ℚ₃) quadratic spherical constituent: T_s = 3, multiplicity 0 for ψ_K though generic for conductor ℤ₃. Bound ≤ 1: π^I ⊆ subquotient of X(χ)^I ≅ H(W,q), sgn once. Duality: T_w ↦ T_(w⁻¹) sends sgn(T_s) = −1 to −1 | passes |
| Unramified adapter: datum | SU₃ unramified, U_a/U_(2a) ≅ k', ψ₀ ∘ Tr: Tr(O') = O so nontrivial on O', Tr(𝔭') ⊆ 𝔭 so trivial on 𝔭'; at the hyperspecial vertex U_a ∩ K = {x ∈ O', y ∈ O'} maps onto O'/𝔭' = 𝔽_(q²) ≠ 0 in U_a/U_(2a) (non-central reduction). Conductor-𝔭 datum: trivial on O', not generic on the reduction | passes; Check added |
| Unramified adapter: Bernstein subalgebra | T = Z_G(A) is a torus for quasi-split G; I ∩ T(k) is the connected parahoric; Ω = T(k)/(I ∩ T(k)) abelian; for split T it is X_*(T) | passes |
| Build-order sentence | 5.28's Needs cite SRU.2, SR.1.5, SR.3.4, RG2.3–RG2.5, ReductiveGroups Layer 7, LieHighestWeight only; 5.5, 5.27 cite 5.28; no edge from 5.28 to Layer 4 or to 5.5/5.27 | acyclic |
| Lean rename | `ContRepresentation.IsUnitary π` for `π : ContRepresentation ℂ G H`: pin signature `def IsUnitary (π : ContRepresentation 𝕜 G V) : Prop` (line 48), elaborates | passes |

## Sources

Three manifest keys added through the sources service: `MP21` (arXiv 2010.13341v3, certified; its Theorem 3 with χ = 1 and §6.2 proof, which states that no restriction on the characteristic of F or on q is imposed), `Luo26` (arXiv 2607.17163v2, certified; stated for finite extensions of ℚ_p, used for the unramified adapter and its genericity criterion), `CS18` (Chan–Savin, Math. Z. 288, resolves only to a paywalled page; recorded uncertified and cited by its locator Theorem 1.1). No `needs-references.toml` was written: nothing needed is unreadable. The CIK71 locator was corrected in the manifest. The settled uncertified and waived keys are untouched.

Source issues noticed this round: CH26 Theorem 8.5(1)–(2), printed pp. 28–29 (CH26 lines 1369 and 1380), print the fundamental coweight ω_(⌊r/2⌋) for every orthogonal factor of dimension r ≥ 3; for r = 4 that is a spin-type weight of D₂ whose half-shift is not geometric (Sp(8), (2,2,2,2) gives standard weights ±¼, ±¾); the vector direction ε₂ = ω₁ + ω₂ is what the proof's standard-representation argument produces. Luo26 line 17 states its hypotheses for finite extensions of ℚ_p; the package's target asks for every nonarchimedean local field and says so.

## For the maintainer

- No name cited by other roadmaps changed. The Lean declarations keep their names; only the unitarity predicate they mention was renamed to the pin's `ContRepresentation.IsUnitary`.
- §5.5's Needs now cite SRU.5.28 instead of SRU.4.3, so Layer 5 no longer depends on Layer 4 through genericity; §4.3 keeps its characteristic-zero statement for the Gan–Savin isolation argument and names the adapter as its all-characteristic form.
- Ownership against open pull requests was checked with `roadmaps grep` over main and the indexed open heads (455 pull requests) for the Gelfand–Graev module; the sibling checkouts named in the brief were not read beyond that index.
- The `raikov` regularity remark in the reviews' "Not verifiable" sections was not a finding and was left as is.
