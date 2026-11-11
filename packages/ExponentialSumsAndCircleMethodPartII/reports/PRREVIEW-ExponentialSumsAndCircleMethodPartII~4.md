# Review of ExponentialSumsAndCircleMethodPartII (pull request #2138 at 7a34caf)

**Verdict:** accepted

This is an incremental re-review of the 11 lines changed since 2cb43f3, all in `README.md`: the Tau Ceti and OrthogonalTamagawaAndLatticeMass contracts, the §6.5 proof route, the §6.5 *Needs:* line and Checks, and the Layer 6 Dependencies. There are no findings, and the gate passes.

## Previous findings

- R01 — repaired: README line 47 now cites `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` (`Symplectic/Connected.lean:125`) and the SO analogue (`SpecialOrthogonal/Connected.lean:330`). It also says that the dimension equality "needs smoothness and connectedness of both the larger and the smaller group". Both declarations are added to the §6.5 *Needs:* line (line 838) and to the Layer 6 Dependencies (line 867).
- R02 — repaired: the description now lists "#1231 (MordellLawrenceVenkatesh)" among ours and "another author's: #1222 (OrthogonalTamagawaAndLatticeMass)". It adds a §6.5 paragraph naming the pinned Cartier, Lie-dimension, and Sp/SO-connectedness statements, MordellLawrenceVenkatesh §0.17 and OrthogonalTamagawaAndLatticeMass §0.1.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Line 47: dimension equality needs both groups smooth and connected | `Dimension.lean:65–72` | Hypotheses `hI_smooth`, `hI_connected`, `hJ_smooth`, `hJ_connected` and `hfinrank`. `I ≤ J` means the I-group contains the J-group. | Matches; Sp/SO is `I`, closure° is `J` |
| Line 47: Sp₂ₘ geometrically connected over every field, rank zero included | m=0; m=3 (N₂=6) | Binders `(k) [Field k] (m : ℕ)`, with no characteristic hypothesis. At m=0, GL₀ is trivial and its spectrum is one point. | Matches |
| Line 47: SOₙ (MMᵀ=1, det M=1) geometrically connected, char ≠ 2, every n | n=0, 1, 21 | Binder `[NeZero (2 : k)]`. `SpecialOrthogonal/Basic.lean` docstring gives points `M Mᵀ = 1`, `det M = 1`. SO₀ and SO₁ are trivial. | Matches; char 2 excluded as stated |
| Line 47: forms over Ē congruent to the standard ones | x²−y² over ℂ and over ℝ; ω=[[0,a],[−a,0]] | P=diag(1,i) gives Pᵀdiag(1,−1)P=I₂. Over ℝ the signatures (1,1)≠(2,0), so closure is needed. P=diag(1,1/a) gives J. | True; the pins have both (see below) |
| Line 47: congruence carries connectedness | A=PᵀP, MᵀAM=A | N=PMP⁻¹ gives NᵀN=P⁻ᵀ(MᵀAM)P⁻¹=I and det N=det M | Isomorphism SO(A)≅SO(I) of group schemes |
| §6.5 new Check: O₂₁ versus SO₂₁ | N=21 over Ē | dim 𝔰𝔬₂₁=21·20/2=210 for both. det Id=1, det(−Id₂₁)=−1: two disjoint nonempty closed loci. `hfinrank` 210≤210 holds; `hI_connected` fails. | Correct, and it discriminates O from SO |
| §6.5 new Check: Sp₆ | m=3 | dim 𝔰𝔭₆=3·(2·3+1)=21 | Correct |
| §6.5 route at (k,n)=(4,3) | H₂⊂Sp₆, H₁⊂O₂₁ | Lie H₂≥21 gives H₂°=Sp₆. H₁°⊆O₂₁°=SO₂₁ and Lie≥210 give H₁°=SO₂₁. A reflection (det −1) gives H₁=O₂₁, of index 2. | Sound; p₁(G)=O₂₁, p₂(G)=Sp₆ |
| §6.5 route against the source | BS20 lines 1420–1442 | Line 1423: geometric monodromy is O_{N₁}, not SO, and Sp_{N₂}; then Goursat | The route's O/SO handling agrees with the source |
| OrthogonalTamagawaAndLatticeMass contract, narrowed | §0.1 at d4f1571 (its README:129), N₁=21 | dim Spin₂₁=210=dim SO₂₁. Since 21≥3 and 21≠4, Spin₂₁ is absolutely almost simple. SO connectedness is no longer consumed from §0.1. | Matches the §0.1 text |

