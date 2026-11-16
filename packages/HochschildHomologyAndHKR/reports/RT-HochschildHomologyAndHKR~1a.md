<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6907268415 -->
Red team round 1 pass a (claude) of 713ca6a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.2's proof route consumes a brace relation that DGAInfinity does not state

   **Location.** `packages/HochschildHomologyAndHKR/README.md:685-691` ("Assumed: … the multiple
   brace obeys the same rule, and the brace relation `(F{G}){H} − F{G{H}} = F{G,H} + (−1)^{|G||H|}
   F{H,G}` holds"), `:694-704` (Layer 8: "the cup product as the multiple brace `m{F,G}`"),
   `:1764-1768` (§6.2 route) and `:1778-1780` (§6.2 `*Needs:*`).

   **Claim.** The route of §6.2 (Gerstenhaber's homotopy formula, on which the headline
   `cupProduct_graded_comm`, §7.5 and §8.5 rest) takes the brace relation with the multiple brace,
   and the identification of the cup product with `m{F,G}`, from DGAInfinity Layers 0 and 8.

   **Witness.** `TauCetiRoadmap/DGAInfinity/README.md:269-271` (Layer 0) states only "substitution/brace
   operations, and the exact Koszul sign for substituting a degree-`q` operation after the first `r`
   inputs"; `:522-524` (Layer 8) lists "cup product, braces, Gerstenhaber bracket". A search of that
   README for `F{G,H}` and for "brace relation" returns nothing. The README itself says (`:1767`) that
   the multiple brace is not at the pin. So the input is neither a target here, nor a statement of the
   named supplier, nor pinned, nor a declared gap.

   **Repair.** The formula has a direct proof that needs no brace calculus; make it the route and keep
   the transport as a comparison. I checked the cases `(p,q) = (1,1)`, `(1,0)`, `(0,1)` by expansion
   (table below), so the displayed identity is the right one.

   1. In §6.2 replace the passage from "One route transports the brace relation" up to "descends to
      cohomology." by:

      > One route is the direct computation of Ger63 §7: evaluate `δf ∘ g`, `δ(f ∘ g)` and `f ∘ δg` on
      > `(a₁,…,a_{p+q})` with the coboundary and the composition of the conventions; the terms in which
      > a product `a_j a_{j+1}` lies inside `g`, outside `g`, or joins `g` to a neighbouring argument
      > cancel in pairs with the displayed signs, and the terms that remain are `g ∪ f` and
      > `(−1)^{pq} f ∪ g`. This uses §§1.2 and 5.1 only. Comparison, not an input: under §6.1's
      > dictionary the identity is the image of a relation between `[m, −]`, the single brace and a
      > two-argument brace `m{F,G}`; the pin supplies `[m, F] = m{F} − (−1)^{|F|} F{m}`
      > (`TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub`), the pre-Lie identity
      > `TauCeti.ReducedTensorWords.brace_brace_sub_smul_brace_brace` and the Leibniz rule
      > `TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket`, which is the
      > antisymmetrisation of the displayed identity in `(f,g)` and the reason the bracket of §6.1
      > descends to cohomology.

   2. Replace §6.2's `*Needs:*` by: `§§1.2, 5.1, 5.2; Mathlib finCongr; for the comparison with the
      pinned Leibniz rule only, §6.1 and Tau Ceti
      TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub,
      TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket,
      TauCeti.ReducedTensorWords.brace_brace_sub_smul_brace_brace.`

   3. In "From TauCetiRoadmap.DGAInfinity", Layer 0 bullet, replace "the multiple brace obeys the same
      rule, and the brace relation … holds; its antisymmetrisation in `(G,H)` is the pinned pre-Lie
      identity `…`" by "No brace relation with a multiple brace is consumed: §6.2 proves Gerstenhaber's
      formula directly." In the Layer 8 bullet and in §6.1, mark the clause
      `Θ(f ∪ g) = (−1)^{p(q−1)} m{Θf, Θg}` and the arity-zero clauses as holding "for Layer 8's cup
      product and arity-zero cochains once Layer 8 defines them by the Koszul rule of its conventions",
      and add to §6.1 the sentence "No later section uses these clauses." (§§6.2, 7.5 and 8 then do
      not.) Update the Layer 6 "Dependencies" paragraph and "How to read the build" to match.

   Alternative, if the authors prefer the transport route: declare a second gap
   (`gap:brace-relation`, supplier DGAInfinity Layer 0, needs: "the multiple brace `F{G,H}` of
   homogeneous maps on the reduced tensor coalgebra, with the relation
   `(F{G}){H} − F{G{H}} = F{G,H} + (−1)^{|G||H|} F{H,G}`") in `design/plan.json` and under the
   DGAInfinity contract. The direct route is cheaper and removes the dependency.

2. **F02** (P3) §5.3 leaves `s(0,q)` unpinned although the pin fixes it

   **Location.** `README.md:1623-1625`: "`s(p,q) ∈ {±1}` is a sign depending only on `p` and `q`,
   fixed by Mathlib's shift conventions for `Abelian.Ext`, with `s(p,0) = 1`".

   **Claim.** Only the boundary value `s(p,0) = 1` is stated, and §5.4 has no Check at `p = 0`, `q ≥ 1`.

   **Witness.** `CategoryTheory.ProjectiveResolution.mk₀_comp_extMk`
   (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:255`) reads
   `(Ext.mk₀ g).comp (R.extMk f) = R'.extMk (φ.hom.f n ≫ f)` with no sign, so `s(0,q) = 1`. For
   `p = 0`, `f = x` central: `f̃_i = a₀x ⊗ a₁ ⊗ ⋯` is a morphism of resolutions over `· x`, and
   `f̃_q ≫ g ↔ x ∪ g` with `(−1)^{0·q} = 1`.

   **Repair.** In §5.3 write "with `s(p,0) = 1` and `s(0,q) = 1`" and, after the sentence on
   `mk₀_comp_extMk`, add "which gives `s(0,q) = 1`". Add to §5.4 Checks:

   > - For `p = 0`, `f` is a central element `x`, the family `f̃_i` is multiplication by `x` on
   >   `B_i(A)`, a morphism of resolutions over `· x : A → A`, and the identity reads
   >   `θ_q[x ∪ g] = Ext.comp (mk₀ (· x)) (θ_q[g])`, the case of
   >   `CategoryTheory.ProjectiveResolution.mk₀_comp_extMk`: `s(0,q) = 1`.

