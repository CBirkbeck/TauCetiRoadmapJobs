# Repair report: red-team round 1 (passes a and b)

The first four sections answer pass a (F01–F04), the next four pass b (F01–F04). Pass a F01 and pass b F04 make the same claim; the verdict is settled once, under pass a F01, and pass b F04 points to it.

## F01 (P2) — applied

Old: Suggested.lean had no declarations, and its docstring said no headline was statable. New: the file defines `UnitFreeTensor`, a structure with a real body (tensor on objects and on morphisms, `tensor_id`, `tensor_comp`, the associator, `assoc_naturality`, `pentagon`), and states `idempotent_defect_eq_id` with `sorry` under a Layer 5 heading. The docstring now names it. README §5.1 defines both names and gives three Checks on the structure: a Mathlib monoidal category, ℕ under addition versus Cantor pairing, and a rescaled associator with c² = c³.

The statement is true. I proved it by hand: using naturality and `hr`, the pentagon's short route composed with ν₀ = θ∘(θ∘(θ⊗id)⊗id) is a²ν₀. Using `hr`, then `hdef`, then `hl`, the long route is a³ν₀. ν₀ is invertible, so a² = a³, and a = id because a is invertible. The hypotheses match GH11 line 477 (diagram (3.1)) and line 481 (Theorem 3.1.2). The proof uses no unit.

Ownership: there is no semigroupal or unit-free tensor structure in Mathlib or Tau Ceti at the pins. `roadmaps grep` over main and the open heads finds no other owner; its hits are unrelated "idempotent theorems" in McKaySkewGroup, FaltingsFinitenessAndIsogenyTheorems and BanachAlgebras.

## F02 (P1) — applied

Old: §6.1 imported "restricted tensor spaces and their transport" from FunctionFieldArithmetic §§2.1–2.3 and Completed/RestrictedProducts. New: the algebraic restricted tensor comes from AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners. Topological transports still come from Completed/RestrictedProducts, and lattice and Fourier comparisons from FunctionFieldArithmetic §§2.1–2.3.

I verified the claim: at its open head, FunctionFieldArithmetic §§2.1–2.3 covers divisor lattices, self-dual volumes and lattice Fourier transforms; AutomorphicFormsOnReductiveGroups §3.4 constructs `RestrictedTensor(W,w⁰)`. That roadmap is at line 77 of the merge order; this one is at line 288.

I repaired the pattern as well:
- New "From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups" contract, and a revised sentence in Scope and ownership.
- §6.1, §9.2 (restricted tensor of local counits) and §11.2 (global η and restricted tensor maps): the supplier is added to each *Needs* line.
- The dependencies of Layers 6, 9 and 11, and the Completed/RestrictedProducts contract sentence.

No gap is needed: the cited section already supplies the construction.

## F03 (P2) — applied

Old: §8.3 spoke of "coinvariants under the specified outer rational action", with no residual action given. New: the rational action is (γ·Φ)(m)=Φ(γ⁻¹m) and the residual action is (g·Φ)(m)=|det g|⁻¹Φ(mg⁻ᵀ). After the §0.3 swap of the second and third factors, QΨ(m)=∫Ψ(m,y)|y|d×y identifies the middle T-coinvariants with S(M₂(A)). The Checks are new; §0.3 is added to *Needs*, and the Layer 8 Examples are updated.

I recomputed the derivation myself:
- Middle diag(a,1) acts by |a|Ψ(m,ay); Q is invariant under it exactly because of the weight |y|.
- The third outer action gives |det g|⁻¹QΨ(mg⁻ᵀ).
- For γ∈Γ, |det γ|=1 by the product formula.
- Witnesses: Q(g·Ψ)(0)=q_v at g=diag(π_v,1), against 1 unweighted. At E₀₁ with g=u(π_v⁻¹), the value is 0, against 1 without the transpose.

## F04 (P3) — applied differently

**§2.4.** I replaced the tautological Check and the repeated one with the 𝔽₃((t)) indicator computation: W(1)=1, W(u(t⁻¹))=ζ, W(diag(t⁻¹,1))=0, and the inverse character gives ζ². The second new Check is the unit comparison φ([1_GL₂(O)]⊗y)=1_GL₂(O), computed from the README's own formula for φ: the reference vector is fixed by the middle GL₂(O) action, so φ(…)(g)=1M₂(O)(g⁻¹)1O×(−det g).

