<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17723#issuecomment-6904114019 -->
Red team round 1 pass a (claude) of 389b5af

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) VirtualFundamentalClasses does not consume 0.3–0.5: it states them itself

   Location: `packages/StackPointsAndResidualGerbes/README.md:54–57`, "(VirtualFundamentalClasses,
   under Downstream consumers) consume them and own what they build on them … No other roadmap states
   any of the objects above."; and `README.md:1999–2004`, "its §1.2 consumes the closed substacks of
   0.3 with their description on a presentation, the quasi-coherent ideals of 0.4 and the reduced
   induced closed substacks and reduced-source factorisation of 0.5".

   Claim: the sibling imports closed substacks, their presentation description, their ideals and the
   reduced induced structure from this roadmap, and no other roadmap states them.

   Witness: `packages/VirtualFundamentalClasses/README.md:508–541` (§1.2) defines closed substacks,
   proves the presentation bijection, the reduced induced closed substack and the reduced-source
   factorisation, with `*Needs:*` SchemeAndStackFoundations §§1.19–1.20 only; the file never names
   StackPointsAndResidualGerbes and never uses a quasi-coherent ideal of a closed substack. Its carrier
   is "a closed immersion up to equivalence over `𝓜`" (line 510), not Convention 4's strictly full
   substack. Two owners for one object; this roadmap is the earlier one (`merge-order/ORDER.txt` lines
   37 and 423).

   Repair (this package; the sibling's own text is repaired in its package):

   - Replace `README.md:54–57` from "The roadmaps that build cycles" to "any of the objects above." by:
     "VirtualFundamentalClasses §1.2 states closed substacks, their description on an étale
     presentation, the reduced induced closed substack and the reduced-source factorisation for
     Deligne–Mumford stacks of finite type over a field. Those are 0.3 and 0.5 on such stacks: this
     roadmap, earlier in the merge order, owns them for every algebraic stack, and that roadmap keeps
     what it builds on them (intersections and reduced unions, integral closed substacks, irreducible
     components, dimension and cycles). Its closed substacks are closed immersions up to equivalence
     over the stack; by 0.3 every such class contains exactly one strictly full substack of
     Convention 4, so the two carriers agree."
   - Replace the Downstream bullet `README.md:1999–2004` by: "**VirtualFundamentalClasses**: its §1.2
     states, for Deligne–Mumford stacks of finite type over a field, the closed substacks of 0.3 with
     their description on a presentation and the reduced induced closed substacks and reduced-source
     factorisation of 0.5, and builds its integral closed substacks and cycles on them; it does not
     use the ideals of 0.4. Its zero-dimensional integral closed substacks are the residual gerbes at
     closed points (3.3, 4.5), an identification that roadmap does not use."
   - Tested on the witness: the new text is true of `packages/VirtualFundamentalClasses/README.md:508–541`
     and of its boundary paragraph at lines 102–105.

2. **F02** (P3) 7.3 uses a pinned theorem it does not name (separable points of smooth schemes)

   Location: `README.md:1862–1863`, "after a finite separable extension of `k` (both sides commute
   with it) choose a smooth `(U, u) → (𝒳, x)` with `u ∈ U(k)`"; the `*Needs:*` line at
   `README.md:1885–1895` and "From Tau Ceti" (`README.md:238–295`) name no source for the existence of
   that extension.

   Claim: a smooth chart has a point over `x` rational over a finite separable extension.

   Witness: the input is at the pin, uncited:
   `AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`
   (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43`): a nonempty scheme smooth
   over a field `k` has a point over `Spec k` with values in a finite separable extension.

   Repair: add to "From Tau Ceti": "`AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`
   (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43`): a nonempty scheme smooth
   over a field `k` has a point, over `Spec k`, with values in a finite separable extension of `k`.
   7.3 applies it to a scheme étale over the algebraic space `U ×_𝒳 Spec k`, smooth over `k` and
   nonempty for a smooth chart `U → 𝒳` whose image contains `x`." Add the name to 7.3's `*Needs:*`
   (after `TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`) and to Layer 7's Dependencies.
   Tested: for `𝒳 = Bμ_p` over `𝔽_p(t)` and `U = 𝔾_m` (0.1's atlas), `U ×_𝒳 Spec k` is the torsor
   `𝔾_m`, smooth and nonempty, with the rational point `1`; the extension is `k` itself.

3. **F03** (P3) 5.3's proof plan uses Decent Spaces, Lemma 68.13.7, which no target, gap or `*Needs:*` entry supplies

   Location: `README.md:1480–1486`, "a decent reduced locally Noetherian one-point algebraic space is
   the spectrum of a field (stacks-decent-spaces lines 1542–1552, Lemma 68.13.7, with Lemma 68.11.1)";
   `*Needs:* 0.2, 2.1, 2.5, 3.4, 5.1; …; gap:decent-algebraic-spaces`.

   Claim: the step is supplied.

   Witness: gap:decent-algebraic-spaces (`README.md:385–389`) lists 68.6.1, 68.15.2, 68.11.1, 68.12.4,
   68.7.2 and 68.8.3, not 68.13.7; no target states it. stacks-decent-spaces lines 1546–1552 prove it
   from 68.11.1, Morphisms of Spaces 67.10.8 and Lemma 68.13.4, which are 0.2 and 3.2 here; 3.2 is not
   in 5.3's `*Needs:*`.

   Repair: replace the sentence by: "by gap:decent-algebraic-spaces (Lemma 68.11.1) the point of the
   decent space `𝒵_x^♭` is represented by a monomorphism `Spec K → 𝒵_x^♭`; `𝒵_x^♭` is reduced, locally
   Noetherian and one-point (3.4), so it has a surjective, flat, locally finitely presented point (3.1)
   and 3.2 makes the monomorphism an isomorphism (this is the argument of stacks-decent-spaces lines
   1542–1552, Lemma 68.13.7)." Change the `*Needs:*` to "0.2, 2.1, 2.5, 3.1, 3.2, 3.4, 5.1; …". Tested
   on `Spec ℚ(t)/ℤ` (3.4's Check): not decent, no monomorphism from a field represents its point
   (SchemeAndStackFoundations §1.7's Check), and the conclusion fails, as it should.

4. **F04** (P3) *Stacks.IsGerbe* is not the fppf instance of the supplier's `IsGerbe`

   Location: `README.md:79–80`, "the gerbe predicates `IsGerbe` and `relativeGerbe` on a site"; and
   `README.md:952–954`, "Say that `𝒳` *is a gerbe* (*Stacks.IsGerbe*) when it is a gerbe over some
   algebraic space".

   Claim: the two predicates named `IsGerbe` are compatible.

   Witness: AlgebraicModuliForArithmeticGeometry §4.1 (`TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1866`)
   defines `IsGerbe(F, J)` by local nonemptiness and local isomorphism of every pair of objects over
   each `U`. On `(Scheme, fppf)`: `𝔸¹_k` is a gerbe in 2.1's sense (over itself, 2.1's first Check),
   and its objects `0, 1` over `Spec k` are not fppf-locally isomorphic, so `IsGerbe` fails.

   Repair: after the definition in 2.1 add: "This is weaker than
   AlgebraicModuliForArithmeticGeometry §4.1's `IsGerbe` on `(Scheme.{u}, fppf)`, which is the case
   `𝒴 = Spec ℤ` of *Stacks.IsGerbeOver*: an algebraic stack satisfies `IsGerbe` exactly when it is a
   gerbe over `Spec ℤ`." Add the Check: "`𝔸¹_k` is a gerbe (over itself) and does not satisfy
   `IsGerbe`: its `k`-points `0` and `1` are not fppf-locally isomorphic; `B𝔾_{m,ℤ}` satisfies both."
   Rename the proposed *Stacks.IsGerbe* to *Stacks.IsGerbeOverSpace* in 2.1 (the only place it is
   named).

5. **F05** (P3) Convention 8 gives §8.1's deformation groupoid the framing direction of §8.3

   Location: `README.md:155–158`, "AlgebraicModuliForArithmeticGeometry §8.1's
   `deformationFunctorOfPoint`: framed deformations `(τ : Spec k[ε] → 𝒳, α : x ≅ τ|_k)`".

   Claim: §8.1's objects are pairs with a framing from `x` to the restriction.

   Witness: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9651` (§8.1): objects are
   pairs `(x ∈ 𝒳(Spec A), x|_k ≅ x₀)`, the opposite direction; `α : x₀ ≅ y|k` is §8.3's
   `FramedDeformation` (same file, line 9727). Convention 5's action formula depends on the direction.

   Repair: in Convention 8 replace "framed deformations `(τ : Spec k[ε] → 𝒳, α : x ≅ τ|_k)` up to
   isomorphism compatible with `α`" by "framed deformations up to framed isomorphism. §8.1 writes them
   `(τ, β : τ|_k ≅ x)` and §8.3's `FramedDeformation` writes `(τ, α : x ≅ τ|_k)`; the two are
   identified by `α = β⁻¹`, and this roadmap uses `α`. In §8.1's form the left action of Convention 5
   is `g·(τ, β) = (τ, g ∘ β)`." Tested on Convention 5's witness: for `[𝔸¹/𝔾_m]`, `τ = bε`, the class
   of `(bε, α)` is `α⁻¹b`, and `g·(bε, α) = (bε, αg⁻¹)` has class `g·α⁻¹b`: weight `+1` in both
   notations (`β = α⁻¹`, `g∘β = gα⁻¹`, class `(gα⁻¹)·b`).

6. **F06** (P3) two Checks cite SchemeAndStackFoundations §1.12 for an object it does not state

   Location: `README.md:918–919`, "the non-separated group algebraic space `G = 𝔸¹_k/ℤ` over a field
   of characteristic zero (SchemeAndStackFoundations §1.12)"; reused at `README.md:1337`.

   Claim: §1.12 supplies `𝔸¹_k/ℤ` as a group algebraic space over any field of characteristic zero.

   Witness: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3180`, `translationQuotient_space`: the
   algebraic space `𝔸¹_ℚ/ℤ` only, over `ℚ`, with no group structure.

   Repair: at line 918 write "For the non-separated group algebraic space `G = 𝔾_{a,ℚ}/ℤ` over `ℚ`,
   the quotient of `𝔾_a` by the constant subgroup `ℤ`, whose underlying space is
   SchemeAndStackFoundations §1.12's `𝔸¹_ℚ/ℤ` (`translationQuotient_space`; the group law descends
   from `𝔾_a` because `ℤ` is a subgroup)", and at line 1337 "`G = 𝔾_{a,ℚ}/ℤ` of 1.4's first Check";
   replace `k` by `ℚ` in the rest of both Checks. The computations in both Checks are unchanged
   (`⊔_{n ∈ ℤ} 𝔸¹ → 𝔸²`, `x ↦ (x, x + n)`, is not quasi-compact and its image is not locally closed).

One P2 (R01) and five P3 (R02–R06). No mathematical statement of the README was refuted; the
findings are a false ownership claim about a sibling package, an uncited pinned input, an unowned
step of one proof plan, and three convention or citation mismatches with suppliers.

## The adversarial pass: record

`Suggested.lean` declares nothing (57 lines read: `module`, `import Mathlib`, one module docstring,
an empty namespace), so there is no declaration row and no `#check` comparison to make. README
targets, with the instances computed:

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 smooth-local properties | `Bμ_p/𝔽_p` with atlas `𝔾_m` (torsor `λ ↦ λ^p`); `[Spec k[t]/(t²)/𝔾_m]` | fibre of `𝔾_m → Bμ_p` over `Spec k` is the torsor `𝔾_m`, smooth; atlas `k[t]/(t²)` nonreduced | holds |
| 0.2 monomorphisms, rigidity | `Spec k → BG`; `Spec ℂ → Spec ℝ`; `Spec k → Spec k[ε]`; `Spec ℚ̄ → U/G` | diagonal fibre `G ≠ pt`; `ℂ ⊗_ℝ ℂ` has 2 points; mono, not iso, target not a field; section, mono, `U ×_X Spec ℚ̄ = G × Spec ℚ̄ ≠ U` | holds; rigidity proof rechecked (`V ×_k V → V` étale, descent along `V → Spec k`) |
| 0.3 immersions | `B𝔾_m ⊂ [𝔸¹/𝔾_m]`; `Spec k(t) → 𝔸¹` | invariant subschemes `{0}`, `𝔾_m`; `{η}` not locally closed | holds |
| 0.4 ideals, neighbourhoods | origin of `𝔸¹`; `Spec k ⊂ Spec(k × k)`; `n = 0`; `Spec k[ε]` | big-site kernel: `(t)` over `id`, `0` over the origin, pullback of `(t)` is `k·t` (dimension 1 ≠ 0); split case kernels equal `O(T₂)`; `V(ℐ¹) = 𝒵`; `ℐ² = 0` so `𝒳^{[n]} = 𝒳`, `n ≥ 1`; `2(n+1) ≥ n+2` | holds; `ℐ → K` is always surjective, so the "differs" clause is right |
| 0.5 reduced induced | `Spec k[ε] → 𝔸¹`, `t ↦ ε`; `[𝔸¹/𝔾_m]` open point | image `{0}`, no factorisation through `Spec k`; `T̄ ∖ T = {0}` closed | holds |
| 1.1 finite type points | `η ∈ 𝔸¹_k`; generic point of `Spec ℤ_(p)`; `Spec ℚ̄ → Spec ℚ` | `K` finite over `k[t]/𝔪` contradicts injectivity of `k[t] → K`; `ℚ = ℤ_(p)[1/p]`; `[ℚ̄:ℚ] = ∞` | holds |
| 1.2 closed and field-valued points | `B(ℤ/2)_ℝ`; `Spec ℚ(i)` | 2 classes ↦ 1 point; `a = σ, b = id`: `σ∘id = id∘σ`; `ι ≠ ι∘σ` | holds |
| 1.3 `G_x` | `Bμ_3/ℚ`; `[𝔸¹/𝔾_m]`; absolute case of Lemma 101.5.4 | `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3)) = ℤ/3`; `G_0 = 𝔾_m`, `G_1 = 1`; `𝒴 = Spec ℤ` gives the stated pseudo-torsor | holds |
| 1.4 `G_x` a scheme | `𝔾_a/ℤ`; `Bℤ`; `B𝔾_m` | diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, not qc, image not locally closed; `G_x = ⊔_ℤ Spec k` étale not finite; affine, not quasi-DM | holds (R06 on the citation) |
| 2.1 gerbes, base | `𝔸¹_k`; `Spec k → BG`; `[𝔸¹/𝔾_m]` | gerbe over itself, not `IsGerbe` of the supplier; automorphisms do not lift; `0, 1` not locally isomorphic | holds; R04 |
| 2.2 gerbes with a section | `[𝔸¹/𝔾_m]`, section `1`; `S₃`-torsor over `ℝ` | `Isom(1,1) = 1`, `[pt/1] ≠ 𝒳`; inner form | holds |
| 2.3 local structure, smoothness | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p` | smooth; fibre `μ_p` not smooth | holds; Lemma 101.33.7 read |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; free action | stabilizer `k[t, λ^±]/((λ−1)t)`, fibre dimensions 1, 0; trivial inertia | holds |
| 2.5 diagonal criterion | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ` | diagonal is `e : Spec k → 𝔾_m`, not flat; homeomorphism, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` | holds; converse of 28.14 fails as stated |
| 2.6 dense open gerbe | `[Spec k[x₀,…]/𝔾_m]`; `[Spec k[ε]/𝔾_m]` | stabilizer `μ_{pⁱ}` on `x₀ = … = x_{i−1} = 0, xᵢ ≠ 0`, trivial for `i = 0`; flatness test over `k[ε]`: `(λ−1)ε = 0` and `λ − 1 ∉ εB`, so `Ann(ε) ≠ εB` | holds |
| 3.1 reduced one-point stacks | `Spec k[ε]`; `U/G` | not reduced, point not flat; `ℚ̄ ⊗ ℚ̄` absolutely flat, kernel of multiplication not finitely generated | holds |
| 3.2 rigidity | `Spec ℚ̄ → U/G`; `Spec k → BG` | mono, not an equivalence, target has no lfp flat point; not mono | holds |
| 3.3 residual gerbe | scheme; `Spec k[ε]`; open substack | `Spec κ(x)`; `Spec k`; a mono with image `x ∈ |𝒰|` factors through `𝒰` | holds |
| 3.4 properties | `Spec ℚ(t)/ℤ`; non-gerbe `[𝔸¹/𝔾_m] → Spec k` | `ℚ(t) ⊗_F ℚ(t)` finite versus `ℤ × Spec ℚ(t)`; pullback is the whole stack | holds |
| 3.5 functoriality | `BG → Spec k`, `G = ℤ/2`, `μ_p`, `1` | 2 points vs 1; length `p` vs 1; equal | holds |
| 4.1 finite type points | `η ∈ 𝔸¹`; `U/G` | residual gerbe exists, not lft; exists, `Spec ℚ̄` | holds; Lemma 101.18.7 read |
| 4.2 quasi-finite presentations | `Bμ_p`; `𝔸¹_ℚ/ℤ` at `η` | atlas `Spec 𝔽_p` flat qf; `U' = Spec ℚ(t)`, `R' = ℤ × U'`, residual space `Spec ℚ(t)/ℤ` | holds |
| 4.3 gerbes, qc inertia | `Bℤ`; `B(𝔾_a/ℤ)` | gerbe, inertia not qc; inertia qc (image of `𝔸¹`), not qs | holds |
| 4.4 locally Noetherian | `Spec ℚ(t)/ℤ`; proof step at stacks-06RD lines 3104–3120 | residual gerbe is the space; factorisation through `u = lim W` needs no reducedness | holds |
| 4.5 closed points | DVR; `U/G` | closed point: closed immersion; generic: open; closed point with a non-closed mono | holds; Lemma 101.51.4 read |
| 5.1 decent stacks | two copies of `Spec k[x₁,…]` glued along `⋃D(xᵢ)`; `𝔸¹_ℚ/ℤ` | `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁},…,x_{iₙ})`; not decent | holds; Lemmas 101.48.2–48.5 read |
| 5.2 factorisation | identity of `𝔸¹`; `Spec k[ε] → 𝔸¹`; `Y/Γ` | image is the closure; nonreduced; orbit map has no section | holds; three reductions rechecked against Lemma 101.51.2 |
| 5.3 residue field | `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ` | `H¹(ℝ, ℤ/4) = {0, 2}`, both ↦ `0 ∈ H¹(ℝ, ℤ/2)`, no real object, `κ = ℝ`; no residue field | holds; R03 on the proof plan |
| 5.4 algebraicity | glued scheme of 5.1; `𝔸¹_ℚ/ℤ` | preimage of the other copy is `⋃D(xᵢ)`, not qc; `P(t+n) ≠ P(t)`: coefficient of `t^{d−1}` shifts by `dn` | holds; `Z × T` affine so the immersion is qc |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `BG_k`, `k̄/k` infinite | a closed point of an fppf cover has residue field finite over `κ`; `k̄` does not embed | holds |
| 6.1 presentation | `Spec κ`, `k/κ` Galois | `R_x = Γ × Spec k`, `G_x = 1`, quotient `Spec κ` | holds |
| 6.2 base change | `BG_k`, `G = ℤ/2`, `μ_p`, `1` | three products: `BG`, `Spec k`, `G` (2 points; length `p`; all `Spec k`) | holds |
| 6.3 neutrality | `(t, −1)` over `ℚ(t)`; `σ : t ↦ t²` | residue at `0` is `−1 ∉ ℚ^{×2}`; `(t², −1)` split; `σ` not surjective | holds |
| 6.4 rational points | `U/G` over `ℚ̄`; `Spec k[x₀,…]` | section, `𝒵_x = Spec ℚ̄ = BG_x`; origin lft, not lfp | holds; consistent with 3.2, 4.4, 4.5 Checks |
| 7.1 point neighbourhoods | `𝔸²` at `0`, `n = 1` | `k[x,y]/(x,y)²`, length 3 | holds |
| 7.2 normal space | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]` | `t` of weight `−1`, `N_0` of weight `+1`; standard representation | holds |
| 7.3 tangent–normal sequence | `Bμ_p`; `[𝔸¹/μ_p]`; cusp; `[𝔸¹/𝔾_m]` framing | `dim T = 1 = dim Lie − dim G`, `N = 0`; `2 = 1 + 1`; `2 = 0 + 2`; class of `(bε, α)` is `α⁻¹b`, `g` acts by `g` (weight `+1`), `α∘g` gives `−1` | holds; R02, R05 |
| 7.4 quotient stacks | `SL₂` on binary quadratics at `uv`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | torus weights `2, 0, −2`, orbit tangent `⟨u², v²⟩`, `N` of weight 0, `3 − 2 = 1`; quotient `𝔸¹ ⊔ 𝔸¹_ℚ/ℤ`, `N = ℚ·∂_t` | holds |
| Worked example, zero-dimensional DM | `Bℤ` over `K` | DM, finite type, one point, `G_x = ℤ` not finite: the qc-diagonal hypothesis is needed | holds |

## Dependency check

    depcheck: 234 roadmaps, 2229 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The three named suppliers are on main
(`TauCetiRoadmap/SchemeAndStackFoundations`, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry`,
`TauCetiRoadmap/ReductiveGroups`). No notion was moved down from a later roadmap.

