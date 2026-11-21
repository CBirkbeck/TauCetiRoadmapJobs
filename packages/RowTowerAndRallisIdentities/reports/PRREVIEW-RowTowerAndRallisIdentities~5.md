# Review of RowTowerAndRallisIdentities (pull request #2919 at ad4ea91)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** needs changes

**Summary.** Changes are needed. R01: the comparison of multiplicities 5.9, and with it headline (3), is stated for every abelian CM host, while the supplier it rests on proves it only over the hosts of the chain. R02: headline (2) is stated under a size predicate and a condition on `𝕃` of which three clauses are "not given here", so it cannot be written down. R03: [FormalProof] is cited with no file or declaration, so the statements whose routes stop have no locator. Every Check and computation I redid holds. There are four small corrections and one format note; the scope and licence of the formal proof are for the human reviewers.

## R01 (P2) — 5.9 is stated for every host, but the equality of multiplicities it cites is proved only over the hosts of the chain

A reader takes 5.9, the last sentence of 5.10, 5.12 and headline (3) as theorems for every chain. The Conventions fix `E` as "the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield" (line 61), and 5.9 assumes only the gap `100r⁴` (lines 1350–1353). Its route is one application of BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a, quoted at lines 1364–1367 and in the contract entry (lines 1720–1724) as a statement about "two inner forms of a unitary group in an odd number of variables". At its head §13.8a begins "Let `E` be a host of the chain (FrobeniusRestrictedRieszSums §0.4)", and that roadmap's scope says it owns the equality "over the hosts of the chain". [FormalProof] agrees: `GlobalTheory.CuspMult.MultEq` (`Development/AbelianVarietyTheory/Proofs/DivisorProofs/FinRepApply.lean`, line 118) is stated over the host of the proof's own record. ThetaChainsOnDefiniteUnitaryGroups allows hosts beyond §0.4 (any prime `d ≡ 7 (mod 8)`), so on such a host 5.9 has no proof anywhere.

Smallest repair: begin 5.9 with "Let `E` be a host of the chain (FrobeniusRestrictedRieszSums §0.4)". Quote §13.8a with its field in the Route, in *Needs* and in the contract entry. Carry the hypothesis into headline (3) of the Summary; the third bullet of the `Suggested.lean` docstring then inherits it through "the hypotheses of … 5.9". Alternatively, give a route for general hosts.

## R02 (P2) — Three hypotheses of 5.8e and 5.8 are "not given here", so headline (2) has no complete statement

An implementer cannot state the separation theorem or the rational structure, because part of what they assume is withheld:
- `Size_□` clause (o): "the standing size predicates of the chain hold at its parameters (not given here: their list)" (lines 1190–1191);
- (L1): the values of "the character of `E` that the chain attaches to `ψ` (not given here: its definition)" (lines 1269–1270);
- (L5): the "term attached to the step point", whose explicit form is not given (lines 1279, 1302);
- the normalisation "for a level" of the measures in the statement of 5.8e (lines 1205–1206).

The Summary states headline (2) "under the size predicate `Size_□` of 5.8e, if the field `𝕃` … contains the finitely many algebraic numbers that 5.8 names" (lines 26–27), so the gap reaches the headline. The formal proof's predicate is explicit: `GlobalTheory.IndefiniteRowSideFullHecke.LevelPlusSubgroup.SizeRows` (`Development/AbelianVarietyTheory/BlockTheory/DivisorBase/LevelPlusSubgroup.lean`, line 20) is a conjunction of thirteen clauses. Ten of them are (i)–(viii) here (clauses (v) and (vi) are two conjuncts each). The other three are the existence of a parameter choice with one constant equal to `10`, a predicate `SizesAt` of the scale, and the equality of an ideal of the host with the unit ideal.

