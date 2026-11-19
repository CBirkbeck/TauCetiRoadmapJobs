# Review of ClusterAlgebras (pull request #2524 at 04af438)

**Verdict:** accepted

**Summary.** Accepted: the review has no findings. The new ice-quiver and amalgamation material of §1.1 is correct as stated, and §6.2's claim that the mutable columns of the double-word quiver are BFZ's matrix was confirmed by computation on 125,887 entries in seven Cartan types, including the transposition and the Cartan index convention. There are one small correction (the description omits what the change removes) and three format notes, none blocking. Two points on how sources were read are left for the human reviewers.

## C01 — The description does not say that the change removes the arrow-count ice quivers, the block-diagonal statement and a Check

A reader of the description expects §1.1 only to grow. Against main, the head also deletes three things from §1.1:

- the bijection between extended matrices with skew-symmetric principal block and ice quivers `q : I → I → ℕ`, with its intertwining of `μ_k` and quiver mutation (add arrows, reverse, cancel 2-cycles);
- the commutation of `μ_k` with `fromBlocks B₁ 0 0 B₂`;
- the Check on the quiver `1→2→3`.

In §6.2 the description of the word also changes: the prepended indices `-r,…,-1` and the successor `k⁺` are replaced by `w : List (I ⊕ I)` with vertices numbered by letter counts, and three references are added (Fock–Goncharov, Goncharov–Shen, Shen–Weng).

A text that would be right, added under "Change": "§1.1 no longer states the bijection with arrow-count ice quivers `q : I → I → ℕ` or its quiver-mutation rule, nor the Check on `1→2→3`; the block-diagonal commutation is now the case of amalgamation with disjoint images. §6.2 replaces BFZ's position indexing by vertices numbered per simple index, and the references gain Fock–Goncharov, Goncharov–Shen and Shen–Weng."

## N01 — Three names in code font in the new §1.1 text are declared nowhere

`IceQuiver row`, `fullMatrix` and `ExchangeMatrix.mutation` (lines 789, 792, 804) are not in `Suggested.lean`, so a reader cannot tell a proposed name from a declared one. The declared name for matrix mutation is `matrixMutation`. Either write the first two as proposed names in prose and point the third at `matrixMutation`, or declare them.

## N02 — §6.3 and the Layer 6 Examples keep the word notation that §6.2 dropped

§6.2 now writes `B̃(w)` and `Δ(k;w)`; §6.3 (lines 2998–3002) still writes `B̃(i)`, `Δ(k;i)` and "double reduced words `i,i'`". One letter throughout would do.

## N03 — "the same weights `s_i`" in §6.2 would be clearer with a Check that separates them from Goncharov–Shen's multipliers

After transposition the elementary quivers are symmetrized by the `s_i` of the first paragraph (`s_i a_ji = s_j a_ij`), not by the multipliers `d_i` of Goncharov–Shen §11.2 (`d_i C_ij = d_j C_ji`). In type `B₂` with `a₁₂=−1`, `a₂₁=−2` these are `s=(1,2)` and `d=(2,1)`. A reader who takes "the same weights" to mean the source's gets a matrix that the weights do not symmetrize.