## Verified sound

- `Suggested.lean`: 0 declarations; read whole (57 lines). `import Mathlib` only, no `set_option`,
  no `sorry`, form as required. The nine headlines of its docstring are the README's end theorems
  plus 2.4/2.6 and 5.4; none is statable: `TauCeti/AlgebraicGeometry/Stack/` holds only `Basic.lean`
  (`SchPseudofunctor`, line 37), and neither pin has an algebraic stack, inertia, `|𝒳|` or gerbe.
  No padding (nothing is declared). No Lean was run in this pass.
- Targets read: 38 of 38, with their `*Needs:*` lines, the layer Dependencies and "How to read the
  build" (the layer dependency sentence at `README.md:491–494` agrees with the 38 `*Needs:*` lines;
  no target needs a later one).
- Pinned declarations: 47 file:line locators of "From Mathlib" and "From Tau Ceti" opened at the
  pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): all hold the named declaration; namespaces checked
  for the eight Tau Ceti names; the hypotheses quoted in the README (`[IsLocallyNoetherian Y]` in
  `of_flat_of_surjective` and in `isReduced_of_flat_of_isLocallyNoetherian`, `[LocallyOfFiniteType]`
  in `exists_isClosedImmersion_generalLinear`, `[Algebra.FiniteType k H]` in the Lie-dimension
  criterion) are the pinned ones.