3. **F03** (P3) process wording in "Downstream consumers"

   **Location.** `README.md:2348-2349`: "No roadmap later in the merge order imports this one. The
   roadmaps that use Hochschild theory are earlier and import DGAInfinity Layer 8 directly".

   **Claim / witness.** "merge order", "later", "earlier" describe the project's pipeline, not the
   mathematics; the repository's `README.md:281` asks that a roadmap not show its review process.

   **Repair.** "No other roadmap imports this one. The roadmaps that use Hochschild theory import
   DGAInfinity Layer 8 directly: KTheoryFiniteLocalFields §4.0 and …" (the rest unchanged).

4. **F04** (P3) §8 works in `R ⊗[k] R`, §§4.4–4.5 in `ModuleCat (R ⊗[k] Rᵐᵒᵖ)`

   **Location.** `README.md:2147`: "`t_i = X_i ⊗ 1 − 1 ⊗ X_i` of `Rᵉ = R ⊗[k] R`"; `README.md:245`:
   "`Aᵉ = A ⊗[k] Aᵐᵒᵖ`"; `README.md:2178`: "a projective resolution of `R` in `ModuleCat Rᵉ`".

   **Claim.** §8.2 feeds its resolution to `Tor` of §4.5 and `Ext` of §4.4, which live over
   `A ⊗[k] Aᵐᵒᵖ`; §8.1 proves weak regularity in a different ring, and no target transports it.

   **Witness.** `Suggested.lean:142` takes `Ext` in `ModuleCat (A ⊗[k] Aᵐᵒᵖ)`; for `A = R` this is
   `R ⊗[k] Rᵐᵒᵖ`, not `R ⊗[k] R`. The pinned `AlgEquiv.toOpposite`
   (`Mathlib/Algebra/Algebra/Opposite.lean:200`) gives `R ≃ₐ[k] Rᵐᵒᵖ` for commutative `R`.

   **Repair.** In §8.1 write: "the elements `t_i = X_i ⊗ 1 − 1 ⊗ op X_i` of `Rᵉ = R ⊗[k] Rᵐᵒᵖ` …",
   and in the route: "`Rᵉ ≅ R ⊗[k] R` by `AlgEquiv.toOpposite` on the second factor (`R` is
   commutative), and `R ⊗[k] R ≅ MvPolynomial (Fin m) R` …; both steps are ring isomorphisms, and
   `LinearEquiv.isWeaklyRegular_congr'` transports weak regularity along their composite." Add
   `AlgEquiv.toOpposite` to §8.1's `*Needs:*` and to "From Mathlib"; in §4.1's Check write "`Rᵉ ≅ R ⊗ R`
   through `AlgEquiv.toOpposite`".

