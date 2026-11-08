# Review of AlgebraicModularFormsAndSerreWeightsPartII (pull request #1822 at e1209cb)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since 8b4efa8 (four sentences of `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md`, nothing else in the folder, nothing outside it). The one finding of the previous review is repaired, the repair introduced no new problem, the gate passes, the dependency check shows no UPWARD or CYCLE line, and the unchanged `Suggested.lean` elaborates at the pins with `sorry` as its only warning. No finding remains.

## Previous findings

- R01 — repaired: README line 434 now reads "the paramodular model is that of ShimuraCompactifications Layer 7 (gap:siegel-parahoric-models)"; line 991 "imported from ShimuraCompactifications Layer 7 (gap:siegel-parahoric-models); the fundamental class and trace require SchemeAndStackFoundations §§2.19–2.20 (gap:lci-fundamental-class)"; line 1018 "the fundamental class of SchemeAndStackFoundations §§2.19–2.20 (gap:lci-fundamental-class)"; line 1272 "requested from HodgeTateAndCanonicalSubgroups §§5.1–5.2 (gap:siegel-igusa-full-frames)". The phrases "Siegel parahoric models contract", "lci fundamental class contract" and "Siegel Igusa full frames contract" occur nowhere in the README now (the only remaining matches of "contract" are the `## Exact supplier contracts` heading and the word "contraction" in Layer 8).

## Verified sound

**The four changed sentences.** Each new citation names the supplier and section that `design/plan.json` records for the same slug (siegel-parahoric-models → ShimuraCompactifications, Layer 7; lci-fundamental-class → SchemeAndStackFoundations, 2.19–2.20; siegel-igusa-full-frames → HodgeTateAndCanonicalSubgroups, 5.1–5.2) and matches the contract sentence under `## Exact supplier contracts` (README lines 93, 119, 111). Slug occurrence counts moved exactly by the diff: `gap:siegel-parahoric-models` 14 → 16, `gap:lci-fundamental-class` 5 → 7, `gap:siegel-igusa-full-frames` 6 → 7; the other five slugs are unchanged (open-formal-milnor 4, siegel-logarithmic-de-rham 4, siegel-rank-one-deformations 4, siegel-isogeny-trace-ideals 6, reduced-section-propagation 3); 8 slugs in the README, 8 in `plan.json`, identical sets. The sentences remain consistent with their sections: §3.5 still takes the spherical model from ShimuraCompactifications §7.3 and only the paramodular model from the gap; §7.5 and §7.6 still construct the integral correspondence before coefficient reduction; §9.2 still conditions the finite-level flat-cokernel statement on the component-detection hypothesis of the gap.

**Cross-roadmap citations resolved at the suppliers as they are now.** ShimuraCompactifications at the head of its open pull request: `## Layer 7: integral PEL compactifications` (its README line 2220), `### 7.3 Integral toroidal compactifications` (2295); §§7.4, 7.10, 7.12, 7.16, 4.9, 4.10 cited in the contract block at lines 2330, 2436, 2484, 2577, 1654, 1679. SchemeAndStackFoundations on main: `### 2.19 The right adjoint of pushforward and the upper shriek functor` (line 4094), `### 2.20 Relative dualising complexes and modules, Serre duality, curve comparison` (4275); also §0.6 (678), §2.6 (3437), §2.7 (3482), §4.9 (5448). HodgeTateAndCanonicalSubgroups at the head of its open pull request: `### 5.1 Igusa torsors of the dual canonical subgroup and the ordinary inverse tower` (1371), `### 5.2 Igusa trivialisations and the full p-level tower` (1392); §§0.12, 0.14–0.16 at 381, 416, 438, 451. AbelianSchemesAndArithmeticModuli (gap suppliers, unchanged by the diff) at its open head: A4.3 (1900), A4.7 (2109), A4.9 (2344), A4.10 (2362), A4.11 (2390). Merge order: AbelianSchemesAndArithmeticModuli line 41, ShimuraCompactifications 150, HodgeTateAndCanonicalSubgroups 171, this roadmap 240, GSp4NonregularModularityLifting (consumer only) 268. The citation lead `Lang.lang_surjective` is ReductiveGroupsPartII `Suggested.lean` on main, as in the previous two reviews.

