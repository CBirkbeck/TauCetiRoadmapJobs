# FIX-RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2

Repair of red-team round 2 (passes a and b) on `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`.
Eleven findings, settled in seven sections where the two passes overlap. Only `README.md` changed;
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2a/F04, RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F01 (P2) — applied

Conventions (H): "E containing σ(K) for every embedding σ : K ↪ E" → "E ⊂ ℚ̄_p contains σ(K) for every
σ : K ↪ ℚ̄_p (equivalently E contains a Galois closure of K, or K ⊗ E ≅ E^{d_K}); Σ_K = Hom(K, E)",
citing DING25 §2.1, p. 9 (DING25 line 389), with the witness K = ℚ_p(√p): E = ℚ_p is excluded,
E = ℚ_p(√p) has two embeddings. Pass a rated this P3, pass b P2.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2a/F01, RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F02 (P3) — applied

§2.2: the sentence "uses Lemma 3.5(2) and dévissage" → a full route: coker f_D = Ker ∂, ∂(k ⊗ a) = k·a;
push to ⊕_C Ext²(A, C); Lemma 3.5(2) gives c_C·a ≠ 0 for a ≠ 0; the rows `x_{j,C}` are independent by
§1.6 and supplier §8.12 (1). Needs gains §1.6, supplier §§8.7, 8.9 (1), 8.12 (1), Mathlib `Ext.comp`,
`ShortExact.extClass`. New Check: n = 1, L = Eψ ⊂ `𝔈_{g′}`, rank 1 into dimension 2.

Other places: §2.4 proof sketch (2b's repair: socle A from injectivity of 𝒦_D → 𝔈; no A in
soc(π_min/A) by §1.6 and §8.12 (1)), Needs + §1.6, §1.7, §8.12, and a negative-control Check (a line
in `𝔈_{g′}` gives soc(Π_L/A) = A ⊕ V/A). §3.7: the σ-version is now run in Ext_G for π_min(D)_σ and
restricted to Ext¹_σ through subquotient stability (supplier §10.1), since the supplier has no Ext²_σ;
Needs + §1.6, supplier §§1.7, 8.9, 10.1–10.2. Source corrections: new entry for the paragraph after
(3.45), p. 50 (Lemma 3.23 is also needed).

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2a/F02, RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F06 (P3) — applied differently

LocalGaloisDeformationRings contract: "its rank-one case gives, for a continuous character δ_i, `R_{δ_i}`"
→ §1.23 applies in rank one to the crystalline trivial module (ring R_1), not to non-de Rham R(δ). §5.1:
`R_{δ_i}` := R_1 with universal deformation twisted by δ_i (PhiGamma §7.1 tensor law). New Check:
δ_1 = exp(a·log_p), a ∉ ℤ. This follows 2a's twist route. 2b's alternative (prove smoothness here
from H² = 0) was not used: the twist gives the same ring without restating a smoothness proof.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2a/F03, RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F07 (P3) — applied

§4.1: "tautological subextensions of `π_{1,σ}(φ,h)` by Ker(t_{D_σ,F}) ⊗ A …" → "tautological
extensions of Ker(t_{D_σ,F}) ⊗ A and of Ker(t_{D_σ,G}) ⊗ A by `π_{1,σ}(φ,h)`, subrepresentations of Π
with subobject `π_{1,σ}(φ,h)`" (DING25 lines 2505–2506). Every other "extension of X by Y" in the README
was checked: all already put Y as the subobject.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F03 (P3) — applied

§1.2 Needs: "LocallyAnalyticRepresentationsOfLocalGroups §§9.6–9.7" → "§8.14 (the transport (3.18)
on `Hom_{g′}`) and §§9.6–9.7", and the Trianguline item now says that its §11.5 carries (2.13) on
Ext¹_{g′} (DING25 line 797). The Layer 1 Dependencies line already covered §8.14.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F04 (P3) — applied

The LocallyAnalyticRepresentationsOfLocalGroups contract "§6.1" → "§§6.1–6.2 … and its exactness in M
(used in §2.1)"; Scope "its §6.1" → "its §§6.1–6.2"; Layer 2 Dependencies "6.1" → "6.1–6.2"; Layer 5
Dependencies gains §8.4. Other places: Dependencies ranges that named sections absent from the
contracts were trimmed (Layer 2 and Layer 3 "8.1/8.4–8.14" skip §8.6; Layer 3 Trianguline "12.1–12.7"
→ "12.1–12.2, 12.4, 12.6–12.7"). Layer 3 gains §1.7 for §3.7.

## RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b/F05 (P3) — applied

Deleted from the PhiGammaModulesAndIwasawaCohomology contract and Scope: §1.2, §§3.4a, 3.6, §7.5. Deleted
from the TriangulineVarietyAndItsLocalModel contract: §10.6. Grep confirms no target, Check or
Dependencies line cites them. The remaining PhiGamma items now say where each is used (§1.0 in §4.2,
§7.1 in §5.1, plus the existing uses).

## Checks

- **Elaboration.** `lake env lean packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`,
  run from the content checkout: exit 0, no output (3 min 17 s). The file is unchanged: one module
  docstring, an empty namespace and `import Mathlib`. It has no declarations, so the
  `#check @name` comparison had nothing to check and changed nothing.
- **Dependency check.** Output:

  ```text
  depcheck: 207 roadmaps, 1902 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the edited README gives one lead,
  "LocallyAnalyticRepresentationsOfLocalGroups §4.1: no roadmap …". It is a false positive: the
  roadmap is the board package `packages/LocallyAnalyticRepresentationsOfLocalGroups`, earlier in the
  merge order, and its §4.1 exists. It found no Lean names nowhere.
- **New Mathlib names, checked at the pin.** `CategoryTheory.Abelian.Ext.comp`
  (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:128`, namespace `CategoryTheory.Abelian.Ext`),
  `CategoryTheory.ShortComplex.ShortExact.extClass` (`…/Ext/ExtClass.lean:76`) and
  `CategoryTheory.Abelian.Ext.covariantSequence` with `covariantSequence_exact` (`…/Ext/ExactSequences.lean:141, 148`).
  In that sequence the connecting map is `x₃ ↦ x₃.comp hS.extClass`, which is the Yoneda-product
  description that §2.2 uses. The three names were added to the Mathlib supplier contract.
- **Gate failures.** tex=5 (brace sub- and superscripts outside code spans in README.md): Conventions (H)
  `K ⊗_{ℚ_p} E ≅ E^{d_K}` and `Hom_{ℚ_p}(K, E)` (three hits), the §1.2 Needs line `Ext¹_{g′}` and the §5.1
  convergence bound `p^{−1/(p−1)}` are now in backticks; no wording changed. The remaining braces
  (the A_D and A_D,w display in §5.1) are inside a fenced `text` block.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| (H) new form | K = ℚ_p(√p) with E = ℚ_p, E = ℚ_p(√p); K = ℚ_p; K = ℚ_p(∛p) (ζ_3 ∉ ℚ_p) with E = K | ℚ_p: √p ∉ ℚ_p, excluded; ℚ_p(√p): 2 embeddings = d_K; ℚ_p: #Σ = 1 for every E; ℚ_p(∛p): K ⊗ K ≅ K × K(ζ_3) ≠ K³, excluded | holds; witness added |