One P2 finding (R01) and three P3 findings (R02–R04). No statement of `Suggested.lean` and no
README target or Check was found false. The declared gap `gap:smooth-hkr-antisymmetrisation` is
precise, minimal and declared under the same slug in `design/plan.json` and in the README; it is
not raised.

## The adversarial pass: values computed

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions `b`, `δ` | `Mat₂`, `(E₁₂,E₂₁)`; `m=E₁₁,a=E₁₂,b=E₂₂` | `b = E₁₁−E₂₂`; variant `δδm = 2(mab−amb) = 2E₁₂` | holds |
| §1.1 `A=M=k` | `n=0,1,2` | `b₁=0`, `b₂=1`; `HH₀=k`, `HH₁=k/k=0` | holds |
| §1.2 `A=M=k` | `n=0,1,2` | `δ⁰=0`, `δ¹=1`, `δ²=0`; `HH⁰=k`, `HH^{≥1}=0` | holds |
| §1.5 | `k[x]`, `Mat₂` | `b(1⊗x⊗1)=x⊗1` vs `1⊗x`; `E₁₁−E₂₂` vs `E₁₁` | holds |
| §2.1 | `b(m⊗1⊗1)`; `b(1⊗x⊗x)` | `m⊗1`; `2x⊗x−1⊗x²` | holds |
| §2.2 | `g(1)=1`; `φ(a₀,a₁)=(a₀∂a₁)(0)` | `δg(1,1)=1`; `bφ=0`; `ψ(ab)=a·ψ(b)+ψ(a)·b`; `ψ′(1)(x)=1` | holds |
| §3.1–3.3 | `Mat₂` | `[E_{ij},E_{jj}]=E_{ij}`; `δE₁₁(E₁₂)=−E₁₂`; `innerDerivation E₁₁ (E₁₂)=E₁₂` | holds |
| §3.4, `homology_one_linearEquiv_kaehler` | `k[x]/(x²)` over `𝔽₂`, `ℚ`; `k=ℤ,R=𝔽_p`; `k=0`; `R=k` | dims `2`, `1`; `b₂=1` so `HH₁=0=Ω¹`; both `0`; `[1⊗x²]=2[x⊗x]` | holds |
| §3.5 | unit; `f(x,x)=1` on `k[x]/(x²)`; `f(x,x²)=1` on `k[x]`; `f=δg` | `(1,u)(a,m)`: `u=−f(1,1)`; `t²=(0,1)`, `t³=0`; `δf(x,x,x)=1`, `(x³,0)≠(x³,1)`; `f(1,x)=x`; twist by `g` gives `f−δg` | holds |
| §3.6 | `ℤ/4→𝔽₂`; `HH²(k,M)`; `∂_x∪∂_y` | `δ¹=1` so `HH²(𝔽₂,𝔽₂)=0`, no `ℤ`-section; `B²=M=Z²`; `f(x,y)=1≠0=f(y,x)` | holds |
| §4.1–4.2 | `Mat₂`; `B₀`, `B₁`; `A=k` | `E₁₂E₂₂E₂₁=E₁₁`, `E₂₁E₂₂E₁₂=0`; `hμ+b′h=id`, `b′h+hb′=id`; `…→k→¹k→⁰k→k→0` exact | holds |
| §4.4, `nonempty_linearEquiv_ext` | `A=k=M=ℤ`; `n=0`; `k=0` | `Z¹=0=Ext¹`; `M^A=Hom_{Aᵉ}(A,M)`; both `0` | holds |
| §4.5 | `ℤ[x]/(px)`, `M=𝔽_p`; `ℚ[x]/ℤ`; `ℤ/6`; `Mat₂` right action | `Ann(x−y)=pℤ`, `Ann(p)=(x,y)`, `Tor₂=𝔽_p`, `HH₂=0`; `ℚ[x],ℚ[x],0`; `3·ℤ/6≅ℤ/2`; `E₂₂` vs `E₁₁` | holds |
| §5.1–5.2 | `k[x,y]`; `Mat₂` reversed product; `f,g∈C¹` | `1`, `0`; defect `E₁₁−E₂₂`; `δ(f∪g)=δf∪g−f∪δg` | holds |
| §5.4 | `p=1` unsigned lift; `q=0`; `p=0` | `F_{i−1}b′=(−1)^p b′F_i`; `s(p,0)=1`; `s(0,q)=1` (R02) | holds, R02 |
| §6.1 dictionary | `n=0,1,2`; `f(a,b)=a∂b` | signs `−,+,−`; `δf=ab∂c`, model `2a(∂b)c−ab∂c`, at `(1,x,1)`: `0` vs `2` | holds |
| §6.2, `cupProduct_graded_comm` | `(1,1)`, `(1,0)`, `(0,1)`, `(0,0)`; `k[x]` | `g(a)f(b)+f(a)g(b)`; `yf(a)−f(a)y`; `g(a)x−xg(a)`; `yx−xy=0∈B⁰` (cocycles central); `−δ(∂^{[2]})(x,x)=1`; antisymmetrised form `δ{f,g}={f,δg}−(−1)^q{δf,g}` | holds |
| §6.4 | cycle condition; `π∘ε`; `k[x]/(x²)`; `𝔽_p/ℤ` | first term of `σ` cancels last of its shift, sign `(−1)^n(−1)^{n−1}`; `n!`; `Ω²=0≠HH₂`; all `0` | holds |
| §7.1–7.2 | non-symmetric `k`; `ℚ[x]/(x²)`, `𝔽₂[x]/(x²)`; `𝔽_p/ℤ` | `δm(x)=m≠0`; `HH₁=ℚ`, `HH₂=xR`, `h₂=0` between copies of `ℚ`; all `R`; `δ^i=0,1` | holds |
| §7.3 | `P=R²`, `P=0`, `R^{(ℕ)}` | `1`, `−1`; `⋀⁰=R`; infinite-rank form | holds |
| §7.5, `detCochain`, `cupDerivations`, `detCochain_sub_factorial_smul_cupDerivations_mem` | `n=0,1,2`; `𝔽₂[x,y]` | `1−1=0∈B⁰`; `D−D=0`; `δ(D₁D₂)(a,b)=−(D₁aD₂b+D₂aD₁b)`; matrix `M i j = D_j(r_i)` | holds |
| §7.6, `cohomological_hkr_hom_kaehler`, `cohomological_hkr` | `n=0`; `k=0`; `𝔽₂[x,y]`; `ℤ[1/2]`; `𝔽₂(u)[a]/(a²−u)`; `k[x]`, `D∪D` | `e[m](1)=m`; `0`; pairing `1`, `[⟨⟩]=0`; all `0`; `Rᵉ=R[ε]/ε²`, `HH²=R≠0=T²`; `[∂∪∂]=0`; values on `r·D₁∧⋯∧D_n` span `⋀ⁿ` | holds |
| §8.1–8.3 | `m=0,1,2`; `k[x]/(x²)`; unsigned `ι′` | `Rᵉ=k`; `t(x⊗1+1⊗x)=0`; `b′ι(e₁∧e₂)=t₁(1⊗X₂⊗1)−t₂(1⊗X₁⊗1)`; defect `2(X₂⊗X₁⊗1+1⊗X₂⊗X₁−1⊗X₁X₂⊗1)` | holds, R04 |
| §8.4, `homological_hkr_mvPolynomial` | `m=1,n=2`; `m=2,n=2,𝔽₂`; `m=0`; `n=0`; `n>m` | chain `=b(1⊗X⊗X⊗X)`; pairing `1`; `k≅HH₀`; `e(r₀)=[r₀]`; `0=0` | holds |
| §8.5 | `r=(X₁²,X₂)`; `m=0,g=2` | `det=2X₁`; `2` | holds |
| `hochschildBimoduleCocycles`, `…Coboundaries`, `…Cohomology` | `n=0`; no `SMulCommClass` | `B⁰=⊥`; quotient by `B∩Z` still defined | match §1.2 |
| `cupProduct` | `p=q=0`; index map | product in `A`; first `p` slots to `f` (`finSumFinEquiv`) | matches §5.1 |

