# FIX-PKG-ShimuraVarietiesPartII~7

Repair of the four findings of `REV-PKG-ShimuraVarietiesPartII~6` (one P1, one P2, two P3). All four were verified against the sources and the cited roadmaps and are repaired; F01 is applied with a different slug, for the reason given below.

## F01 (P1) — applied differently

**Verified.** The step at HT line 800–802 (proof of Proposition 1.3.7) uses (1.3.4.2) (HT line 751–757, p.16): the de Rham comparison carries the p-adic étale realization of the Hodge tensors at a point over a finite extension of L to their de Rham realization (Blasius–Wintenberger). None of the suppliers in §0.5's *Needs* provides it. ShimuraVarieties §7.0i, at the head of its open pull request, works over ℂ with de Rham and finite-adelic étale realizations and has no B_dR statement. AutomorphicBundles §1.2 only applies §7.0i, and its §3.7 states “The comparison does not add crystalline or `B_dR` assertions”.

**Change.** A supplier contract under `From TauCetiRoadmap.ShimuraVarieties`, which now also lists §7.0i. The *Needs* lines of §0.5 and of §1.1 (pattern: its route “identify the p-adic absolute Hodge tensors of the abelian lift” uses the same comparison), the Layer 0 and Layer 1 Dependencies, the Scope import list, and a `gaps` entry in `design/plan.json`.

**Why differently.** I reused FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII's slug `integral-hodge-realization-extension` (same supplier, same section §7.0i, same hypotheses) rather than the proposed `absolute-hodge-padic-comparison`. That proposed slug is already used by ComplexMultiplicationAndExplicitReciprocityPartII for a different supplier (AutomorphicBundles, extending its §1.3, number fields). On the board, every slug that is shared between packages names one supplier.

**Contract wording.** The `needs` sentence uses the de Rham comparison of (1.3.4.2) as the review asks. It defines the tensors precisely: the absolute Hodge tensors of A_ℂ for an embedding K̄ ↪ ℂ, whose components are defined over K̄ by §7.0i. The locator is p.16; the review's “p.17” is the page of Proposition 1.3.7.

## F02 (P2) — applied

**Verified.** KP Corollary 0.3 (KP line 130–132, p.124) and KPZ Theorem 7.2.21(2) (KPZ line 3749) give only reducedness and normality of the irreducible components of strict henselizations. KZ Theorem 4.4.4 (KZ line 1887–1896) is the very-special case.

**Change.** The first sentence of §1.9 now states that form, transferred through the §1.4 diagram, plus “When G^fix=G°, every irreducible component of the geometric special fibre is normal”. The locator gains KP Cor. 0.3 and KPZ Thm 7.1.3(2). The proof sketch gives the arguments, and the Remark gains the nodal control. In `sources.toml`, KP gains Corollary 0.3 and §1.9.

**Differs from the proposed wording:** the connected case is argued through π⁻¹ of a component, not through Kottwitz–Rapoport closures. KR strata are first defined in §6.1, so citing them in Layer 1 would be a forward reference. Both arguments were checked (see the table).

## F03 (P3) — applied

**Verified.** HT line 982–984 takes automorphisms of A_s0 up to prime-to-p isogeny. HT prints `I_s0(Q_p)∩Aut(A_s0)`, which equals I(Q)∩Aut(A) because Aut(A)⊂End⁰(A)^×.

**Change.** §4.8: “Integral automorphisms are I_x(Q)∩Aut(A_x)” → “Write I_x(Z_(p))=I_x(Q)∩Aut(A_x), where A_x is taken up to prime-to-p isogeny, so that Aut(A_x)=(End(A_x)⊗Z_(p))^×”. The third Check now gives p⁻¹∉I_x(Z_(p)) with the degree argument, ℓ⁻¹∈I_x(Z_(p)) (1/2 at p=5), and the effect on §4.11. §4.11 already used this reading and needs no change.

## F04 (P3) — applied

**Verified.** The algebraicity argument is KZ §5.3.2 (KZ line 2370–2374, page 53 by the marker at line 2337). §5.3.6 (KZ line 2428–2439) has only the Steinberg equality and the descent to ℚ.

**Change.** The §7.5 locator “(KZ, Proof of Theorem 5.1.4, §5.3.6, p.55)” → “(KZ, §5.3.2, p.53, for algebraicity; proof of Theorem 5.1.4, §5.3.6, p.55, for equality)”. No manifest change is needed: KZ records §§3–5 and cites §§7.1–7.6. §7.6's locator (Theorem 5.1.4, p.48; proof §5.3.6, p.55) is correct as it stands and is unchanged.

## Other change: the `Suggested.lean` docstring