**Gate and dependency direction.** Re-run of the gate on this head:

    gate AlgebraicModularFormsAndSerreWeightsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's gate on the same head additionally reports build=0. Re-run of the dependency check with `--movable`:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Suggested.lean.** Byte-identical to c6dbce7 (`git diff --stat c6dbce7 HEAD -- Suggested.lean` is empty), so identical to the file the previous two reviews read. Elaborated with `lake env lean` at the pins: exit 0, one warning, `declaration uses 'sorry'` at line 71. The elaborated type of `relIndex_conj_diag_eq_tameIndex_mul` in the worker's signature file is the README §5.2 statement (p prime, p coprime to N, Γ(N) ≤ Γ, relative index of diag(p,1)Γ_ℚdiag(p,1)⁻¹ in Γ_ℚ equals (p+1) times the relative index of the conjugate of the mod-N image in it); 0 declarations lose a section binder. Header `module` / `public import Mathlib` / `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic`; no `set_option`, no `lemma`, no sorry'd data. The one-tactic probe and the proof of truth are carried from the first review, which read the same file.

**Headline theorems.** Unchanged: only the arbitrary-tame-level degree identity (§5.2) is statable at the pins and it is stated; the geometric headlines (§§1.4, 2.3, 3.2, 3.4, 3.7, 4.3–4.4, 5.6–5.7, 6.3, 7.4–7.6, 8.4–8.7, 9.2–9.4) are named in the module docstring with the carriers they lack. No stand-in, no padding.