## Verified sound

- **Declarations read: 13** (3 definitions of Layer 1, `cupProduct`, `cupDerivations`,
  `detCochain`, 7 theorems) and the 2 proved `example`s. Each elaborated type in the worker's
  signature file was compared with its README statement: binders, instance arguments and
  generality agree; no section variable is involved (every declaration carries its own binders).
  I ran no Lean. The two `example`s unfold point-free definitions to the README formulas; I did not
  count them as padding.
- **Targets read: 37** (all of §§1.1–8.5), with the conventions, scope and contract sections.
- **Checks tested: 115** Check bullets read, about 90 recomputed by hand (the table above has the
  values; the rest are immediate specialisations); none false, none vacuous. Every definition has
  at least three.
- **Locators verified: 49** against the cached texts (Ginz05 27 ranges, HKR62 18, AV20 2,
  StacksSmooth 2); all support the claims they are cited for. The README's statement that Ginz05
  (6.6.3) fails with Ginz05's own coboundary is correct (see Source issues).
- **Pinned declarations:** the worker's citation resolver finds every backticked library name of
  the README at the pins; I opened about 60 of them and compared statements, among them the coboundary and its
  last-face convention, the normalised chains with `tensor`, `b_tensor`, `chainComplexXIso`, the
  Kronecker theorems, `extLinearEquiv` with both hypotheses, the `extMk` lemmas,
  `Module.Projective.tensorProduct` (noncommutative `R`), `Algebra.Smooth`, `Algebra.Smooth.flat`,
  the brace, bracket and Hochschild differential. No target is already proved at the pins
  (library-match leads: no hit).