**§9.3.** I did not use the reviewer's "specified finite-level local unit". The stated laws do not fix such a unit, because under 2⋆ the element u/2 is idempotent. Instead the Check uses u=η_I∘ε_A in the full Hom: the unit law, unitor naturality and the counit law give u⋆f=f, while 2⋆ gives 2f. The patch Check stays: p(f)=0 but p(f²)=(1/a+1/b)1_D. I added an existence argument with distinct double cosets ΓxJ and Γx′J. The orthogonal-idempotent Check is kept.

## F01 (P3) — applied

Old: "Sections 6.1 and 6.3 own…", which sat inside the MetaplecticAutomorphicForms paragraph and so read as that roadmap's sections. New: "This roadmap's §§6.1 and 6.3 own…".

## F02 (P3) — applied

Old: "(Dor21 line 1030)", a forward mention. New: "(Dor21 line 1067; Dor21 line 1368)". I checked against the source: Proposition B.5.4 is at Dor21 line 1067 and Theorem B.6.1 at line 1368.

## F03 (P3) — applied

§10.1 now fixes the action on 1_T: ((a,d)·f)(x,y)=f(ax,dy). I recomputed that both sides equal |λ²y|⁻¹f(aλy,dλ⁻¹); this goes into the proof route and the API bullet. The third Check now shows its values, 1 on each path. A negative control is added: under f(a⁻¹x,d⁻¹y), the second path is f(π⁻¹,1), which is 0 for a small indicator around (π,1).

## F04 (P3) — applied

The theorem is stated, as in pass a F01, at the README's unit-free generality: option (b) with a structure, not the unital `MonoidalCategory` version. The unital case is the first Check of §5.1.

## Checks

**Elaboration.** `lake env lean packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` gives only `declaration uses 'sorry'` at `idempotent_defect_eq_id`, with no errors. There is no `set_option` and the only import is `import Mathlib`.

**Binder check.** I elaborated `#check @UnitFreeTensor`, `#check @idempotent_defect_eq_id` and `#check @UnitFreeTensor.pentagon` in one scratch file. All binders are explicit in the signatures and there are no section variables. The elaborated hypotheses match README §5.1 exactly (`hdef`, `hl`, `hr`, conclusion `a.hom = 𝟙 P`). Nothing changed.

**Dependency check.**

```text
depcheck: 56 roadmaps, 648 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines.

**Citation resolver.** No cross-roadmap citations or Lean names unresolved.

## Adversarial pass on new or changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| `UnitFreeTensor` | Mathlib monoidal category; (ℕ,+) discrete; Cantor pairing; Vect with c·α | the pentagon holds; strict; θ(θ(0,0),1)=2 ≠ 5=θ(0,θ(0,1)), so no associator; c³ vs c², so c=1 | admits the intended models, excludes the two wrong ones |
| `idempotent_defect_eq_id` | θ=cxy on a line; zero object; zero endomorphism | a=1; a=id; 0²=0³ but 0 is not invertible | true; invertibility is used |
| §8.3 action | Ψ = reference vector, g=diag(π_v,1); E₀₁ with g=u(π_v⁻¹); rational γ | q_v=q_v·1 (unweighted gives 1); 0 vs 1; \|det γ\|=1 | weight and transpose pinned |
| §2.4 Checks | f=1_GL₂(O) over 𝔽₃((t)) | 1, ζ, 0; inverse character ζ²; φ-value 1_GL₂(O) | discriminating |
| §9.3 Checks | u=η∘ε; f=1_A/a−1_B/b with a=b=1 | u⋆f=f vs 2f; p values 0 vs 2·1_D | excludes 2⋆ and the pointwise product |
| §10.1 action | (π,1),(1,1), f(π,1)=1 | q⁻¹·q·1=1 and 1; the inverse action gives 0 | equivariance holds only for f(ax,dy) |

## Notes for the maintainer

- Ownership was checked against main, the board packages and the open roadmap pull requests through `roadmaps grep`.
- AutomorphicFormsOnReductiveGroups §3.4 is now a supplier. The name of that section must stay stable.
- No name that another roadmap cites has changed. The two new Lean names belong to this roadmap.
- No sources were added and there is no `needs-references.toml`.
- No reviewed text contained instructions.