**Seeded sample, where it falls in the changed passages** (§7.6 and §9.2 are sampled targets whose supplier sentence changed; §3.5 and §7.5 are the other two changed subsections; the remaining sampled targets are untouched by the diff and were not re-read):
- 7.6 Integral T and Q₂ on global forms: CG20 line 2366 (Lemma 8.8, printed p. 60: T and Q₂ act on H⁰ with K/O coefficients, commute with the other Hecke operators, act on q-expansions by the stated formula; the proof at lines 2370–2392 reduces to O/ϖ^m, works over the almost-ordinary locus and extends by Hartogs, which is the README's route), CG20 line 2501 (Lemma 8.12, p. 64: j ≥ k ≥ 2, the integral congruence for Q₂ mod p with the X₂ term exactly when (j,k)=(2,2)); P20 line 1656 (§7, p. 37), Lemma 7.1.1 line 1721 (p. 38: T′₁ factors through p^(2+r) when k+2r ≥ 2+r), Lemma 7.1.2 line 1785 (p. 39: T′₂ factors through p when r ≥ 1), through p. 40 (marker line 1793). Supported as written.
- 9.2 p-adic q-expansion and saturation: T06 line 1276 (Proposition 3.3, PDF page 29 = printed p. 809, the preceding construction on p. 808: injective with flat cokernel at each finite level, deduced from Igusa irreducibility, which the README does not assume and replaces by the gap's component-detection hypothesis); P12 line 788 (§4.2.1, PDF page 20 = printed p. 353, continuing on p. 354: the rigidification ψ_n, the isomorphism ω(ψ_n) and its GL_g(ℤ/pⁿ) transformation law ω(g·ψ_n)=ω(ψ_n)∘ᵗg⁻¹, the "stated left/right action convention"). Supported as written.
- 3.5 (changed supplier sentence): P20 line 1609 (Lemma 6.4.2, p. 36, proof continuing on p. 37 to marker line 1638). Theorem 6.1.5.1 for the gap's models at line 1272 (p. 29).
- 7.5 (changed supplier sentence): P20 §4.1 line 675 (p. 16), §4.2 Fundamental class line 723 (p. 17), §4.3 Cohomological correspondences line 809 (p. 19); §7 and Lemmas 7.1.1–7.1.2 as above.

**Declared gaps.** Eight, each with a named supplier and section, slugs identical in `plan.json` and the README; needs sentences unchanged since the first review, where precision, minimality and non-redundancy were checked. The diff only adds slug citations in prose and asks nothing new of any supplier.

**Adversarial table** (rows for untouched statements carried from the previous reviews, which computed them; new rows for the changed sentences).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §3.5 supplier sentence (changed) | spherical vs paramodular model | spherical: ShimuraCompactifications §7.3 exists at its head (line 2295); paramodular: not in Layer 7 (its subsections 7.3–7.16 are spherical/PEL), so it is the gap, slug in plan.json | citation correct in both halves | none |
| §7.5 supplier sentence (changed) | the two cited suppliers | ShimuraCompactifications Layer 7 at line 2220; SchemeAndStackFoundations §2.19 at 4094, §2.20 at 4275 on main; both slugs in plan.json with those sections | citation correct | none |
| §7.6 supplier sentence (changed) | lci fundamental class | SchemeAndStackFoundations §§2.19–2.20 (4094, 4275); slug count 5 → 7 across §7.5 and §7.6 | citation correct | none |
| §9.2 supplier sentence (changed) | Igusa full frames | HodgeTateAndCanonicalSubgroups §5.1 (1371), §5.2 (1392) at its head are the Hilbert (𝒪_F/p^m)^× torsors; the genus-two GL₂ torsor is the gap, slug count 6 → 7 | citation correct; README line 1268 still says the Hilbert torsor is not substituted | none |
| Gap slugs vs plan | 8 README slugs vs 8 plan entries | sets equal; counts 16, 7, 7, 6, 4, 4, 4, 3 | matched | none |
| Title remnants | grep for the three removed titles | 0, 0, 0 occurrences (previous review: 2, 2, 1) | R01 repaired | none |
| §8.2 vector coefficient and misprint sentence | p=7, d=2, Q=x², a(F,Q)=y²; Q=x²+y² | previous review (con₂=1/3≡5 vs det(Q)·con=0; agreement when det Q=1) | matched | none |
| Scope ownership sentence | merge order | this roadmap 240, GSp4NonregularModularityLifting 268 (consumer only); depcheck 0 problems | matched | none |
| Lean degree identity (§5.2), file unchanged | N=1 Γ=SL₂(ℤ); Γ₀(N), Γ₁(N), Γ(N); Γ(7)∩red₅⁻¹Stab, p=3; Γ(5)∩red₇⁻¹⟨A⟩, p=3; Γ₀(p) with N=p | p+1; (p+1)·1; 20; 12; left side p (p∤N necessary) | first review | none |
| §1.2, §5.2, §5.4–§5.7, §6.2–§6.3, §2.3, §3.1, §3.6–§3.7, §4.2, §4.4, §7.2, §7.5, §8.1, §8.3–§8.7, §9.1, §9.4 (untouched) | as in the first review | as in the first review (33 rows with values) | all matched | none |

**Ownership against open work.** The diff adds no construction; the gap suppliers were checked by object in the first review. Open pull requests without files in the brief were not searched.

## Not verifiable

None. CG20, P20, T06 and P12 were read from the sources cache at the lines above.

## Source issues

- none new in this round. The seven CG20/P20/Y16 items of the first review stand (CG20 Lemma 8.4 symbol, Proposition 8.9(2) det(Q), Theorem 8.10 missing k≠p−1, Lemma 8.20 pM⁻¹, remark after Lemma 8.3; P20 Lemma 6.4.1 sign, Lemma 14.8.2 descent, Remark 6.4.1; Y16 Theorem 4.9 display (4.5)).
