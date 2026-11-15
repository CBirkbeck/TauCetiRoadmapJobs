# FIX-RT-PadicHodgeTheoryPartII~1

This round repairs the findings of red-team round 1, passes a and b, on head `dc03a56`. There are ten P3 findings, and two pairs of them overlap. Every finding holds on the mathematics, so none is disputed. Two repairs are done differently from what the reviewer proposed, and the sections below say why.

Files changed:
- `packages/PadicHodgeTheoryPartII/README.md`
- `packages/PadicHodgeTheoryPartII/sources.toml`: the Milne iAG locator and the GLX26 locator.

`Suggested.lean`, `metadata.toml` and the `gaps` list of `design/plan.json` are unchanged.

## RT-PadicHodgeTheoryPartII~1a/F01 (P3) — applied

The finding is right. PadicLocalLanglandsForGL2Qp §0.2, at its open head, only says "Prove tensor, dual, Tate twist, exact-category, scalar-change and descent APIs". It never mentions strictness, abelianness or extension-closure. PadicHodgeTheory §3.4, at its open head, does itemise these imports: strictness of morphisms between weakly admissible objects, weak admissibility of kernels, images and cokernels, and the abelian category of weakly admissible objects.

What changed:
- From PadicLocalLanglandsForGL2Qp: the contract now reads as the reviewer proposed. "Closed under extensions" is dropped, because the roadmap never uses it.
- §0.5 *Needs:* "PadicLocalLanglandsForGL2Qp §0.2 (strict morphisms)" → "PadicLocalLanglandsForGL2Qp §0.2 with PadicHodgeTheory §3.4 (strict morphisms of weakly admissible objects)".

The same pattern appeared twice more, and both are fixed:
- The Scope paragraph now cites "FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2 and PadicHodgeTheory §3.4" for strictness.
- The From PadicHodgeTheory contract for §3.4 now lists the strictness imports.

FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2, at its head, reads strictness as part of §0.2's API in the same way, so that citation stays.

## RT-PadicHodgeTheoryPartII~1a/F02, RT-PadicHodgeTheoryPartII~1b/F03 (P3) — applied differently

The finding is right. ArithmeticGaloisRepresentations §7.6, at its open head, proves the closure equality only "over an algebraically closed field", and compatibility with field extension as a separate clause.

What changed:
- The contract now states the algebraically closed hypothesis.
- It then states the Q_p form used here: the closure of α(Σ) is the scheme-theoretic image α(Σ̄).
- §3.2 and §3.5 now cite that form. §3.5 also says "a G(Q_p)-conjugate of H", because f∘ξ̃ is only conjugate to ξ|Γ_L.

Why this differs from the proposed repair: both reviewers derive the Q_p form by base change to Q̄_p. That route also needs flat base change of scheme-theoretic images. The direct argument is shorter. Tau Ceti's `HopfIdeal.vanishingIdeal` is defined by vanishing at the points of Σ (`mem_vanishingIdeal`). So f vanishes on α(Σ) exactly when α*f vanishes on Σ. The ideal of the closure is therefore ker(O(G′) → O(Σ̄)), which is the ideal of the scheme-theoretic image, over any field.

## RT-PadicHodgeTheoryPartII~1a/F03, RT-PadicHodgeTheoryPartII~1b/F06 (P3) — applied

The finding is right. With G = D^×, {μ} = (1,0) and K = F, the field E = Q_p(√p) satisfies the old wording, but E ⊄ K, so η has no lift to Fl_μ ⊗ E.

What changed in §2.3: E is now the compositum of `Q_{p^s}` and E_0 inside K. The new text proves three things:
- The B-dominant μ is fixed by Γ_E. `Γ_{Q_{p^s}}` preserves the B-dominant chamber, and the dominant representative of {μ} is unique.
- G_E is quasisplit, so §§1.5 and 2.2 apply.
- The lift of η is the generic point. Fl_μ is geometrically integral, and the projection Fl_μ ⊗ E → Fl_μ is finite and flat.

Pattern: §§1.5, 2.2 and 3.2 already name K ⊇ E or obtain it from §3.1 (K ⊇ F·E_0), so they needed no change.

## RT-PadicHodgeTheoryPartII~1a/F04 (P3) — applied

The finding is right. §0.5 defines a rank-one object as one of F-dimension s. Here s = 2 and the F-dimension is 2.