Smallest repair: write clause (o) as a list of named predicates of ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.3c. Define the character of (L1), or cite the section of the chain that defines it. In (L5) either give the term or keep only the case the parenthesis already reduces to (L3). State the measures of 5.8e in the conventions of 5.2.

## R03 (P2) — [FormalProof] is cited with no file or declaration, so the statements whose routes stop have no locator

These statements have no other source, and a reader cannot find where they are established. The References make [FormalProof] "the reference of every *NEW* target" (line 1855), yet the README names no file or declaration of it. Sibling roadmaps do: ThetaLiftsForDefiniteUnitaryGroups §6.11 ends with the file and the declaration `…WeilTensorModels.ThetaIntegralsAgree`. Without route or locator here:
- 5.7: the irreducibility of `𝒲_j` and the existence of the intertwiner, both under "prove that" (lines 830–832, 862);
- 5.8a: the places `w(v)` in (e), and in (p) the discriminant of `F` and `#μ_E` (lines 983, 996);
- 5.8e: the Lemmas "the level is not too deep" and "the gaps of the grid", the steps (A)–(G), which are "statements with no target here", and `p_□ < g₀`, `p_□ ≠ g₁` (lines 1216, 1222, 1224, 1251);
- 5.8: the existence of `Ω`, `Ω′` in (L7) (line 1301);
- 5.11: the algebraicity of the theta values in the rational lift (line 1472).

Repair: name the declaration and file at each of these, or complete the route. I opened the following in the repository the README links, as starting points:
- 5.6, unprojected descent: `GlobalTheory.ChainOnto.OntoAll`, `Development/AbelianVarietyTheory/Definitions/LatticeFrames/ChainParSucc.lean`, line 103;
- 5.8e, separation: `…LevelPlusSubgroup.FunctionalsSeparate`, same file as `SizeRows`, line 83 (it has the quantifiers `∀ ε, ∀ C_F ≥ 6510, ∃ x₀` of the statement here);
- 5.8b: `GlobalTheory.FunObj.SquareTriple`, `Development/AbelianVarietyTheory/Proofs/DivisorProofs/SquareTriple.lean`, line 21;
- 5.8c: `GlobalTheory.FunObj.IsSquareConst`, `Development/AbelianVarietyTheory/Definitions/Divisors/ExistsNotRelZero.lean`, line 213;
- 5.9: `GlobalTheory.CuspMult.MultEq` (R01);
- 5.10a: `Formalism.IndefR.FWT.JEvExists`, `Formalism/LocalToGlobal/IndefiniteReal/FWExist.lean`, line 416.

## C01 — In the route of 5.8 the lattices of the row type level are said to span `𝔼_𝕃`; they span its row-type part

Line 1337 says the lattice `ι_ξ(proj_{Q_ξ}(M̃_ξ ∩ ℋ^{rt}_ξ))` "spans `𝔼_𝕃`". By 5.6, `ι_ξ` maps `ℋ^{rt}_ξ` onto `𝔼 = 𝔼_1`, not onto `𝔼^♮`, so the lattice spans `𝔼_{1,𝕃} = e_{P_1,χ_{P_1}}𝔼_𝕃`. The commensurability stated at line 1317 is unaffected. Write "spans `𝔼_{1,𝕃}`".

## C02 — The Check of 5.10 takes `m = 1`, which is not a chain, and it holds by the definition of `𝔫`

ThetaChainsOnDefiniteUnitaryGroups §2.1 takes `m` even with `m ≥ 2`; with `m = 1`, `r = k` would be even, against "`r` and `t` are odd" (line 429). And `𝔫 := 𝔫₀/∏a_j` with `λ_j := a_jL_j` gives the identity for every `m` by substitution, so the Check (line 1412, repeated at lines 1537–1538) cannot fail. Either mark it as an illustration of the definition at `m = 2`, or replace it by one that could fail: under `𝔪_j ↦ c𝔪_j` for one `j < m`, the constant `𝔫` changes by an explicit power of `c` while every `λ_j` is unchanged.