- Source locators: 142 line locators checked by script against the cached texts (the cited label
  stands at the cited first line in every case); 46 statements read in full against the README
  (among them Lemmas 100.8.4, 100.9.6, 100.11.1–100.11.14, 100.14.1, 101.4.16, 101.5.4, 101.17.8,
  101.18.7, 101.19.1, 101.27.13, 101.27.15, 101.28.14–15, 101.31.1–3, 101.33.7, 101.48.2–5,
  101.50.2, 101.51.1–4, Theorem 101.21.3, Example 101.29.2, Decent Spaces 68.10.2, 68.13.7,
  68.13.9–11, Criteria 97.17.1–2, 97.18.3, Groupoids in Spaces 78.25.1, 78.27.1–2, Algebraic Stacks
  94.16.1, 94.16.3, Spaces over Fields 72.10.8–9, More on Groupoids 79.9.4, 79.10.3, ahr2020 lines
  39–43, 248–252, 474–486, rydh2011 lines 1232–1282, alper-moduli lines 6234–6236, 6948–6999,
  16526–16549, sga3-vi-a lines 871–894). Hypotheses dropped by the README relative to a source
  (finite type point and Noetherian in 6.2, quasi-separated in Layer 7, smooth affine `G_x` in 6.4)
  are each argued in the text and tested by a Check; the arguments were recomputed.