Change in the Layer 0 Examples: "the rank-two coefficient object with s = 2" → "the rank-one coefficient object X(1, −1) with s = 2 (of dimension 2 over F)". Recomputed: k = 1 − 1 = 0, the wraparound is φ(e_1) = p^0 e_0, and d_2(e_0) = 0. No other "rank-two" occurs in the README.

## RT-PadicHodgeTheoryPartII~1b/F01 (P3) — applied

The finding is right, and the old README note claimed a GLX slip that does not exist. Over a finite K/F the residue field is algebraically closed, and then H = H°. The argument:
1. The regular representation W of H/H° is an object of `T_{b,η}` with finite Galois image.
2. A representation with finite inertia image is de Rham of weight 0 (PadicHodgeTheory §3.3).
3. Weak admissibility then forces every slope to be 0.
4. Over F, a slope-zero isocrystal is a sum of unit objects (Dieudonné–Manin).
5. Colmez–Fontaine full faithfulness makes W trivial, so H/H° = 1.

The sources agree:
- GLX26 line 1284–1291: MT is defined as the identity component and is called the Tannakian group.
- Chen14 line 781: k is algebraically closed.
- Chen14 line 865–866 and 885–886: Chen treats the closure as connected.

What changed:
- §0.7 gains a fourth item, "Connectedness: H = H°", with its proof. Its *Needs:* adds PadicHodgeTheory §3.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2, VectorBundlesAndIsocrystals Layer 1 and MotivesAndAlgebraicCycles §§6.1–6.3.
- §0.7 gains a negative-control Check: the unramified quadratic character over Q_p, whose closure μ_2 is disconnected.
- The Monodromy convention is rewritten, and GLX's ¶14 is now cited as correct.
- The Layer 0 scope bullet and the Layer 0 Dependencies (PadicHodgeTheory §3.3) are updated.

## RT-PadicHodgeTheoryPartII~1b/F02 (P3) — applied

The finding is right. The quadratic Check of §1.4 cannot separate σ_0 from σ_0⁻¹.

I recomputed the cubic case: `((1⊗σ)w)_τ = σ(w_{σ⁻¹τ})`. So the e_1-part goes to the e_σ-part, while the inverse model would send it to the `e_{σ²}`-part.

What changed: this is added as a fourth Check of §1.4. It pins the Galois convention `γ·e_τ = e_{γτ}`. The statement of §1.4 was already correct and is unchanged.

## RT-PadicHodgeTheoryPartII~1b/F04 (P3) — applied differently

The finding is right. MilneiAG line 5283–5306 (Proposition 8.20 and Corollary 8.21) never mentions an image.

What changed, at both places (From Tau Ceti and §3.4):
- 8.20 and 8.21(b), p. 131, are now cited for what they give: D(J) is the subgroup generated by the commutator map, and it is connected.
- Proposition 8.22 and Corollary 8.23, p. 132 (MilneiAG line 5319–5333), are now cited for the characterisation of D(J) by its k̄-points.
- The text now says the image equality follows by comparing k̄-points, and that the Tau Ceti derivation already in §3.4 proves it.

Why this differs from the proposed repair: the reviewer's route goes through 8.20 alone. That route also needs the fact that the image of a generated subgroup is generated by the composite map, which is an extra input. The k̄-points route matches the Tau Ceti proof the README already gives. `sources.toml` is updated to match.

## RT-PadicHodgeTheoryPartII~1b/F05 (P3) — applied

The finding is right. BunGAndNewtonStrata §1.7 and §1.23, at their open head, write `μ♯`. GLX26 line 582 (§2 ¶2, p. 14) writes μ^♮, and PadicHodgeTheory §5.5 writes `μ^(natural)`.

What changed:
- The Conventions now say that μ^♮ is the class of the dominant representative in π_1(G)_Γ, written μ♯ in BunGAndNewtonStrata §§1.7 and 1.23.
- The From BunGAndNewtonStrata contract now reads "μ^♮ (written μ♯ there)".
- `sources.toml` adds the GLX26 locator §2 ¶2.

## Checks

- **Elaboration.** I ran `lake env lean packages/PadicHodgeTheoryPartII/Suggested.lean` from the content checkout. It exits 0 with no output in 3.6 s. The file only imports `Mathlib`.
- **`#check @name` audit.** `Suggested.lean` declares nothing, so there are no signatures to compare and the audit was not run.
- **Dependency check.** Output: `depcheck: 244 roadmaps, 2247 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`.** Cross-roadmap citations found nowhere: none. Lean names found nowhere: none. The earlier lead `FilteredPhiNModule.IsWeaklyAdmissible` no longer appears, and it is notation in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2 anyway.
- **Ownership.** I searched main and the open heads by object for connectedness of crystalline monodromy over an algebraically closed residue field, and found no other owner. §0.7 owns the monodromy group of ξ, so the new item belongs here. No new target, gap or supplier was added.
- **Style.** The README has no machine paths. After the gate repair below, it has no TeX-style `_{…}` or `^{…}` subscripts or superscripts outside code spans. I checked this by scanning every line outside code spans, and the scan found none.