The rows for statements this diff leaves untouched stand as in the previous review, of `2cb43f3`.

- **Gate and scope of the change.**
  - `gate … --base origin/main` re-run on 7a34caf: every scanner reports 0, result `OK`. The worker's record has build=0.
  - Dependency check (`--movable --pr 2138`): `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
  - `git diff --stat 2cb43f3 HEAD` shows only `README.md` (6+/5−). The outside-folder diff against `origin/main` is empty.
- **Lean.** `Suggested.lean` is unchanged since 2cb43f3.
  - `lake env lean` on it gives exactly three warnings, all `declaration uses sorry` (lines 115, 141 and 217).
  - I elaborated `#check @` for all 16 declarations in one scratch file: all elaborate and none lost a binder.
- **Library declarations opened at the pins (8).**
  - `HopfIdeal/Smooth/Dimension.lean:65` and `Smooth/CharZero.lean:151`.
  - `Symplectic/Connected.lean:125` and `SpecialOrthogonal/Connected.lean:330`.
  - `Symplectic/Basic.lean:102` (Jₘ on `Fin (m+m)`) and `SpecialOrthogonal/Basic.lean:102`.
  - Mathlib `QuadraticForm.equivalent_of_isAlgClosed` (`Mathlib/LinearAlgebra/QuadraticForm/AlgClosed.lean:62`).
  - Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` (`TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`).
- **Citations in the changed passages, resolved at the current heads (6).**
  - OrthogonalTamagawaAndLatticeMass §0.1 (d4f1571).
  - MordellLawrenceVenkatesh §0.17 (3756140).
  - LefschetzPencilsAndVanishingCycles §§5.1, 5.7, 5.8 and 5.10 (306b5f0).
  - EtaleDualityAndPerverseSheaves §4.7 (23180d4). Its §0.4 holds the bold top-degree compact-support target.
  - SchemeAndStackFoundations §0.7 (main).
  - The merge-order positions of all nine open suppliers are above line 396, and `overlaps.md` lists nothing.
- **Sources.** I re-read BS20 lines 1389–1442 (Lemma 4.3, pp. 923–925). No README locator is flagged as unverified. None of the 15 seeded targets falls in the changed passages.
- Remark (untouched text, no change asked): the Tau Ceti clause of the scope (line 13) names only the circle equivalence, not the Hopf-algebra declarations that the contract at line 47 consumes.
- Remark (untouched text): the line locators in §§6.4–6.6 (BS20 lines 1395, 1356 and 1437) are page-marker lines. Lemma 4.3 itself is at BS20 line 1389.
- Remark: the generated `depends-on` and `merge-order` blocks of the description still omit #1231 and #1222. They are tool output, which this review does not check as text.

## Not verifiable

- Katz's Theorem 11.4.9, which BS20 line 1422 cites for the O/Sp monodromy, was not read. The README does not cite it; it routes through LefschetzPencilsAndVanishingCycles and gap:lpv-universal-monodromy instead.
- `LEE13` is waived and was not read. The text citing it is untouched.

## Source issues

- **Misprint** in BS20 at proof of Lemma 4.3, p. 924 (BS20 line 1435): the source lists the exceptional coincidences as (N₁,N₂)=(2,3) or (4,5), with N₁ the orthogonal rank; it should say (3,2) or (5,4), from 𝔰𝔬₃≅𝔰𝔭₂ and 𝔰𝔬₅≅𝔰𝔭₄; affects nothing.