- Checks: 142 read; every definition has at least three; 64 recomputed (table above); none found
  false, vacuous or a restatement.
- Sibling citations: 50 SchemeAndStackFoundations names of the supplier contract found in the cited
  sections on main (including the nine leads of the citation tool: `Groups.GroupSpace` line 3243,
  `Groups.IsTorsor` line 3376, `.iff_unramified_diagonal` line 3624, `SmoothLocal.atlas_independent`
  line 3646, `EtaleLocal` line 3015, `Stack.stackification` §1.18, `.pullbackSurjective` line 3655,
  `actionQuotient.torsorEquiv` line 3758, and `IsGerbe.equivalence_iff` at
  AlgebraicModuliForArithmeticGeometry line 1886); the Checks cited in §§1.7, 1.16, 1.21, 1.22
  exist; 12 AlgebraicModuliForArithmeticGeometry names found in §§4.1, 8.1, 8.3, and the reframing
  `α ∘ g` at line 9736; ReductiveGroups Layers 1, 3, 3A as described. Downstream:
  LanglandsParameterStacks §1.16, FunctionFieldArithmeticPartII's gap, MotivicStructuresInModuliOfCurves
  §§7.3, 8.4, 8.6 are as described; VirtualFundamentalClasses is not (R01).
- Declared gaps: 16 slugs, the same in `design/plan.json` and under "Exact supplier contracts", each
  with a named supplier and section. None is already provided: SchemeAndStackFoundations on main has
  no decent space, no quasi-DM or quasi-separated morphism of stacks, no monomorphism or closed
  substack of stacks, no openness of flat lfp morphisms, `quotientStack_algebraic` for groupoid
  schemes only, `generic_flatness` over an integral base only; AlgebraicModuliForArithmeticGeometry
  has no Lemma 98.5.2; ReductiveGroups Layer 3 proves representability for normal subgroups only.
  SchemeAndStackFoundationsPartII (open) plans none of them. Not raised, as the brief directs.
