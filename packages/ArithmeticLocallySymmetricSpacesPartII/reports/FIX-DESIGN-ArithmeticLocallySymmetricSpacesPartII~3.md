# FIX-DESIGN-ArithmeticLocallySymmetricSpacesPartII~3

Files edited: `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md` and `packages/ArithmeticLocallySymmetricSpacesPartII/design/plan.json`. `sources.toml` is unchanged: no new work is cited, and the manifest's broad fu24 §6 locator still covers the corrected pages. This package is at the design stage and has no `Suggested.lean`, so no Lean elaboration or `#check @name` comparison applies in this round.

## F01 (P1) — applied

The §5.4 ℓ=3 Check (README and plan `WM.5/ramified-finite-types` acceptance) said the supercuspidal traces were (−1,−2); it now says (S₃,S₄)=(−1,2). The Check now also gives the evaluation 2(−1)^0=2, the central parity −ω₃(−1)=+1, an independent witness (the type factors through GL₂(𝔽₃)/Q₈≅S₃, and Q₈ contains S₄, so σ(S₄)=1), and the ℓ=7 value 2(−1)^1=−2. The API formula is unchanged.

Evidence: fgt10 line 1394 (Lemma 4.19, p. 26) gives `2(−1)^((p−3)/4)` for p≡3 mod 4. At p=3 this is +2. Independently: ν₃=1, and parity +1 means the 2-dimensional cuspidal representation of GL₂(𝔽₃) is trivial on the centre {±I}. So it factors through PGL₂(𝔽₃)≅S₄. The only 2-dimensional irreducible representation of S₄ factors through S₃, so the kernel contains Q₈∋S₄. The trace at S₄ is therefore 2, and the 3-cycle image of S₃ has trace −1.

## F02 (P2) — applied

At this round's head (`roadmaps show ModularSymbolsPadicLFunctions`), ModularSymbolsPadicLFunctions §0.7 states Eichler–Shimura for every finite-index Γ, compatible with every double-coset and normaliser action. Every γ∈SL₂(ℤ) normalises Γ(N). So the claimed ownership was a duplicate. The changes:
- Scope (README line 11): "owns its finite-quotient equivariant refinement" → the supplier provides Eichler–Shimura with the SL₂(ℤ/Nℤ)-action; only the fixed-type multiplicity formula is owned here.
- Supplier contracts for ModularSymbolsPadicLFunctions and ModularForms: equivariance is now imported. The contracts quote the period identity ψ_{f|δ}=ψ_f(δ·)|δ and §10C's automorphy line bundle with Riemann–Roch.
- §5.3 statement: the "Own the … equivariant refinement" sentence is replaced by the action convention g·f=f|_kγ⁻¹.
- §5.3 route: §ALS.5b.5 and the separate N=1,2 construction are dropped, in the README and in the plan proof steps, prerequisites and `own` field. §ALS.5b.5 also leaves the Layer 5 Dependencies.

Applying the repair surfaced a further defect in the old route. It said "Equivalently compute the parabolic cohomology Euler characteristic". That is not equivalent. The map f↦f^c makes S̄_k ≅ S_k∘Ad ι with ι=diag(−1,1), so the cohomology computes m(σ)+m(σ^ι). That is 2m(σ) only when σ^ι≃σ. This holds for restrictions of GL₂(ℤ/Nℤ)-representations, which is the case §5.6 consumes. A general σ needs the holomorphic Lefschetz (equivariant Riemann–Roch) count on X(Γ(N)), and the route now says so. I added a negative-control Check: dim S₄(Γ(3))=1 and SL₂(𝔽₃) acts on it by ω or ω̄, so the two multiplicities are 1 and 0, while H¹_par≃ω⊕ω̄ gives 1 for both. The statement keeps fgt10 Proposition 4.18's generality (all σ).

## F03 (P3) — applied (with one locator chosen as pp. 22–23 instead of p. 23)

