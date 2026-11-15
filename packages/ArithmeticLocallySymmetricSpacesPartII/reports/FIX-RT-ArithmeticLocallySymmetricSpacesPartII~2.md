# FIX-RT-ArithmeticLocallySymmetricSpacesPartII~2

Repair of red-team round 2 (passes a and b) on the ArithmeticLocallySymmetricSpacesPartII package. Files changed: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md`, `packages/ArithmeticLocallySymmetricSpacesPartII/design/plan.json` (top-level `gaps`, entry `canonical-dimension-zero` only), `packages/ArithmeticLocallySymmetricSpacesPartII/sources.toml` (aw13 locator and two `cited_for` strings). `Suggested.lean` and `metadata.toml` are unchanged. The two reviews overlap in one place (2a/F03 and 2b/F02), settled once below.

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F01 (P2) — applied

Changed: §5.2 "identifies H_!^i with H_cusp^i" → "H_cusp^i injects into H_!^i (§ALS.5b.5); only this inclusion is used"; §5.2 route: boundary kernel is H_!^i, automorphic H_cusp a subspace; §5.7 "H_cusp¹=H_!¹" → "H_cusp¹⊆H_!¹" plus dim H_cusp²=dim H_cusp¹ from the §ALS.5b.5 decomposition; §5.8 "=dim H_!^i" → "≤dim H_!^i".

Evidence: ArithmeticLocallySymmetricSpaces §ALS.5b.5 gives only an injection with image in H_!; equality needs `FrankeInput` (§ALS.5b.4). fgt10 line 133 calls the boundary kernel H_cusp, and line 154 cites Borel for (1.5).

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F02 (P2) — applied

Changed: §5.3 gains an API list owning SL₂(ℤ)=⟨S₄⟩∗_{⟨−I⟩}⟨−S₃⟩ (route: fundamental domain, FreeGroupsAndLimitGroups §§4.8, 4.5) and the degree ≤1 amalgam sequence (route: `Monoid.PushoutI.lift` on crossed homomorphisms), the dimension formula, Shapiro (`groupCohomology.coindIso`), two Checks; *Needs*, Layer 5 Dependencies, Mathlib contract and a FreeGroupsAndLimitGroups contract extended.

Evidence: no supplier earlier in the order, on main or at the pins states either fact. ModularCurvesPartII §15.4 has the sequence only for its §15.2 amalgam; FreeGroupsAndLimitGroups §4.8 names SL₂(ℤ) only as an example; pinned `TauCeti.GraphOfGroups` has no cohomology.

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F03, RT-ArithmeticLocallySymmetricSpacesPartII~2b/F02 (P2) — applied

Changed: gap `needs` (README and plan `gaps`) → p odd, G=∏ first congruence kernels, A=ℚ_p⊗ℤ_p[[G]]; define j_A and canonical dimension 3m−j_A; prove "0 ⇔ finite-dimensional". Supplier section §F.1 → §0.12. Locator adds aw13 §2.5, Definition, p. 9. Checks add the lattice W_k⁰ (integral value 1) and A/Aδ.

Evidence: NoncommutativeAndEquivariantIwasawa §0.11 defines canonical dimension only over O[[G]] and k[[G]], and its §0.12 holds the rational global dimension. aw13 §10.12 (lines 3598–3604) has no "deformation index".

2b's "every uniform G" is not adopted: a gap asks only what the package needs, and aw13 Lemma 10.13 is stated in the §10.12 setting. aw13 line 3602, read as m>0 or as m⩾0, reaches the first congruence kernel through the finite-index grade invariance of §F.1.

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F04 (P3) — applied

Changed: appended to the Scope paragraph that BianchiModularForms §1.3's E_k is this roadmap's E_{k−2}, with κ=2k−2; that its H¹_cusp (§1.2) is H¹_! at neat level and contains the automorphic cuspidal cohomology; and that `weightRep` differs by covering every number field and embedding tuple.

Evidence: read at BianchiModularForms's head. It is at merge-order line 196, before this roadmap (line 199).

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F05 (P3) — applied

Changed: Layer 1 Dependencies gained NoncommutativeAndEquivariantIwasawa §0.5 and §0.8. Layer 3 Dependencies gained Mathlib `Matrix.SpecialLinearGroup.map`, `Matrix.SpecialLinearGroup.toGL`, `PiTensorProduct.mapMonoidHom`, `MonoidHom.pi` and Tau Ceti `TauCeti.symPowerRep`.

Pattern: a script compared every layer's *Needs* union with its Dependencies after all edits. Layers 4 and 5 received this round's new items; every layer now agrees.

## RT-ArithmeticLocallySymmetricSpacesPartII~2a/F06 (P3) — applied

Changed: §2.3 "(fu24, §6, p. 23, equation (34) and following inequalities.)" → "(fu24, §6, equation (34), p. 22, and the inequalities following it, p. 23.)".

Evidence: fu24 line 1123 has (34) on p. 22, and p. 23 starts at line 1126. Pattern: the other (33)/(34) locators (§2.1, §2.2, gap:skew-rank) give ranges that contain p. 22 and are correct.

## RT-ArithmeticLocallySymmetricSpacesPartII~2b/F01 (P2) — applied

Changed: AutomorphicFormsOnReductiveGroups contract rewritten (§2.3 induction and circle convention, §2.4 discrete series, §5.4 exhaustion); Scope sentence updated; §4.1 definitions carry these locators; route adds "the exhaustion statement of §5.4". *Needs* and Layer 4 Dependencies: "§§5.2–5.3" → "§§2.3–2.4; §§5.2–5.4".

Evidence: read at that roadmap's head. §6.8 is not cited: §2.4 already owns both D_k^± for SL₂(ℝ), and §6.8 at n=1 is the same D_k⁺.

## RT-ArithmeticLocallySymmetricSpacesPartII~2b/F03 (P3) — applied

Changed: §3.2 "outside all primes where a product … is nonmaximal" → "outside the primes below a place v where K_v≠SL₂(O_v)"; the route is rewritten the same way; the witness is a new negative Check; E7 is reworded (the only other occurrence).

Evidence: diag(p²,1)SL₂(ℤ_p)diag(p²,1)⁻¹ is maximal compact, since diag(p²,1)=p·diag(p,p⁻¹). Its upper-right entries lie in p²ℤ_p, so it does not contain (1 p;0 1)∈G.

## Checks run

**Elaboration.** `lake env lean packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean`, run from the content checkout. The Tau Ceti object file was present.

```text
Suggested.lean:73:8: warning: declaration uses `sorry`
Suggested.lean:92:8: warning: declaration uses `sorry`
```

No errors. The file is unchanged this round.

**Signatures.** I put `#check @name` for all four declarations (and for the four new Mathlib names the README cites) into one scratch file and elaborated it once. The elaborated types of `embeddingStdRep`, `weightRep`, `finrank_groupCohomology_weightRep_le` and `bianchi_groupCohomology_linear_growth` are the same as in the worker's `signatures.md` and match README §3.1, §4.2 and §5.8 (binders, hypotheses `¬IsTotallyReal F`, `[IsTotallyComplex F]`, `finrank ℚ F = 2`, `𝔞 ≠ ⊥`, kernel ≤ Γ; quantifier order ∃C ∀t ∀i ∀a and ∃c C, 0<c, ∃n₀). Nothing changed.