| LGDR §1.23 rank one, trivial module | δ = 1 | h⁰ = 1, h² = 0 (PhiGamma §7.2), so dim H¹ = d_K + 1 = dim Hom(K^×, E); supplier Check gives E⟦x_1,…,x_{d_K+1}⟧ | holds |
| §5.1 `R_{δ_i}` by twist | δ_i = 1; δ_i = φ_1z^{h_1}; δ_1 = exp(a·log_p) on 1 + 2pℤ_p, a ∈ ℤ_p∖ℤ | residue of M ⊗ R_{K,A}(δ_i) is R(δ_i); inverse twist by δ_i⁻¹; weight a ∉ ℤ, so R(δ_1) is not de Rham; tangent dimension 2 at K = ℚ_p; convergence: |a·log x| ≤ |2p| < p^{−1/(p−1)}, i.e. p⁻¹ < p^{−1/(p−1)} for p odd and 1/4 < 1/2 for p = 2 | holds; Check added |
| §5.1 wrong model: twist by δ_i⁻¹ | δ_i ≠ 1 | lands in deformations of R(δ_i⁻¹), the wrong residue | excluded by the stated direction |
| §2.2 ∂ injective | n ≤ 2; n = 3, ℚ_p; control n = 1, L = Eψ | 𝒦 = 0, so the domain of ∂ is 0; n = 3: dim Ext¹(A,A) = 4, six C's, 𝔈/`𝔈_{g′}` has dimension 10 − 4 = 6, k_1 ∉ `𝔈_{g′}`, so some `x_{1,C}` ≠ 0 and a_1 = 0, giving dim Ext¹(A, π_min) = 10 − 1 = 9 = dim Q; control: there are no C's, so no conclusion follows, and ∂(ψ ⊗ ψ) = ψ·ψ = 0, since graded commutativity gives ψ·ψ = −ψ·ψ and 2 is invertible | holds; the control behaves as it should |
| §2.2 n = 1 Check | K = ℚ_p, χ, ψ ≠ 0 | Ext¹(χ,χ) has dimension 2; f_L has kernel L, so rank 1; Ext¹(χ, Π_L) has dimension (2 − 1) + dim Ker(ψ ∪ ·) = 1 + 1 = 2 (H² = Λ²Hom(ℚ_p^×, E), dimension 1); the E[ε]/(ε³) character is multiplicative: (1 + aε + a²ε²/2)(1 + bε + b²ε²/2) = 1 + (a+b)ε + (a+b)²ε²/2 | holds |
| Lemma 3.5(2) ⇒ c·a ≠ 0 | a ≠ 0 nonsplit | the sequence Ext¹(A,C) → Ext¹(Ã,C) → Ext¹(A,C) → Ext²(A,C) has the first map bijective, so the middle map is 0 and δ is injective on the line E·c_C | holds |
| §2.4 socle (1) for π_min | n = 2; n = 3, ℚ_p; L ⊂ `𝔈_{g′}`; split extension | n = 2: π_min = V; n = 3: Hom(A, π_min) = E and Hom(A, π_min/A) = 0, so soc(π_min/A) = ⊕_6 C = V/A; L ⊂ `𝔈_{g′}`: the connecting map is 0, the extension splits and soc(Π_L/A) = A ⊕ V/A; split extension: soc = A² | holds; Check added |
| §3.7 σ-route | K = ℚ_p; n = 2, 3 with d_K = 2 | ℚ_p: reduces to §2.2; n = 2: 𝒦_{D,σ} = 0, Ext¹_σ has dimension 5 = 2 + 3; n = 3: 10 − 1 = 9 = 3 + 6 = dim Q_σ; Hom(A, V/π_{1,σ}) = 0, so Ext¹_G(A, π_{1,σ}) ↪ 𝔈 and the image of Ext¹(A,A) is `𝔈_{g′}` | holds |
| §4.1 direction | n = 3; general n | n = 3: both kernels are 0, so π^± = π_{1,σ}, as in the §4.1 Check; push-forward along π_{1,σ} ↪ π^± needs π_{1,σ} as the subobject, which the new wording gives | holds |
| §1.2 Needs | DING25 lines 1725–1732, 797 | (3.18) is LARG §8.14 (from its §8.8 (2)); (2.13) with g′ is Trianguline §11.5 | holds |
| Contract trims | grep of README | no citation of Trianguline §10.6, PhiGamma §§1.2, 3.4a, 3.6, 7.5, LARG §8.6, Trianguline §§12.3, 12.5 remains | holds |

## Ownership and overlaps

- **The rank-one character ring.** `roadmaps grep` over main and the open heads finds only
  LocalGaloisDeformationRings §1.19, which is the integral deformation ring of a residual character
  of G_K over 𝒪, a different object. §5.1 already owned R_δ; it now builds `R_{δ_i}` from the supplier's
  R_1 by twisting and adds no new owner.
- **Overlaps.** The overlaps listing names no open pull request that changes this roadmap and no
  dropped ids. No citation changed to a revision's numbering.

## For the maintainer

- No name that other roadmaps cite changed. No section was renumbered.
- The PhiGammaModulesAndIwasawaCohomology and TriangulineVarietyAndItsLocalModel contracts are now
  shorter (the sections listed above were removed); those roadmaps need no change.
- **Source corrections.** One entry was added (DING25, paragraph after (3.45), p. 50), matching the
  source issue both passes reported. The other source issues in the two reviews were already in the
  README.
- **Untrusted text.** Neither review contained instructions to run commands or act outside the job.