- **Sibling citations checked: 16** at main or at the open heads: DGAInfinity Layers 0, 1, 8;
  DerivedModuleAlgebra §§0.K.1, 0.5; KTheoryFiniteLocalFields §4.0; RefinedTraceMethods §§1.1, 1.9,
  1.10; EulerSystemsAndKolyvaginSystems §6.1; IntegralIwasawaTheory §12.6 (the lead
  `TauCeti.StarkSystems.toExteriorBidual` is a target name there, correctly cited as a roadmap
  target); DerivedDeRhamCohomology Layer 2; NoncommutativeGeometry N1.Cyclic; BanachAlgebras
  Layer 6; LanglandsParameterStacks §1.17; ZigzagPreprojective Layer 7. All exist with the cited
  content except the statements of R01.
- **Ownership.** Searched all roadmaps on main and at the open heads for the HKR theorem,
  `Ext`/`Tor` over the enveloping algebra, `HH²` and square-zero extensions, polyvector fields,
  `Tor` over noncommutative rings and the six definition names. No second owner:
  SpectralSequencesAndConvergencePartII excludes `Tor` of one-sided modules over noncommutative
  rings; `cupProduct` of AlgebraicTopology is in another namespace.
- **Headlines.** Statable ones are stated; the four not statable are named in the module docstring
  with the missing carrier. No padding found.
- **Policy.** The pull request changes only the package folder; no `lemma`, `set_option`,
  pull-request number or algorithm; every target has a locator.