A Check would pin the convention. For example: for the word `(1,2,1)` of positive letters in type `A₂`, the one mutable column has entries `+1, −1` at the two extremal vertices of index 1 and `−1, +1` at the two vertices of index 2, which is BFZ's column `(−1,+1,0,+1,−1)` on rows `−2,−1,1,2,3`. Without the transposition the signs are reversed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 `IceQuiver` ⇄ full matrix | mutable `k`, frozen `f`; `B=((0,1),(−2,0))`, `s=(2,1)` | `s_k M_kf = −s_f B̃_fk = −s_f M_fk`; `M_kf∈ℤ ⇔ s_k ∣ s_f B̃_fk`; `2·1 = −1·(−2)` | equivalence holds both ways; `C_ff=0` forced |
| §1.1 full mutation keeps the symmetrizer | general `i,j,k` | `s_iM'_ij+s_jM'_ji = (s_is_j/s_k)·(P−N+N−P) = 0`, with `P=[M_ik]_+[−M_jk]_+`, `N=[−M_ik]_+[M_jk]_+` | holds for rational entries |
| §1.1 mutation preserves defrosting integrality | frozen `f` with integral row and column, mutable `k` | `M'_fg = M_fg + [M_fk]_+[M_kg]_+ − …`, all three factors integral | holds |
| §1.1 amalgamation commutes with mutation in one factor | `k` mutable in factor `a` only | row and column `k` of `M^am` are those of `M^a`; the change `[M_ik]_+[M_kj]_+ − …` is supported on `ι_a(I_a)` | holds; disjoint images give the former block-diagonal statement |
| §6.2 symmetrizer of the transposed elementary quiver | GS (416): `ε_{i_l,j}=−C_ij/2`, hence `ε_{j,i_l}=C_ji/2` | `s_i ε_{j,i_l} = −s_j ε_{i_l,j}` ⇔ `s_i a_ji = s_j a_ij` | the README's condition exactly; `s_i d_i` constant |
| §6.2 integrality at non-extremal vertices | random double reduced words, types `A₂,B₂,G₂,A₃,B₃,C₃,A₁×A₁`, 2,800 words | 0 non-integral entries in rows or columns of non-extremal vertices | holds (Shen–Weng Remark 3.6) |
| §6.2 `Q(w)` columns = BFZ Remark 2.4 | same 2,800 words, lengths up to 16 | 125,887 entries compared, 0 mismatches; mutable set = BFZ's exchangeable set in every word | holds |
| §6.2 wrong variant: no transposition | same words | 39,951 of 125,887 entries differ; `A₂`, `(1,2,1)`: `−1` against `+1` | the transposition is needed and stated |
| §6.2 Cartan index convention | BFZ III line 380: `a_ij=α_j(α_i∨)`; Mathlib `cartanMatrixIn` entry `pairingIn i j` | BFZ `a_{ij}` = `b.cartanMatrix j i` | "row colour `i`, column colour `j` is `a_ji`" is right |
| §6.2 Checks, `SL₂` | words `(−1,1)` and `(1,−1)` | BFZ column `(−1,0,−1)` resp. `(+1,0,+1)`; amalgamation gives the same; 1 mutable, 2 frozen | agree; exchange `ad=1+bc` |
| §1.2 Check, `A₂` scalar system | five alternating mutations at a rational point | `H=(1+T,1+T)`: ratio 1; `H=(1+2T,1+3T)`: both ratios 6; normalized `(1+2T)/3,(1+3T)/4`: ratio 1 | as stated |
| §1.2 Check, `B=((0,2),(−1,0))`, degrees `(1,2)` | six alternating normalized mutations | coordinates, polynomials and matrix all return | as stated |
| §1.5 / §2.6 dilation Checks | `B=((0,1),(−1,0))`, `H_1=1+T`, `H_2=1+2T`, word `[1,2,1]` | `H_1` becomes `1+2T` after step 2; `x'''=(1+2x)/y`; fixed `H_1` gives `1/y+x(y+2)/(y(y+1))` | as stated |
| §2.6 Check, degree three | `B=((0,3),(−3,0))`, `H=1+2T+T³` | `x'=(y³+2y²+1)/x`, reversal `1+2T²+T³`, `x''=x` | as stated |
| §2.1 Check, `h=(x+y+z)/(xy)` | rational point | `h=(1+x')/y=(1+y')/x`, `zh=x'y'−1` | as stated |
| §0.7 Checks | `x*=(1+z)/x` | `(1+x*)/z=x*z*−1`; `(1+x*+(x*)²)/z=(x*)²z*−x*−z−2` | as stated |
| §2.2 L6b recurrences | FZ IV (5.3), (6.12) | `F` recurrence and `g'_k=−g_k+G_t[b_{•k}]_+−B₀[c_k]_+` match; rank one: `F=1+u`, `g=−1` | agree |
| §2.3 separation | FZ IV Theorem 3.7, (3.15)–(3.17), Corollary 6.3 | numerator `X|_F`, denominator `F|_P`; `h_{k;t}` is the tropical exponent of `1⊕Y` | agree |
| §2.4 Somos-4 | mutation at 0; values | mutated matrix is the cyclic translate; `a₄…a₈=2,3,7,23,59` | as stated |
| §3.1 signed mutation | determinant lattice, unit weights | first: `e₂↦e₂`; second: `e₂↦e₂−e₁`; GHK (2.3) | as stated |
| §3.4 `T_k` | GHKK (1.23) | `m+⟨d_ke_k,m⟩v_k` on the positive half-space | agree |
| §5.3 Check | `B=((0,1),(−2,0))`, mutation at 1 | `C'=((−1,1),(0,1))`, `G'=((−1,0),(2,1))`, `G'ᵀ diag(2,1) C' = diag(2,1)` | as stated |
| Layer 5 example | principal `A₂`, word `1,2,1,2` | cluster `((1+u₂x₁)/x₂, x₁)` | as stated |
| `ncard_clusterVariables`, `finite_clusterVariables_iff` | field of characteristic 2 | a `BasedChart` over ℤ needs `2•M(0)≠0`, so `char F=0` and binary exchange elements are nonzero | no missing hypothesis |
| Headlines: `existsUnique_isMutation`, `Seed.exists_laurentExpansion`, `Seed.upperBound_eq_of_reachable`, `Seed.exists_laurentExpansion_of_isGenerating`, `exists_laurentExpansion`, `somos4_exists_pos_nat`, `upperBound_le_of_starfish`, `finite_clusterVariables_iff`, `exists_isFiniteType_iff_forall_le_three`, `ncard_clusterVariables`, `exists_nonneg_laurentExpansion`, `cVector_signCoherent` | one-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy | 12 of 12 not closed (10 fail, 2 time out) | no padding; file unchanged by this pull request |

