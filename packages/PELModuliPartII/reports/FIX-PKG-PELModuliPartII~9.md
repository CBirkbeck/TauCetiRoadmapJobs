# FIX-PKG-PELModuliPartII~9

Repair of the two findings of the review `REV-PKG-PELModuliPartII~8` (head 0130b8e). Both were
verified against the sources and the supplier's text, and both are applied. Only
`packages/PELModuliPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and
`design/plan.json` are unchanged (no new gap, no new source).

## F01 (P2) — applied

**Verification.** VectorBundlesAndIsocrystals is an open pull request that adds a new roadmap folder.
It is at merge position 124, below this roadmap's 188, and it is in this roadmap's list of permitted
suppliers. Its Layer 0, “Ramified coefficient rings and coefficient changes”, constructs `W_𝒪_E(A)`
for every `𝒪_E`-algebra A, with ghost polynomials `w_n=Σ π^i x_i^(q^(n−i))` and universal integral
operations. It states Frobenius and Verschiebung only on perfect `𝔽_q`-algebras. Its Layer 1 defines
E-isocrystals over Ĕ (“Finite isocrystals over the completed maximal unramified coefficient field”),
gives `W_𝒪_E(𝔽̄_q)[1/π]≅Ĕ` (“Mixed-characteristic supplier comparison”) and proves the slope
classification (“Dieudonné–Manin classification of finite isocrystals”).

Mih19 Definition 11.7 builds the Witt O-frame on the ring of Fargues–Fontaine §1.2 (Mih19 lines
1918–1926, reference [5] at line 2250). That is the text the supplier cites (FF §1.2), so the two
rings are the same object. Mih19 footnote 8 (lines 1960–1961) speaks of the "relative
O-isocrystal". HLSY23 lines 452–455 use the K-relative rational Dieudonné module, of K̆-dimension 2n.
The README's sentence "are new" was therefore wrong.

**Old → new.** The Mathlib bullet's "relative O-Witt vectors … and relative isocrystals … are new"
now says that the ring `W_O(R)` is VectorBundlesAndIsocrystals Layer 0 and the K-isocrystals are its
Layer 1. Other changes:
- a new subsection `### From TauCetiRoadmap.VectorBundlesAndIsocrystals`;
- a new bullet under "It leaves to other roadmaps";
- §0.1 now defines F, V and `I_O(R)` by their ghost identities, defines the relative isocrystal over
  𝔽̄_q, and adds two Checks;
- the Needs lines and Dependencies lines were updated.

**Where §0.1 differs from the supplier (repair as suggested, with additions).**
- §0.1 keeps F, V and `I_O(R)` over an arbitrary O-algebra, because the supplier states F and V on
  perfect 𝔽_q-algebras only.
- §0.1 keeps the functor from strict formal O-modules to K-isocrystals, X ↦ (P[1/π],F) over 𝔽̄_q,
  together with its full faithfulness and the biformality criterion (no slopes 0 or 1). The supplier
  owns the category of isocrystals; the old "are new" sentence covered this functor, and nobody else
  owns it.

**Changes to the reviewer's text.**
- The reviewer cited only Layer 1's first heading for the slope classification. The classification
  is that layer's “Dieudonné–Manin classification of finite isocrystals”, and the identification of
  `W_O(𝔽̄_q)[1/π]` with K̆ is its “Mixed-characteristic supplier comparison”; both are cited.
- The reviewer's Check on the uniformizer is replaced by one with computed values over R=𝔽_p.

**Pattern repaired at other places.**
- §1.5 Route and Needs.
- §2.3 Route and Needs: "the same isocrystal" is now "the same relative isocrystals (§0.1)".
- §5.4: N is now the relative isocrystal of §0.1.
- §5.8 and §5.9 Routes: "relative Dieudonné full faithfulness" now cites the §0.1 functor.
- The Suppliers lines of the Dependencies of Layers 0, 1, 2 and 5.
- The ownership sentence of Scope and ownership.

## F02 (P3) — applied

**Verification.** LZ22 line 2883 (Remark 10.2.1, p. 65) says that on generic fibres π₂: Ñ → Z(x₀) is
an isomorphism, and diagram (10.2.0.3) at lines 2864–2867 shows the factorization. §2.4 already
defines Z(x₀).

**Old → new.**
- §2.5: "π_2 is an isomorphism onto its image" → "π_2, as a map to the special divisor Z(x₀) of
  §2.4, is an isomorphism, so the image of π_2 in the generic fibre of `N_{n+1}` is the generic fibre
  of Z(x₀)".
- Layer 2 introduction: "…onto its image" → "…onto the special divisor Z(x₀) of §2.4".
- §2.5 Route: the last sentence now recovers the isogeny from the lift of x₀, which exists exactly
  over Z(x₀).