- **Dependency check output:** `depcheck: 244 roadmaps, 2274 edges, 0 problem(s)` (no UPWARD, CYCLE
  or `moved:` line).

## Not verifiable

- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (settled as uncertified): not read. In
  particular whether Weibel94 Theorem 9.4.7, cited in the docstring of `cohomological_hkr` and in
  §7.6, states the cohomological form or only the homological one, and whether Loday98 §1.5
  contains graded commutativity (§6.2).
- The value of `s(p,q)` of §5.3 for `p, q ≥ 1`: it needs a computation with Mathlib's shift
  isomorphisms that I did not run.
- That `Suggested.lean` elaborates: I relied on the worker's elaborated signatures.
- §6.3's signs `ν_n` and the arity-zero clauses of §6.1: DGAInfinity Layer 8 fixes no formula to
  test them against (see R01).

## Source issues

- **Misprint** in Ginz05 at formula (6.6.2), line 1363, printed page 29: the source says the inserted cochain takes the arguments indexed `i` to `i+q`; it should be `i` to `i+q−1`, which is `q` arguments; affects nothing.
- **Error** in Ginz05 at formula (6.6.3), line 1368, printed page 29: the source says the graded commutator of cup products equals `d(f∘g) − df∘g − (−1)^{deg f} f∘dg`; it should be Gerstenhaber's identity `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q (d(f∘g) − f∘dg)`, since two equal derivations of `k[x]` give `2 = −2`; affects a stated result.
- **Misprint** in Ginz05 at §5.2, line 1053, printed page 22: the source says the inner terms of the boundary carry no sign; it should be the sign `(−1)^j`, as at lines 973–976; affects nothing.
- **Misprint** in Ginz05 at §3.1, line 404, printed page 9: the source says the inner derivation of an element is a map from the bimodule to itself; it should be a map from the algebra to the bimodule; affects nothing.
- **Gap** in Ginz05 at §9.3, lines 2193–2196, printed page 46: the source says the ideal of the diagonal of a smooth variety is generated by a regular sequence; it should be asserted only after localisation at a maximal ideal, with a proof or reference; affects the proof.

## Copyright, licences and scope

Wording: the README's text was set beside the source at each of the 49 verified locators and at six
further passages (the definition of §3.6, the route of §4.4, the route of §7.6, the docstrings of
`cohomological_hkr` and `homological_hkr_mvPolynomial`, the remark on the weak alternating
condition in §7.6 Checks). No sentence or list reproduces a source; shared material is formulas and
standard names. Arrangement: Ginz05 has the largest share. Its contents run §3 derivations, §4 bar
complex, §5 Hochschild homology and cohomology (defined as `Tor` and `Ext`, then low degrees, then
reduced cochains), §6 Gerstenhaber structure, §8 Kähler differentials, §9 HKR. The roadmap builds
the complexes simplicially first, normalises before the low degrees, places the bar resolution and
`Ext`/`Tor` after them, and adds layers with no counterpart there (Layers 6 and 8, §§4.5, 7.2, 7.3):
no one-to-one run. The order 0, 1, 2 of §§3.1–3.6 is forced by the degrees. Reuse: none.

Source independence: 55 passages compared with 4 sources (Ginz05, HKR62, AV20, StacksSmooth), none shared; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05: independent. Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read.

## For the human reviewers

- **Licence.** Ginz05, the source with the most locators (45 of 117), is an arXiv text
  (arXiv:math/0506603v1) recorded as `open-repository` in `sources.toml`; it is lecture notes, not a
  refereed publication. The main theorems are also cited to HKR62, Loday98 and Weibel94.
- **Not tested.** Loday98 (18 locators), Weibel94 (17), CE56 (7), Ger63 (4) and Mat86 (1) are
  uncertified: wording and locators were not compared with their texts.
- **Conditional gap.** The headline theorem of §7.6 rests on the declared gap
  `gap:smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods §1.9, an open roadmap); the
  design review accepted it conditionally (`design/review.json`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "713ca6ae2d718abb13f2fca1a1eb53a21cf18def", "job": "RT-HochschildHomologyAndHKR~1a", "model": "fable", "worker": "chris-x30"} -->