- Source locators located in the text: 121 in 20 sources (GHKK 26, BZ 17, FZ IV 17, BFZ III 13, FZ II 8, BCDX 7, FZ double Bruhat cells 5, GHK 4, Nakanishi 4, FZ I 3, FWZ 3, and one or two each in Fock–Goncharov, Goncharov–Shen, Shen–Weng, Chekhov–Shapiro, Nakanishi–Rupel, Rupel, BZ total positivity, Laurent phenomenon, NZ). Those behind the 15 sampled subsections and the new text were read against the statement they are cited for; §§0.2, 0.3 and 1.3 carry no locator.
- Library declarations opened at the pins: Mathlib `RootPairing.Base.cartanMatrixIn` (`LinearAlgebra/RootSystem/CartanMatrix.lean`:53) and `RootPairing.pairing` (`LinearAlgebra/RootSystem/Defs.lean`:195); Tau Ceti `TauCeti.IsFiniteType` (`LinearAlgebra/RootSystem/FiniteType/Basic.lean`:129). No ice-quiver or quiver-amalgamation declaration exists at either pin.
- Cross-roadmap citations resolved on main: ScatteringDiagrams §§0.8, 1.4, 3.3–3.4, 4.2–4.4, 5.1–5.6, 7.1–7.7 and the eight named targets; RootSystems Layers 1–3; ReductiveGroups Layers 7, 7C, 8, 10; SchemeAndStackFoundations §0.6 `coherent_hartogs`; AnalyticToricGeometry Layer 0; QuantumGroups.
- Dependency check: `depcheck: 200 roadmaps, 2185 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Every supplier is on main.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: 12 warnings, all `declaration uses sorry`, no error. Nothing changes outside the folder; the folder's change is 86 lines of `README.md`.
- Elaborated signatures: the five flagged declarations lose only unused `DecidableEq` binders; no hypothesis is lost.
- Previous review (of this roadmap at an earlier pull request): accepted with no finding of its own, so there is nothing to recheck. No roadmap on main or open cites the removed §1.1 statements.
- Overlap check: read ScatteringDiagrams; nothing shared. The open and results lists are empty; a search of main and the open heads for ice quivers, quiver amalgamation, defrosting and double Bruhat cells finds no other owner, so this roadmap owns them.

Source independence: 12 passages compared with 9 sources, none shared beyond formulas; largest share GHKK, 17 of about 75 locator citations; contents compared with GHKK: independent (its §§1–5 and appendices are spread over Layers 3 and 5 in another order).

Research link: Amalgamation and defrosting are Fock–Goncharov (2006); the double-word quivers are those of Goncharov–Shen (2019) and Shen–Weng (2021), and recover Berenstein–Fomin–Zelevinsky's (2005) seed for double Bruhat cells. Layer 5 is Gross–Hacking–Keel–Kontsevich (2018). Rests on the README's references and the texts read.

## Not verifiable

- none of the sampled locators. Not opened this round (outside the sample): Fock–Goncharov, *Cluster ensembles*, §§1.2.5–1.2.6; GLS.

## Source issues

- none

## For the human reviewers

- **Licence.** Berenstein–Zelevinsky, *Total positivity in Schubert varieties*, is linked at the publisher's site (EMS Press); the sources service does not classify that host. It was read there as an open publisher copy.
- **Licence.** FWZ Chapter 6 is linked at an author's page on a host the service does not classify; it was read from arXiv:2008.09189 instead, where Proposition 6.4.1 and Remarks 6.4.4–6.4.5 carry the same numbers.