## C03 — 5.8d quotes ThetaLiftsForDefiniteUnitaryGroups §6.12 without the regularising place `v₁`

Lines 1091–1094 obtain "one constant `C` for all the tuples" from bases fixed at the places of `P`. §6.12 at its head also fixes "the place `v₁` of 6.3, outside `P`" before `C`, and notes that the formal proof fixes `v₁` before `C`. Add that `v₁` is chosen once for all the tuples considered, outside `P`, in 5.8d and in the contract entry for 6.12 (lines 1667–1669).

## C04 — The classical attributions carry no theorem or page

The *KNOWN* lines and the References (lines 1835–1851) name Rallis, Kudla, Li, Ichino, Harish-Chandra, Godement, Green, Paul, Arthur–Clozel, Labesse, Harris and others by title at most, several by name only ("G. Shimura; P. Deligne", "D. Blasius", "R. Godement"). The routes stand on supplier sections, so these are credits; a theorem or section number with a page would let a reader find them.

## N01 — The paragraph "Statements of the formal proof" (line 216) sits under the heading "Table of symbols"; it belongs beside the "Routes" paragraph of the Conventions (line 154).

## Questions for the author

- Which of the three unmatched clauses of the formal proof's size predicate (R02) does clause (o) of `Size_□` stand for, and is the clause that an ideal of the host is the unit ideal a property of every host here? I could not identify that ideal from the definitions I opened.
- 5.8c (i) says the composite kernel is the kernel of the triple "up to an explicit unitary character" (line 1052). Does the formal proof give the character for the route through `M`, or only that the factor is nonzero? I did not open that statement.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.1 Checks | negatives of `𝒟^{(j)}_τ`; parity of `n_j` | `⌊(m−j)/2⌋`; shift exactly for odd `j` | `#{i ∈ (j, m−1], i−j odd} = ⌈(m−1−j)/2⌉`; `r + jt ≡ 1 + j` | holds | — |
| 5.2 gap (G) | `min(p,q) ≤ m`, `N_m ≥ 8m` | `120·n_{j−1}·min(p,q)^{3/2} ≤ 2N_m³` | `120N_mm² ≤ 2N_m³ ⟺ N_m ≥ 7.75m`; `N_m ≥ m(3m+2)` | holds | — |
| 5.2 Check | `j = 1` | `μ_1η̃^{−1}` on `Y_0` | `dim Y_{j−1} ≡ j (mod 2)`, `Y_0` odd | holds | — |
| 5.2a | Schur orthogonality; `SL₂(ℝ)`, weight 2 | `σ(e_σ)` is the projection on `w`; not integrable | `⟨u, σ(e_σ)v⟩ = ⟨u,w⟩⟨w,v⟩`; coefficient `cosh^{−k}`, measure `sinh 2t`, integrable iff `k > 2` | holds | — |
| 5.3 Checks | `r = 15`; `r = 7`; `r = 9, 11, 13` | (4) fails at `a = 4`; no good tuple; a prime exists | sums `{1,3,4,…}`, `{2,4,…}`; `(3.5, 4]` empty; `5`, `7`, `7` | holds | — |
| 5.3 (i), supplier | DiscreteSeriesCoefficients §2.4a (d) | `h > npq + 1`, `h > 16√(2q₀)·n·q₀` | same two thresholds at its head | holds | — |
| 5.4 identity | level `(P_1, χ_{P_1})` | `c_I(j)(ξ) = 𝔪_j·vol_f(K^{rt}_j(ξ))` | `\|P_1\|·𝔪_j·vol_f(K^{pr}) = 𝔪_j·vol_f(K^{rt})` | holds | — |
| 5.5 Weil's condition | `Y_{i+1}`, doubled space of rank `2n_i` | Witt index `< t` | ThetaKernels §5.7a: `m − r > (dim W)/2`, `n_i + t − r > n_i` | holds | — |
| 5.5 Hecke factors, twist place | `s = t/2`; `r = 1, t = 3, q = 2` | values at `1, …, t`; `15/16` | `s + t/2 − l`, `l < t`; `15·(1/16) = 1 − 2^{−4}`; `∏_{t+1}^{t+n_i}` | holds | — |
| 5.5 integrability | `N_m > 3m²` | both thresholds `< 2N_m³` | `n³/4 + 1 < 2N_m³`; `8m^{3/2}N_m < 2N_m³` | holds | — |
| 5.6 / H1 | split place; convergence | `\|1 − βūN w^{−s}\|^{−2} > 0`; absolute convergence for `t > r` | conjugate factors at `w, w̄`; exponent `(r−t)/2 − 1 < −1`; (R5) gives `t ≥ r + 5` | holds | — |
| 5.7 | normalising factor; (ii′) | `∏_{n=t+1}^{r+t}L(n, η^n)`; factor `\|H\|` | `d(t/2)`: arguments `t + r − i`, characters `η^{r+t+i} = η^{n}`; `(\|H\|^{1/2})²` | holds | — |
| 5.8a signatures | `X^c_i ⊂ V(i,0)`, `C⁺` | `⌊(m−i+1)/2⌋ + ⌊i/2⌋ = m/2`; rank `m − 1` | both parities of `i` give `m/2`; `2n⁺ + 1 = m − 1`, negatives `m/2` | holds | — |
| 5.8b | ranks; spacing | `ε_□ = (t+s)/2 > 2m − 1`; left side `> 3h_c − 1` | `(4m+1)/2`; `p + q = m − j − 1`; `c_{m−i} > v_0 + (i+3/2)h_c − ½`; ThetaLifts §6.11 hypotheses 1–4 as quoted | holds | — |
| 5.8c | ThetaLifts §6.11 | unique `c ≠ 0` on matched data | §6.11: "a unique `c` … `c ≠ 0`", `v₁` outside `T` | holds | — |
| 5.8d | telescoping; §6.12 | at most one `ρ` factor left | `q − p ∈ {0, 1}`; ranges `ε+1…ε+q` and `ε+q−p+1…ε+q`; §6.12 fixes `v₁` outside `P` | holds; quotation incomplete | C03 |
| 5.8e | coset data; size predicate | `N(𝔪_□)^{Σ(r+is)(r+(i+1)s)}`; `Size_□` (o)–(viii) | rank of `Hom` is `(r+is)(r+(i+1)s)`; proof's predicate has 13 conjuncts, 3 unmatched | count holds; hypotheses incomplete | R02 |
| 5.8 / H2 | `𝔼_𝕃`; lattices | `𝔼_𝕃 ⊗ ℂ = 𝔼^♮`; lattice "spans `𝔼_𝕃`" | `c_tot(1)κ_G^{−1}ℬ_a(ι_ξx) = ϱ_ξ^{−1}(c_tot(1)/c_tot(ξ))v ∈ 𝕃`; `ι_ξ(ℋ^{rt}_ξ) = 𝔼_1` | structure holds; slip in route | C01, R02 |
| 5.9 | BaseChange §13.8a | any host of §0.1 | supplier: hosts of §0.4 only | missing hypothesis | R01 |
| 5.10 | `m = 1` | `𝔫 = 𝔫_1/a_1` | definitional; `m` even in §2.1 | holds trivially | C02 |
| 5.10a | reflex field | `K`; `k + j − 1 ≠ m − j` | stabiliser of `Φ` is `Gal(E/K)`; `k ≥ m + 3` gives `k + j − 1 > m − j` | holds | — |
| 5.11 | `𝔫 > 0` | from `ι_1ι_1^* ≥ 0` and `λ_j > 0` | `λ_j = a_jL_j`, `a_j > 0`, `L_j > 0` (5.6); scalar nonzero | holds | — |
| 5.12 / H3 | Gram matrix; surjectivity on rational points | `\|H\|·𝔫·∏λ_j·X_ξ` | `ι^*ιx = cx` on `ι^*(𝔼[𝔥])`; `⟨x,y⟩ = \|H\|X_ξ`; equal `𝕃`-dimensions | holds; inherits 5.9 | R01 |