The new library names exist at the pin with the content the README states:

- `Monoid.PushoutI.lift` (GroupTheory/PushoutI.lean:102);
- `ModularGroup.exists_smul_mem_fd` (NumberTheory/Modular.lean:426);
- `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` (:795);
- `groupCohomology.coindIso`: `H^n(G, coind S.subtype A) ≅ H^n(S, A)`.

**Dependency check** (after all edits):

```text
depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Before the edits it read `2240 edges, 0 problem(s)`; the open-PR index was refreshed between the runs. The new suppliers are FreeGroupsAndLimitGroups (on main) and BianchiModularForms (merge-order line 196).

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. That tool did not check library names, so I checked them by hand as above.

## Gate failures

**tex=8.** The README had eight TeX-style brace subscripts or superscripts outside code spans. Each one is now a code span, Unicode prose or a Unicode superscript; the mathematics is unchanged:

- Scope paragraph: `E_{k−2}`, now in a code span.
- gap:canonical-dimension-zero contract: "`dim_{ℚ_p} M` is finite" → "M is finite-dimensional over ℚ_p". The plan.json `needs` sentence had no braces and is unchanged.
- Its Check: `dim_{ℚ_p} W_k = D(k+1)`, now in a code span.
- §5.3 tree proof: `e^{πi/3}`, now in a code span.
- §5.3 vanishing: `W^{⟨−I⟩}=0`, now in a code span.
- §5.3 Check: `e^{∓2πi/3}` and `e^{±2πi/3}`, now in code spans, and `Sym^{10}(ℂ²)` → Sym¹⁰(ℂ²), matching the Sym²(ℂ²) next to it.

A rescan of the README finds no `_{` or `^{` outside code spans. `Suggested.lean` is unchanged. After this repair the dependency check again reads `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.3 SL₂(ℤ)=⟨S₄⟩∗_{⟨−I⟩}⟨−S₃⟩ | S₃=(0 −1;1 −1); S₄; abelianisations; amalgam over trivial group | S₃³=I, S₄²=(−S₃)³=−I; S₃ fixes e^{πi/3}, S₄ fixes i; ℤ/4⊕ℤ/6/⟨(2,−3)⟩=ℤ/12, free product gives order 24 | holds; edge stabilizer ⟨−I⟩, no inversion (endpoint stabilizers of orders 6 and 4) | Check added |
| §5.3 low-degree amalgam sequence | D_∞=ℤ/2∗ℤ/2 with W=ℂ and W=sign | 1−2+1−h¹=0 gives h¹=0=dim Hom(D_∞,ℂ); sign: W^H=ℂ gives h¹=1=dim H¹(ℤ,ε)^{ℤ/2} | holds; exactness at each term checked by crossed homomorphisms | stated, route given |
| §5.3 dimension formula | W=ℂ; Sym²; Sym^{10}; ℂ² | 1−1−1+1=0; 3−1−1+0=1=2·0+1; S₄-fixed j odd: 5, −S₃-fixed j≡2 mod 3: 3, 11−5−3=3; ℂ²: true 0, formula without the −I hypothesis 2 | holds; −I hypothesis needed | Checks added |
| gap:canonical-dimension-zero | W_k; A; A/Aδ; W_k⁰ over Λ; zero module | j=3m, cd 0, dim D(k+1); j=0, cd 3m; j=1 (Hom=0, Ext¹=A/δA≠0), cd 3m−1≥2; integral (3m+1)−3m=1 against rational 0; excluded | precise, minimal, rational normalisation | needs, section, Checks |
| §3.2 choice of p | F=ℚ, K_f=SL₂(Ẑ); level Γ(3); K_p=diag(p²,1)SL₂(ℤ_p)diag(p²,1)⁻¹ | every p admitted; p=3 excluded; (1 p;0 1) needs b=1/p∉ℤ_p, so G⊄K_p, and p is now excluded | holds | statement, route, Check, E7 |
| §5.2 inclusion H_cusp⊆H_! | Γ₁(5) Check of §ALS.5b.5; boundary kernel | H¹_cusp=H¹_!=0, H¹=ℂ³; kernel of H→H(∂) is im(H_c→H) by exactness | holds | wording |
| §5.7 dim H_cusp²=dim H_cusp¹ | n=0; n>0; trivial π_∞ | unitary SL₂(ℂ)-modules with cohomology against E_n: π_{2n+2,0} in degrees 1, 2 (q₀=ℓ₀=1, binom(1,0)=binom(1,1)=1); trivial only in degrees 0, 3 and not cuspidal | holds for every n | added |
| §5.8 neat chain | ℚ(i), Γ neat, n=99 | H_cusp¹ ≥ (1/3)·100+O(1); H_!¹ between H_cusp¹ and H¹ ≤ C·100; H_c^i ≥ H_!^i, ≤ H_!^i+2c | holds | "=" → "≤" |
| BianchiModularForms comparison | k=2, 4 | E₂=ℂ ↔ n=0, κ=2; dim 9=(n+1)² at n=2, κ=6=2·4−2 | holds | Scope sentence |
| §4.1 archimedean ownership | Res PGL₂ at (r₁,r₂); κ_v=2 real | ℓ₀=r₂, 2q₀+ℓ₀=2r₁+3r₂ so q₀=r₁+r₂; weight 2 is inside §2.4's k≥2 range | holds | citations only |
| fu24 (34) | page markers | (34) at line 1123 on p. 22; lower bound at lines 1140–1142 on p. 23 | corrected | locator |

## For the maintainer

- **Ownership against open work.** I checked by object with `roadmaps grep` over main and the open heads.
  - CohomologyOfGroups §3.6, an open pull request that is not in the merge order, plans the amalgam Mayer–Vietoris sequences in all degrees. It cannot be a supplier here, so §5.3 states only the degree ≤1 part it needs, for an arbitrary amalgam (the notion moves down). If CohomologyOfGroups is later placed before this roadmap, §5.3's second API fact can become a citation of its §3.6.
  - No owner exists for SL₂(ℤ)≅ℤ/4∗_{ℤ/2}ℤ/6 as a theorem: FreeGroupsAndLimitGroups §4.8 on main and CohomologyOfGroups §3.6 mention it only as an example.
  - No `Suggested.lean` name is the qualified name of a declaration in another roadmap.
- **Gap moved.** gap:canonical-dimension-zero is now assigned to NoncommutativeAndEquivariantIwasawa §0.12, not §F.1, and asks for the rational grade and canonical dimension. gap:skew-rank is unchanged (§F.1).
- **New supplier on main.** FreeGroupsAndLimitGroups §§4.5 and 4.8, with a contract paragraph. The AutomorphicFormsOnReductiveGroups contract now also names §§2.3, 2.4 and 5.4.
- **plan.json nodes.** `design/plan.json` node entries keep their old wording ("nonmaximal" in WM.3/split-auxiliary-prime, E7, and the earlier gap slugs). Only the top-level `gaps` list may change at this stage.
- **Names.** No Lean name changed, was added or was removed. No other roadmap cites this one.
- **Untrusted text.** Neither review contained instructions addressed to the repairer beyond its findings. No source is missing; `needs-references.toml` was not written.
