# Review of CongruenceModulesOfThetaLifts (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 369 changed lines since `74a09b7`. What was checked: the `*Origin:*` and `*Method of the formal proof:*` labels of all twenty sections and the one `*Corollary of:*` line (7.7d), against their sources wherever an open text exists; the revised route of 7.4 and the narrowed 7.16a (2), against BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 at this head; the three new supplier citations; the dependency check and the elaboration. There is no finding. There are three small corrections and two format notes, none blocking: the status of the general form of 7.16a (2) is stated two ways, one sentence of the description does not hold for it, and the Origin of 7.15 gives Horesh–Karasik's Proposition B.5 a generality it does not have. Two questions are left for the human reviewers: the main source is unrefereed, and the formal proof could not be opened.

## C01 — The general form of 7.16a (2) is called both this roadmap's own formulation and "not a statement of this section"

An implementer cannot tell whether (2) is to be proved for every definite unitary group of the setting of 7.16, or only when `E/F` is unramified at every finite place and `V` is the standard Hermitian space.

The Labels paragraph (line 197) and the Origin of 7.16a (line 1879) call the general form "this roadmap's own formulation", and by the paragraph on statements of the formal proof (line 190) such a form is "proved by the route written here". The remark after (3) (lines 1928–1929) says it "is not a statement of this section", because its route needs Galois representations that BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 has outside that setting only in its remark. Nothing else depends on the choice: no other roadmap of the family cites 7.16a (2), and (3) lies in the narrowed setting.

Either would settle it: state the general form as a target whose `*Needs:*` cites the remark of §16.1, or drop it from the Origin and from the Labels paragraph and keep only the remark.

## C02 — One sentence of the description does not hold for 7.16a (2)