- Source locators checked: the README has no locator into an external text. [Announcement] read (190 lines). In the repository the README links for [FormalProof] I opened 9 declarations (those named in R01–R03 and `GlobalTheory.T.exists_orthonormal_cuspidal_isometric_intertwiners`, `GlobalTheory.PsCo.Pc.TRCusp'`).
- Supplier sections read against this README: BaseChange §13.8a; ThetaKernels §§5.6a, 5.7a, 6.13a, 6.13b; ThetaLifts §§6.1, 6.11, 6.12; DiscreteSeriesCoefficients §§2.4a, 9.1; LocalFactorsOfTwistsAndTypes §7.2; ThetaChains §§2.1, 2.2 (g), 2.3 (h), 2.3c, 2.5, 2.9c; MetaplecticAutomorphicForms §§5.7, 5.8; AbelianSchemesAndArithmeticModuli A5.4.
- Cross-roadmap citations resolved: 150 section headings at the heads of 15 open roadmaps and on main (13 roadmaps); none missing.
- Library declarations opened at the pin: `NumberField.IsCMField` (Mathlib/NumberTheory/NumberField/CMField.lean:70), `NumberField.AdeleRing` (AdeleRing.lean:56), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105), `HeckeRing` (NumberTheory/HeckeRing/Defs.lean:189), `DirichletCharacter.LFunction` (LSeries/DirichletContinuation.lean:60).
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 2006 edges, 0 problem(s)`. Changes outside the folder: the family index only.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages; with no declarations there is no `#check` comparison and no one-tactic probe.
- Pull request text: title and description agree with the head (a new roadmap; `Suggested.lean` declares nothing).
- Headlines: (1) 5.5/5.6/5.10, (2) 5.8, (3) 5.12; none statable at the pins, and the docstring names each with the carriers it lacks.