The worker's signature preflight read the docstring lines beginning “class of” and “class functions” as declarations (its scratch file ended in `#check @of` and `#check @functions`). The two lines are re-wrapped so that no line begins with a Lean keyword. The word sequence is unchanged (checked with a word diff), and the file still has 0 declarations.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| gap contract (F01) | lift s over O_(L″), L″ finite over Q̆_p (HT line 795); A_s has good reduction (HT Lemma 1.3.6) | hypotheses: O_(L″) complete, residue field F̄_p perfect, A_s an abelian scheme: all met; conclusion = (1.3.4.2) at s, which is exactly the input at HT line 800 | consistent |
| gap contract, tensor type | Tate twist ℚ_p(1) | B_dR comparison carries étale ℚ_p(1) to de Rham K(1) with the period t; contract includes Tate twists | keep |
| gap contract, existence of embedding | K̄ for K finite over Q̆_p | algebraically closed, char 0, cardinality 2^ℵ₀ = |ℂ|, so K̄ ↪ ℂ exists | keep |
| §1.1 *Needs* (pattern) | route sentence “identify the p-adic absolute Hodge tensors” | needs étale_p ↔ de Rham at the lift over O_K: same contract; FFG PartII §4.4 takes Γ_K-invariant tensors as input and does not give the de Rham identification | added |
| §1.9 strictly local form | Γ₀(p) node; smooth point | k[[u,v]]/(uv): minimal primes (u),(v), quotients k[[v]], k[[u]] regular, so the statement holds; not a domain, so it is not locally integral (Example unchanged); smooth point: one regular branch | keep |
| §1.9 smooth-locality (descent) | A→B′ flat strictly local, 𝔭 minimal | A/𝔭 strictly henselian excellent domain, hence geometrically unibranch; smooth over it is geometrically unibranch; B′/𝔭B′ reduced with one minimal prime, so a domain, and 𝔭B′ is minimal in B′; by hypothesis it is normal; faithfully flat descent makes A/𝔭 normal | holds |
| §1.9 connected global form | nodal cubic control | strictly local branches 2, both regular; global component not normal (the normalization ℙ¹ separates the 2 points): global form ≠ local form, hence the G^fix=G° restriction | keep |
| §1.9 connected global form | G^fix=G°, Iwahori GL₂ | π₁(GL₂)=ℤ torsion-free, so fixer = Iwahori (connected); X₀(p)_F̄p = 2 copies of X(1) crossing at supersingular points; each component ≅ X(1), smooth, hence normal | holds |
| §1.9 connected argument | Y a component, T=π⁻¹(Y) | fibres: G°_κ(y)-torsors, geometrically irreducible; π open, so T irreducible (Stacks 004Z); T maximal, so a component of q⁻¹(Z), Z normal; q⁻¹(Z) is normal (smooth over Z), so T is a connected component, hence normal; Y normal by descent | holds |
| §4.8 I_x(Z_(p)), p=5 | scalars 1/2, 1/5; d=dim A_x=1 | 1/2: 2∈Z_(5)^×, so 1/2∈(End⊗Z_(5))^×; 1/5=f/n with 5∤n gives [n]=[5]∘f, degrees n²=25·deg f, impossible | as stated |
| §4.8, scalars in I_x(Q) | G ⊇ G_m (weight) | λ acts on V^⊗n⊗V*^⊗m by λ^(n−m); G-fixed tensors have n=m components, so they are fixed; the polarization is scaled by λ², fixed as a similitude tensor | keep |
| §4.11 Remark | −1 at p=5 | (−1)²=1, −1∈Z_(5)^×: in I_x(Z_(p)) | unchanged |
| §7.5 locator | KZ line 2370–2374 vs 2428–2439 | algebraicity on p.53, equality and descent on p.55 | repaired |

## Checks

- `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output (2.2 s). The file still has one `import Mathlib`, one module docstring, the namespace and 0 declarations. So the mechanical `#check @name` comparison had no inputs: I confirmed that no declaration exists, and nothing changed. No `TauCeti.*` import, so nothing was built.
- Dependency check (prescribed command with `--movable`), exit 0:

```text
depcheck: 245 roadmaps, 2253 edges, 0 problem(s)
```

The edge count rose from 2251 to 2253 through the added ShimuraVarieties edges. ShimuraVarieties was already a supplier and is earlier in the merge order. There is no UPWARD and no CYCLE line.

- `roadmaps resolve` on the README: no cross-roadmap citation or Lean name found nowhere.
- Gaps: 21 slugs used in README *Needs* lines, 21 declared under “Exact supplier contracts”, 21 in `design/plan.json`, all equal. `plan.json` changed only by one appended `gaps` entry (git diff: 12 added lines, nothing else).

## Ownership

The p-adic de Rham comparison of absolute Hodge tensors is not owned here; it is assigned to ShimuraVarieties §7.0i as a supplier gap. I searched by object (“Blasius”, absolute Hodge with de Rham, B_dR or crystalline) over main and the open heads:

- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII asks ShimuraVarieties §7.0i for the same comparison (`gap:integral-hodge-realization-extension`).
- ComplexMultiplicationAndExplicitReciprocityPartII asks AutomorphicBundles (extending its §1.3) for a number-field form under `gap:absolute-hodge-padic-comparison`.
- No roadmap states it as a target.

No new declaration was added to `Suggested.lean`.

## For the maintainer

- ShimuraVarieties §7.0i now receives the same contract from two roadmaps under one slug. The two `needs` sentences differ in wording: this one is the B_dR form of HT (1.3.4.2), FFG PartII's says “crystalline–de Rham comparison”. For an abelian scheme over O_K the two are equivalent through the compatibility of the crystalline, Berthelot–Ogus and de Rham comparisons.
- HodgeTateAndCanonicalSubgroups (open head, README line 693) says that AutomorphicBundles §1.2 supplies the Deligne–Blasius–Wintenberger compatibility. At AutomorphicBundles' head, §1.2 only applies ShimuraVarieties §7.0i over ℂ, and §3.7 disclaims B_dR assertions. That is outside this package.
- No name that another roadmap cites changed. The §1.9 section heading is unchanged.
- No source was fetched. `needs-references.toml` was not created.