The description says that where the proof has only a special case of a general theorem, "the section now states the proof's form and the general roadmap the general theorem." Here 7.16a (2) now assumes `E/F` unramified at every finite place and `V` standard, and its general form is stated in no general roadmap: it survives only in the remark after (3), as does the general form of its supplier §16.1 (in that section's own remark).

A sentence such as this would make the description accurate: "In a few sections the general form is kept only as a remark and is stated nowhere as a target, for instance CongruenceModulesOfThetaLifts 7.16a (2) and BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1."

## C03 — The Origin of 7.15 states Proposition B.5 of Horesh–Karasik for every lattice; the source has it for primitive sublattices of `ℤⁿ`

A reader who opens the source finds a narrower statement, and a remark warning that the obvious extension fails. The Origin (lines 1690–1691) reads "Proposition B.5 (…): the dual of the orthogonal projection of a lattice in a real inner-product space is the dual cut by the subspace". Proposition B.5 is: for `Λ` primitive in `ℤⁿ`, the dual of the projection of `ℤⁿ` to `(ℝΛ)^⊥` is `ℤⁿ ∩ (ℝΛ)^⊥`; Remark B.7, which follows it, says the same formula with a general ambient lattice `Δ` in place of `ℤⁿ` is false. The general statement, with `Δ^*` on the right, is GeometryOfNumbersAndQuadraticArithmetic §0.2.5. For `Δ = 2ℤ²`, `W = ℝ(1,1)`: the projection is `ℤ(1,−1)`, its dual `ℤ(½,−½) = Δ^* ∩ W^⊥`, while `Δ ∩ W^⊥ = ℤ(2,−2)`.

Smallest change: "Proposition B.5, for a primitive sublattice of `ℤⁿ`; for a lattice in a real inner-product space, GeometryOfNumbersAndQuadraticArithmetic §0.2.5: the dual of the orthogonal projection is the dual cut by the subspace". The supplier contract (line 2243) already has the general statement right.

## N01 — Two arXiv preprints from 2026 are called "nearest published results"

The Origins of 7.8a (line 1277) and 7.16 (line 1790) use that phrase for Čoupek–Gazaki–Marmora (arXiv:2603.26035) and Bhatt–Gee–Kisin (arXiv:2607.08660), which the References list as arXiv preprints. "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies of Layer 7 (line 2026) is process wording

"And outside this family" says the same and does not go out of date.

## Questions for the author

- The Origin of 7.9 cites Dieulefait–Wiese, Proposition 6.1, with the Trans. Amer. Math. Soc. reference. In arXiv:0905.1288v1 the statement is numbered 6.1 (it is the one meant). Is the number the same in the published version? The published text is paywalled, so I could not compare.

## Previous findings

- The previous review (of `374b9ce`) raised no finding. The folder is unchanged since that head, so its two small corrections and two format notes stand: they are C01, C02, N01 and N02 above, not repaired (lines 197 and 1928–1929; the description's sentence; lines 1277 and 1790; line 2026).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.1, Origin (Hida; PadicFamilies §1.7a) and its Check | `𝕋 = M = {(a,b): a ≡ b mod ℓⁿ}`, `Z_good` the first point | `e_YM = O`, `M ∩ V_Y = ℓⁿO`, length `n`; §1.7a's Check gives `Ψ_ξ ≅ O/ϖⁿ`. Hida (3.11a–b) is `(h(F) ⊕ h(B))/h` | holds | none |
| 7.4, revised route of (1) and (4) | hosts of the chain; `F = ℚ`; level of `V_j` | §16.1 needs `[E⁺:ℚ] ≥ 2`, `E/E⁺` unramified, standard form: Layer 2 intro gives `f ≥ 8` and unramified, §2.2 the form. Level hyperspecial off `S(ξ)`, so `Π` unramified at split `w ∉ Σ ∪ Q` and above `ℓ ∉ {g₀,g₁}` | holds | none |
| 7.5 (1), twists from §16.1 | `n = r+t`; block `Σ` (`d=1`, `n_i=r`); character `c` (`d=t`, `n_i=1`, `j=c−1`) | `s = −(n−r)/2 = −t/2`; `s = (t−1)/2 − (c−1) − (r+t−1)/2 = −r/2 − (c−1)` | holds | none |
| 7.5 (1), parameter via ThetaKernelsForUnitaryDualPairs §3.21a (iii) | ranks `r ≤ r+t` | lift parameter `(cα_1,…,cα_r)` plus a string of length `d − n = t`: the Speh block of one character | holds | none |
| 7.5a, Origin: Gan–Qiu–Takeda Thm 7.3 (i) | `m = r+2t`, `m′ = r`, `n = r+t` | `m + m′ = 2(r+t) = 2n`, `m > m′ > 0`; residue `A_{−1}` = nonzero constant × theta integral of the complementary space (GanQiuTakeda2014 line 1693) | holds | none |
| 7.9, Origin (Dieulefait–Wiese Prop. 6.1) and Method | `N = 8`; `ℓ ∉ {p,q}`, `ℓ ∈ {p,q}` | source: one irreducible local place per `ℓ` (`D_q` or `D_u`). Here `p ∈ (N/2, N−3] = {5}`, `p + 3 = 8 ≤ N`: Jordan applies | holds | none |
| 7.6, Origin and `#Exc` | window `|n − W₀| ≤ X`, `X = Sc+2η_s+2σ⁺+4` | `2X + 1 = 2Sc+4η_s+4σ⁺+9` integers per base size, as stated | holds | none |
| 7.7a | `ℓ = 3`, `t = 3`, `s₀ = 1` | `v_δ = (1+v₃(1)) + (1+v₃(2)) = 2` | holds | none |
| 7.7b (ii) | `ν_ρ(w) = e_ρ`, `ν_χ(w) = e_χ` | `Σ_w(e_ρ + t·e_χ) = #{w∣ℓ}(e_ρ + t·e_χ)`: the formal proof's form is the specialisation | holds | none |
| 7.7c | `ℓ > t+1`, `χ_cyc(g)` a generator mod `ℓ` | `1 − χ_cyc(g)^{−i}` unit for `1 ≤ i ≤ t−1 < ℓ−1`, so `v_δ = 0` | holds | none |
| 7.7d, *Corollary of* PadicHodgeRegulators §1.5 | `u ∈ Col`; `ū`; convention `χ_cyc` of weight `−1` | at `u`: cloud weights `> t`, so only `≤ m` lows negative per embedding, `H⁰ = 0` by (L): `j_u ≤ n_u·m`. At `ū`: `W^*(1)` has weights `q − t > 0` on the cloud: `≤ n_u·m` | holds | none |
| same, convention witness | `ℚ_p(1)` over `K` | `Fil⁰ = 0`, `dim H¹_f = [K:ℚ_p]`: weight `−1` counts; agrees with §1.5's Check and SelmerIwasawaCohomology §4.9's | holds | none |
| 7.8 (1), (H3) and (H5) | weights off `[−1,t]`; `o_δ = 15`, `ℓ = 3` | `a ↦ t−1−a` sends negatives to `> t`: negatives at `τ` and `τ∘c` total `r`. `δ(z)` of order 5: `δ(z)² − 1` divides 5, a unit at 3 | holds | none |
| 7.8a, Origin | order of `c` | statement has `c_B ≤ C_B·t·[E:ℚ]·(r+t)·(1+log_ℓ 4b)` (line 1303): the Origin's order | holds | none |
| 7.10a, Origin and Method | the table | six rows; rows 5–6 (`2`, `3`, `ℓ∣f_E`, `q`, `d`) bounded as wholes, as the Method says | holds | none |
| 7.10b, Method | type prime `g_i` | `g_i` splits completely in `E`: `2f` places above `ℓ`, each `E_w = ℚ_ℓ` | holds | none |
| 7.10c | weights of the sum | `Σ_{𝔭∣ℓ} ϱ(𝔭)e_𝔭 = Σ e_𝔭f_𝔭 log ℓ/[𝕃:ℚ] = log ℓ` | holds | none |
| 7.11 (headline 1), Method | `B₀ = fmbx^ε`, `L = x^ε` | `fmbL² = fmbx^{2ε} = x^ε·B₀`; `d^Z_j(C·x^εB₀ + V) ≤ d^Z_j(C+κ_W)x^εB₀` when `V ≤ κ_Wx^εB₀` | holds | none |
| 7.15 (a), Origin: Horesh–Karasik B.5 | `Δ = 2ℤ²`, `W = ℝ(1,1)` | `π(Δ)^* = ℤ(½,−½) = Δ^* ∩ W^⊥ ≠ Δ ∩ W^⊥ = ℤ(2,−2)`; B.5 is the case `Δ = ℤⁿ` | README attributes the general form | C03 |
| 7.15 (b), Check and Method | `M = 𝒪²`, `ℓ = 2` unramified, `Z` the diagonal | `PM = 𝒪(1,1)/2`, `(PM)^∨ = 𝒪(1,1)`: `ℐ = ℐ⁺ = 1 = e_𝔭η + 0`. Divided product: integer `∣P∣·D_V·ℓ^𝔧` | holds | none |
| 7.16 (headline 4), Check (ii) | `ℓ = 19`, `λ = (44,0)`, `μ = (25,19)`, `h = 57` | shifted `{45,0}`, `{26,19}`, both `{7,0}` mod 19; `κ = ⌊57/18⌋ = 3`; `i_W = 0 < dp = 19`: negative control | holds | none |
| 7.16a (2), narrowed | `F = ℚ`; consumers | "`E/F` unramified at every finite place" excludes `F = ℚ`, so `[F:ℚ] ≥ 2` as §16.1 asks; level prime to `ℓ` gives crystalline lifts. No roadmap cites (2) | holds | C01, C02 |
| 7.16a, Origin: Emerton–Gee–Herzig | Lemma 4.5.1; §7.4 | 4.5.1 is the Deligne–Serre lift (EGH11 line 1579); §7.4 with Lemma 7.4.1 reduces the coefficient lattice (lines 2475, 2519): the step of the route of (2) | holds | none |
| 7.16, 7.8a Origins: nearest results | abstracts | Bartlett: weights differing by at most `p`; Čoupek–Gazaki–Marmora: `0 ≤ r < p−1`; Bhatt–Gee–Kisin: Breuil–Kisin modules, `μ_p`-equivariance; all three as the README says | holds; two are preprints | N01 |

- Source locators checked against the text: GanQiuTakeda2014 Thm 7.3 (i) (line 1693); Dieulefait–Wiese Prop. 6.1 (arXiv v1, lines 434–444); Horesh–Karasik Prop. B.5 and Remark B.7 (arXiv v2, lines 1534, 1552); Emerton–Gee–Herzig Lemma 4.5.1 and §7.4 (arXiv v2); Hida 1986 (3.11a–b); the abstracts or introductions of Urban, Bartlett, Le–Le Hung–Levin, Khare–Larsen–Savin, Čoupek–Gazaki–Marmora, Bhatt–Gee–Kisin; Mínguez's bibliographic data.
- Library declarations opened at the pin: `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (`TauCeti/GroupTheory/Perm/Jordan.lean:154`). Neither pinned library has crystalline representations, Bloch–Kato classes, Wach lattices, algebraic modular forms or congruence modules (searched by object), so the four headlines are not statable and the module docstring names each with what it lacks.
- Cross-roadmap citations resolved at this head or on main: PadicFamilies §1.7a; PadicHodgeRegulators §1.5; GeometryOfNumbersAndQuadraticArithmetic §0.2.5; MetaplecticAutomorphicForms §3.14; ThetaKernelsForUnitaryDualPairs §3.21a (iii); BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 and its remark; ThetaChainsOnDefiniteUnitaryGroups Layer 2 introduction, §§2.2, 2.9; SelmerIwasawaCohomology §4.9; the family index's paragraph on `*Corollary of:*` lines.
- Record: no layer, section or item of the README at the merge base is removed or renumbered (20 sections before and after); all 20 carry both labels and one a `*Corollary of:*` line. The only statement narrowed is 7.16a (2).
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing and the pull request does not change it, so there was no `#check` to compare and no one-tactic probe to run.
- The pull request's text: the title and the description agree with the folder's change (sections unchanged in number, labels added, statements restricted, general roadmaps now cited) except for the sentence of C02. The two new suppliers of this folder fall under the description's "which the family now cites".
- Overlap check: read LengthBoundsInPadicFamilies, SelmerLengthBoundsAndLocalLifting, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums and ThetaLiftsForDefiniteUnitaryGroups (open). Shared objects and owners: congruence modules of an algebra, PadicFamilies §1.7a, and of modules, LengthBoundsInPadicFamilies §1.7a, both cited by 7.1; the Bloch–Kato dimension formula, PadicHodgeRegulators §1.5, cited by 7.7d; the dual of a projected lattice, GeometryOfNumbersAndQuadraticArithmetic §0.2.5 and HermitianFormsAndLattices §4.0a, cited by 7.15. Nothing is owned twice. No other open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 11 passages compared with 10 sources (Hida, Gan–Qiu–Takeda, Dieulefait–Wiese, Horesh–Karasik, Emerton–Gee–Herzig, Urban, Bartlett, Le–Le Hung–Levin, Čoupek–Gazaki–Marmora, Bhatt–Gee–Kisin), none shared beyond titles and forced phrases of at most six words; largest share [FormalProof], 128 of 139 locators, not readable; contents not compared, since no layer is added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups, after Hida (1981, 1986), Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and Emerton–Gee–Herzig (2013), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). Rests on the README's summary and References.

## Not verifiable

- Yamana (2014), Theorem 10.1 (2), in the Origin of 7.5a: Invent. Math. is paywalled; the sources service records it as uncertified.
- Bloch–Kato (1990), Corollary 3.8.4, in the Origin of 7.7d: no legal copy found. The deduction was checked against PadicHodgeRegulators §1.5 and SelmerIwasawaCohomology §4.9 instead.
- Iovita–Marmora (2015), in the Origin of 7.8a: the journal's host is in no licence class of the sources service, so the text was not read.
- Bellaïche–Chenevier (2009), Fontaine–Laffaille (1982), Chenevier–Harris (2013), Caraiani (2012), Ash–Stevens (1986), Minkowski (1887): cited without locators in the new Origins, and not opened.
- The twenty *Method of the formal proof* labels and the 128 [FormalProof] locators, among them every locator of the sampled 7.10a, 7.10b, 7.10c and 7.11: the repository's host is in no licence class of the sources service, so no file was read. The labels were checked only for agreement with the statements and routes beside them.

## Source issues

- none

## For the human reviewers

- Scope: 11 of the 20 sections are labelled "particular to this proof"; their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), neither refereed (README, References).
- Licence: the [FormalProof] repository on GitHub could not be classified by the sources service, and its licence was not read.
- Not tested: [FormalProof] holds 128 of the 139 locators and was not opened; the wording and arrangement checks and the Method labels were not compared against it.