Overlap check: read SeesawForThetaChains, ThetaLiftsForDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds, ThetaKernelsForUnitaryDualPairs (open) and AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups (main); the open ones cite 5.1–5.12 as this roadmap's; nothing shared.

Source independence: 6 passages (Summary, 5.3 (iii), 5.6 base-tuple clause, 5.8e statement, 5.9 route, the `Suggested.lean` docstring) compared with 2 sources ([Announcement] lines 155–169; six [FormalProof] statements, which are Lean code without prose), none shared; largest share [FormalProof], the reference of the 15 *NEW* attributions; contents compared with its file tree: independent (the declarations of 5.3, 5.6, 5.8c, 5.9 lie in four unrelated directories).

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1982; Li 1992; Ichino 2004, per the README's References), assembled into the row side of the chain of theta lifts in Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; [Announcement] lines 158–169).

## Not verifiable

- The works of the References (Rallis, Kudla, Li, Ichino, Harish-Chandra, Green, Arthur–Clozel, Labesse, Milne, Harris, Katz): cited without locators; not opened.
- [FormalProof] beyond the nine statements opened: the proofs were not read, and the constant identities of 5.5, 5.7 and 5.8d were not compared with it.

## Source issues

- none

## For the human reviewers

- Scope: the 15 *NEW* targets rest on [FormalProof] alone (README line 1855), an unrefereed Lean formalisation by one author announced on 2026-11-20 with no accompanying paper.
- Licence: the README of the repository linked for [FormalProof] says the submission was published without a licence and is mirrored for verification. The roadmap restates its mathematics and copies no code.
- Not tested: [FormalProof], the source with the largest share, has no prose and no table of contents; wording was compared with six statements and the arrangement with its file tree only.