## Gate failure: tex=5

The worker's check found five TeX-style brace subscripts outside code spans in the README. Three were in the cubic §1.4 Check: `γ·e_τ = e_{γτ}`, `((1⊗σ)w)_τ = σ(w_{σ⁻¹τ})` and `e_{σ²}`. Two were in §2.3: `Fl_μ ⊗_{E_0} E`, which appears twice.

Each one is now a code span. The mathematics and the wording are unchanged. The same notation appeared in this report, in the 1a/F03 section, the 1b/F02 section and the adversarial table, and it is now in code spans there too.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.7 H = H° | b = 1, μ = 0; 𝔾_m with b = p^m, μ = z^m; K = Q_p with ε unramified; K/F with a ramified quadratic χ | H = 1; closure of the infinite `χ^{−m}(Γ_K)` is 𝔾_m; μ_2 with D = (Q_p, φ = −1) ≇ 1 over Q_p, and x = √u (p odd) or √−3 (p = 2) satisfies σx = −x over F; χ is not crystalline (finite image would force it trivial) | true; the residue-field hypothesis is needed |
| Monodromy convention, disconnected H | ramified quadratic ξ into 𝔾_m | image {±1}, closure V(x² − 1) = μ_2, two components | true |
| §1.4 cubic Check | `Res_{Q_{p³}/Q_p}𝔾_m`, b = 1; the quadratic case | e_1 ↦ e_σ, the inverse gives `e_{σ²}`; in order 2, σ = σ⁻¹ | discriminates |
| §2.3 choice of E | D^× with s even; split GL_2; `Res_{Q_p(√p)/Q_p}𝔾_m`, s = 1 | E = `Q_{p^s}` ⊂ F; E = `Q_{p^s}`; E = E_0 = Q_p(√p) ⊆ K, as §2.3 assumes K ⊇ E_0 | E ⊆ K in each case |
| §7.6 contract over Q_p | squaring on 𝔾_m with Σ = {±1}; SL_2(ℤ_p) → PGL_2 | μ_2 ↦ 1 = closure of {1}; image PGL_2 = closure of an infinite image, while α(SL_2(Q_p)) has index 4 (p odd) or 8 (p = 2) in PGL_2(Q_p) | equality of schemes, not of points |
| §3.4 image equality | GL_2 → PGL_2 with J = GL_2, a torus; det | f(SL_2(k̄)) = PGL_2(k̄) = D(PGL_2(k̄)); 1 = 1; det(SL_2) = 1 = D(𝔾_m) | true |
| Strictness contract | PadicHodgeTheory §3.4 Check with a non-strict sum map | its source line B has t_H = 0 < 1 = t_N, so it is not weakly admissible; §0.5 applies strictness only to X(d) → `F_{b,μ}(V)⊗Q_{p^s}`, both weakly admissible | consistent |
| μ^♮ = μ♯ | 𝔾_m with μ = z^h; norm-one torus with μ = 1 | h ∈ ℤ under every name; nonzero in ℤ/2 | same object |
| X(1, −1) rank one | s = 2 | F-dimension 2 = s, k = 0 | true |

## For the maintainer

- **Stale erratum.** `design/plan.json` has a `sourceIssues` entry `PadicHodgeTheoryPartII/E1`. It records GLX26 §5.1 ¶14 as an error, and it cross-references PAPER-GLEASON-LIM-XU-26/E02 and PadicHodgeTheory/E53. 1b/F01 refutes it: the "finite nontrivial representation" in its reason is never crystalline over a finite K/F unless it is trivial. That entry, and the errata it cites, should be withdrawn. Review 1a's "Source issues" list repeats it (at GLX26 line 1290). I could not change the entry, because this job may only edit the plan's `gaps`.
- **Stale Milne locators.** `design/plan.json` lines 142 and 1257 still give the old Milne locator "Proposition 8.20 and Corollary 8.21, p. 131".
- **Names other roadmaps cite.** No section id or Lean name changed. §0.7 gains an item, and no other roadmap cites §0.7's item list.