Verified against the fu24 page markers: page 22 starts at line 1065, page 23 at line 1126, page 13 at line 606 and page 14 at line 676. Line 1120 (identities inside the proof of Theorem 1.4) is on p. 22. Lines 1128–1138 (cyclic filtration and summed bound) are on p. 23. Equation (16), lines 663–675, is on p. 13. Changes, each made in both the README and the plan:
- §1.1: "p. 21, identities preceding the proof" → "p. 22, identities in the proof of Theorem 1.4".
- §1.2: "pp. 21–22" → "pp. 22–23".
- §1.3: "pp. 21–22" → "p. 23".
- §1.4: "pp. 21–22" → "pp. 22–23". Its statement includes the H₀/Hom equality on p. 22 (line 1120) as well as the bound on p. 23.
- E8: "p. 14" → "p. 13".

The §0.3 locator (pp. 21–22, eq. (32) at line 1113) is correct and kept. The other "§6, pp. 21–23" ranges stay: §6 starts on p. 21 (line 1044).

## Checks

Dependency check, verbatim:

```text
candidate: ArithmeticLocallySymmetricSpacesPartII is not in the merge order yet; checked as if placed after CompletedCohomologyPartII (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 634 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. ModularSymbolsPadicLFunctions is earlier in `merge-order/ORDER.txt` (line 92).

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name that resolves nowhere. Its note says that Lean names outside TauCetiRoadmap were not checked on this host. `plan.json` parses as JSON.

No gate failures were listed for this round. Elaboration was not run: there is no `Suggested.lean` at the design stage.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §5.4 supercuspidal S₄ trace | ℓ=3; ℓ=7; ℓ=5 | 2(−1)^0=2; 2(−1)^1=−2; 5≢3 mod 4 gives 0 | Check corrected to +2 |
| §5.4 ℓ=3 parity | ω₃(−1)=(−1,−3)₃=(−1/3)=−1 | parity −(−1)=+1; σ(S₄)²=σ(−I)=1 | consistent with trace 2 |
| §5.4 ℓ=3 via S₃ quotient | GL₂(𝔽₃) of order 48, Q₈ of order 8 | quotient of order 6, nonabelian; S₄∈Q₈ gives trace 2; 3-cycle gives −1 | agrees with fgt10 line 1388 |
| Action g·f=f\|γ⁻¹ | −I; γ∈Γ(N) | f\|(−I)=(−1)^k f, matching σ(−I)=(−1)^k; Γ(N) acts trivially | well defined on G_N |
| f^c intertwining | general γ=(a b;c d) | (f\|γ)^c(z)=(−cz+d)^{−k}·conj f(γ(−z̄))=(f^c\|ιγι)(z) | S̄≅S∘Ad ι |
| H¹_par multiplicity | σ=τ restricted from GL₂; σ=ω on SL₂(𝔽₃) | τ^ι≅τ via τ(ι), giving 2m; ω^ι=ω̄ since ιTι=T⁻¹ | sum only, so route split |
| Γ(3), k=4 Check | μ=12, ε₂=ε₃=0, ε∞=4 | g=1+1−2=0; dim S₄=3(−1)+1·4=1; S₄(SL₂(ℤ))=0 | nontrivial character; m(ω)+m(ω̄)=1 |
| Leading term at Γ(3), k=4 | σ=ω | (k−1)/12=1/4, with m∈{0,1} | within O(1) |
| Supplier index shift | S_{k+2}↔V_k | S_k↔V_{k−2}; k=4 gives V₂ of dim 3 | used consistently |
| fu24 locators | lines 1120, 1128–1138, 663–675 | pp. 22, 23, 13 | corrected |

## Notes for the maintainer

- No name that other roadmaps cite changed. This package has no Lean names.
- §5.3 no longer claims ownership of an equivariant Eichler–Shimura. It relies on ModularSymbolsPadicLFunctions §0.7 compatibility with normaliser actions, as that section is stated at its open head. If that section's statement is narrowed, §5.3's route must be revisited.
- Ownership against open pull requests: only the ModularSymbolsPadicLFunctions overlap was re-examined. It was read at its head with `roadmaps show`.
- No suspicious instructions were found in the review text.