- Ownership against open work: `roadmaps grep` for residual gerbes, monomorphisms, closed and
  reduced induced substacks, decent stacks, finite type points, gerbes of algebraic stacks, the
  normal space and infinitesimal neighbourhoods of stacks, on main and at the open heads: no second
  owner except the board package of R01.
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/StackPointsAndResidualGerbes/`
  (5 files); no pull-request number, no `lemma`, no `set_option`, no algorithm; `sources.toml` has 25
  entries and no local path (two Stacks chapters each carry two keys with one sha256,
  `stacks-04XE`/`stacks-06ML` and `stacks-06QB`/`stacks-06RD`; keys are fixed for the manifest's
  lifetime, so this is not raised).
- Arrangement: the layers interleave two chapters and three papers (Layer 0 ↔ Ch. 100 §§7–10 plus
  its own 0.4; Layer 1 ↔ Ch. 101 §§18–19; Layer 2 ↔ Ch. 101 §§28–29, 33; Layer 3 ↔ Ch. 100 §11;
  Layer 4 ↔ Ch. 101 §§18, 28, 31, 51; Layer 5 ↔ Ch. 101 §§48, 50, 51 and rydh2011; Layers 6–7 from
  alper-moduli and ahr2020 with own routes): not a run of one table of contents. Inside Layers 0, 2
  and 3 the order of sections is forced by `*Needs:*` (0.3 needs 0.1, 0.2; 0.5 needs 0.1, 0.3;
  2.2 ← 2.1, 2.3 ← 2.1–2.2, 2.4 ← 2.1–2.3, 2.5 ← 2.1, 2.3, 2.4, 2.6 ← 2.4; 3.2 ← 3.1, 3.3 ← 3.1–3.2,
  3.4 ← 3.1–3.3, 3.5 ← 3.2–3.4).

Source independence: 14 passages compared with 5 sources (stacks-06ML Lemmas 100.11.1 and 100.11.7;
stacks-06RD Lemmas 101.48.3, 101.51.2 with its proof, 101.18.7, 101.19.1, Example 101.29.2;
stacks-04XE Lemma 100.8.4, Definition 100.9.1; rydh2011 Theorem B.2 and lines 1236–1245; ahr2020
lines 248–252 and 475–486; alper-moduli Proposition 4.5.16), none shared beyond standard phrases of
at most 7 words ("is flat and locally of finite presentation"); largest share the Morphisms of
Algebraic Stacks chapter (`stacks-06RD` with `stacks-06QB`), 54 of 142 line locators; contents
compared with that chapter and with Properties of Algebraic Stacks (42 of 142): independent.

## Not verifiable

- lmb2000 (Chapter 11, Définition 11.2) and olsson2016 (Chapter 11): uncertified, cited by locator
  only; the texts were not read. No target rests on them (5.5 argues its statement directly).
- The elaborated-signature comparison: there is no declaration, and this pass runs no Lean.
- Sections of LanglandsParameterStacks and of the open VirtualFundamentalClass (singular, another
  author's pull request) were read through `roadmaps grep` only; the latter is not cited by the
  README.
- The remaining 96 of the 142 line locators were checked for the cited label at the cited line
  only, not statement against statement (Lemma 101.5.1, cited in gap:inertia-of-presentations, was
  read at stacks-06RD lines 463–468 and agrees with the gap).

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.48.2, proof, printed page 98 (stacks-06RD line 4695): the source says the diagonal "is on known" to be quasi-compact; it should be "is only known"; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.51.2, proof, printed page 102 (stacks-06RD lines 4857–4858): the second reduction assumes the stack reduced with generic point and then takes the dense open gerbe inside the primed closed substack; it should be inside the stack itself after the replacement; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, proof, printed page 102 (stacks-06RD lines 4862–4863): the source says the base of a locally Noetherian gerbe is locally Noetherian by fppf descent, details omitted; it should cite descent of local Noetherianity along the smooth surjective gerbe morphism (Lemma 101.33.8); affects the proof.
- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 14 (stacks-04XE lines 798–801): the source omits the proof that an immersion is a homeomorphism onto a locally closed subset; it should deduce it from the presentation description of Lemmas 100.9.7–100.9.8 and the quotient topology; affects the proof.
- **Gap** in stacks-06RD at Lemma 101.19.2, printed page 37 (stacks-06RD lines 1690–1697): the source omits the proof that a ground-field-invariant property of the automorphism group does not depend on the representative; it should apply the base-change formula to a common extension; affects the proof.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (`sources.toml`, `licence_class = "author-page"`), cited for 6.2–6.4 and Checks; `sga3-vi-a` is read in an editor's compilation on an author page, cited only in gap:homogeneous-quotient-scheme.
- **Scope.** Every target has a locator into the Stacks Project, rydh2011 (J. Algebra) or ahr2020 (Ann. of Math.); the two uncertified books (`lmb2000`, `olsson2016`) are background only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "389b5af7b1739f7d5ee4021b36d5be3d574ad73d", "job": "RT-StackPointsAndResidualGerbes~1a", "model": "fable", "worker": "chris-x80"} -->