- §2.5 gets a new Check, a dimension count at n=2.

**Pattern.** "onto its image" occurred only in these two places. §9.10 and the Downstream consumers
already name Z(x₀) correctly.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 ghost identity for F | Teichmüller [a]=(a,0,0,…) | w_n([a])=a^(q^n); w_n(F[a])=w_{n+1}([a])=a^(q^(n+1))=w_n([a^q]), so F[a]=[a^q], the supplier's φ([a])=[a^q] | pass | none |
| §0.1 V and FV=π | universal x; n=0 and n≥1 | w_n(Vx)=Σ_{i≥1}π^i x_{i−1}^(q^(n−i))=π·w_{n−1}(x); w_0(Vx)=0; w_n(FVx)=w_{n+1}(Vx)=π·w_n(x)=w_n(πx) | pass | stated |
| §0.1 projection formula | universal a, x | w_n(V(F(a)x))=π·w_n(a)·w_{n−1}(x)=w_n(a)·w_n(Vx) for n≥1; both sides are 0 at n=0 | pass | API bullet |
| §0.1 I_O(R)=V W_O(R)=ker w_0 | R=0; R=𝔽_p with O=ℤ_p[√p] | W_O(0)=0 and all three are 0; W_O(𝔽_p)=O_K, ker(O_K→𝔽_p)=(√p)=√p·O_K=V(O_K) | pass | none |
| §0.1 Check: O=ℤ_p, π=p agrees with Mathlib | n=1 ghost; F, V | x₀^p+p·x₁ is Mathlib's `wittPolynomial p ℤ 1`; `ghostComponent_frobenius`: w_n(Fx)=w_{n+1}(x); `ghostComponent_verschiebung`: w_{n+1}(Vx)=p·w_n(x) (Mathlib `RingTheory/WittVector/Frobenius.lean:240`, `Verschiebung.lean:136`) | pass | Mathlib names in the supplier bullet |
| §0.1 Check: K=ℚ_p(√p) over 𝔽_p | F, V on W_O(𝔽_p)=O_K | q=p, so F lifts the identity of 𝔽_p and is the identity; V=π·F⁻¹=√p, with image (√p)=I_O(𝔽_p) | pass | Check added |
| §0.1 Check: π→−π | coordinates x_i'=(−1)^i x_i, q odd | w'_n(x')=Σ(−1)^(i(1+q^(n−i)))π^i x_i^(q^(n−i))=w_n(x), because 1+q^(n−i) is even; transported V' gives w_1=−π·x₀, so V'=−V; over 𝔽_p, V=√p and V'=−√p | pass | Check added |
| §0.1 Check: wrong model, V normalized by p | O_K=ℤ_p[√p], R=𝔽_p | (p/π)V is multiplication by p=√p², with image (p)⊊(√p)=I_O(𝔽_p), so it has no inverse on I_O and gives no frame; for O=ℤ_p (π=p) the two coincide | pass | Check added |
| §0.1 relative isocrystal: dimension and F bijective | Lubin–Tate module of K unramified of degree 2 (q=p²); normal decomposition P=T⊕L | relative K̆-dimension 1 against absolute ℚ̆_p-dimension 2 (=height); F=(F\|_T)⊕(π·Ḟ\|_L) is bijective after inverting π | pass | Check added |
| §0.1 biformal ⇔ no slopes 0 or 1 | LT module (rel. height 1, dim 1); its dual; rank-one sources (rel. height 2, dim 1, supersingular) | covariant LT: P=W, Q=I, F a unit times σ, slope 0, not biformal (existing third Check: dual étale); dual: Q=P, slope 1; sources: slopes 1/2, 1/2, biformal | pass, consistent with the third Check | none |
| §0.1 full faithfulness over 𝔽̄_q | f an F-equivariant K̆-linear map of rational displays | π^m f maps P into P′; since Q=πF⁻¹P (V=πF⁻¹ over a perfect field), it maps Q into Q′ and commutes with Ḟ=V⁻¹ | pass | API bullet |
| §5.4 N = relative isocrystal | n=2, 3; τ=ΠV⁻¹ | K̆-dimension 2n=4, 6 (Check: 6 for n=3); slope of τ = 1/2 (F) + 1/2 (u) − 1 (V=ϖF⁻¹) = 0, so C=N^{τ=1} has L-dimension n | pass | none |
| §5.8 Check (recomputed) | n=2 | L-dimension 2 against relative-isocrystal K̆-dimension 2n=4 | pass | none |
| §2.5 generic π₂ | n=2, q=3; wrong reading "image = generic fibre of N_3" | Ñ_2 finite over N¹_2: relative dimension 1; Z(x₀) is a divisor in N_3: 2−1=1; N_3: 2; π₁ has degree q+1=4 | pass; the wrong reading is excluded | Check added |
| §2.5 against §2.4 and §9.10 | Z(x₀) of §2.4; LRZ26 Theorem 14.6.2 in §9.10 | the generic isomorphism onto Z(x₀) agrees with "π₂ factors through Z(x₀)" (§2.4) and with the integral exceptional fibres over a zero-dimensional centre (§9.10); no integral isomorphism is claimed | pass | none |
| Layer 2 introduction | the same | "generically an isomorphism onto Z(x₀)" matches §2.5 | pass | changed |
| Supplier subsection | Layer 0 hypotheses (E of characteristic zero, residue field 𝔽_q, any 𝒪_E-algebra); Layer 1 (k=𝔽̄_q, v(π)=1) | O is the ring of integers of a finite K/ℚ_p (characteristic zero); our framings live over 𝔽̄_p=𝔽̄_q; slope normalization v(π)=1 is the one of Mih19 footnote 8 | pass | stated |

The other targets were not changed. Context and generality: `Suggested.lean` has no declaration, so
no `variable` block can drop a hypothesis.

## Checks

- **Elaboration.** `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content
  checkout, exits 0 with no output. The file is unchanged: one `import Mathlib`, one module
  docstring, no declaration.
- **`#check @name` audit.** `Suggested.lean` has 0 declarations, so 0 types were compared and nothing
  changed. Neither finding makes a headline statable at the pins: the relative Witt ring, the
  K-isocrystals and the formal schemes Ñ_n and Z(x₀) are not at the pinned Mathlib or Tau Ceti. The
  pinned Tau Ceti `RingTheory/WittVector/Window` concerns Fargues–Fontaine radius windows, not Zink
  windows.
- **Dependency check.** Exact output:

```text
depcheck: 238 roadmaps, 2260 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The new edge goes from PELModuliPartII (188) to
  VectorBundlesAndIsocrystals (124), which is downward. VectorBundlesAndIsocrystals does not cite
  PELModuliPartII.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name
  "found nowhere". The four cited headings of VectorBundlesAndIsocrystals were matched verbatim
  against its open head: “Ramified coefficient rings and coefficient changes”, “Finite isocrystals
  over the completed maximal unramified coefficient field”, “Mixed-characteristic supplier
  comparison” and “Dieudonné–Manin classification of finite isocrystals”.
- **Mathlib names.** `WittVector.ghostComponent` (`Basic.lean:296`), `WittVector.frobenius`
  (`Frobenius.lean:218`) and `WittVector.verschiebung` (`Verschiebung.lean:109`) all exist at the pin,
  in namespace `WittVector`.
- **README lint.** No line has an odd number of backticks. There is no LaTeX delimiter, no machine
  path and no process word.

## Ownership (search by object, main and open heads)

- **The ring W_O(A) for an arbitrary algebra.** The only owner is VectorBundlesAndIsocrystals Layer
  0. PadicDifferentialEquationsAndRigidCohomology §RD.0.54 and EndoscopicTransferAndUnitaryTraceComparison
  (the ramified period rings) build `W_{O_E}` on perfect inputs only.
- **K-isocrystals.** VectorBundlesAndIsocrystals Layer 1 states the category and the classification.
  Its mixed-characteristic classification is transported from PadicDifferentialEquationsAndRigidCohomology
  §RD.1.32; citing Layer 1 imports it as stated there.
- **PELModuli §M2.15 "polarized O-displays".** These are Zink displays over the p-typical W(R) with an
  O-action, not windows over W_O(R), so there is no second owner of §0.1's O-displays.
- **The Witt O-frame over an arbitrary O-algebra, and the relative isocrystal functor of a strict
  formal O-module.** No other owner was found, so §0.1 owns them.

## For the maintainer

- This roadmap now names VectorBundlesAndIsocrystals, an open pull request that adds a new folder, as
  a supplier. That roadmap must merge first; the merge order already places it at 124.
- RelativeFarguesFontaine (open, merge position 127) reads VectorBundlesAndIsocrystals Layer 0 as
  supplying Frobenius and Verschiebung on arbitrary algebras. One example is its "Ramified coefficient
  inputs": "Teichmüller representatives, Frobenius and Verschiebung, with `FV_π=π`". The supplier's
  text states them on perfect 𝔽_q-algebras only, so §0.1 owns F, V and `I_O(R)` over an arbitrary
  O-algebra, as the reviewer proposed. If VectorBundlesAndIsocrystals is revised to state them for
  every algebra, §0.1 should cite that statement instead of defining them.
- No name that other roadmaps cite changed. No roadmap cites PELModuliPartII.
- Ownership against open pull requests was checked with `roadmaps grep`, `roadmaps show` and
  `roadmaps resolve` (index of 2026-11-15T22:47:16Z).
