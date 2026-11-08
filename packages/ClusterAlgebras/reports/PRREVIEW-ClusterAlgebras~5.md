# Review of ClusterAlgebras (pull request #1858 at bb25a68)

**Verdict:** needs changes

Two findings remain, both P3. Neither is blocking. All four findings from the previous review are repaired (details at the start of *Verified sound*).

## R01 (P3) — sampled theorems with no locator at the claim

**Location.** Six places in `TauCetiRoadmap/ClusterAlgebras/README.md`:
1. §1.5, lines 713–715: "Prove `w_i b_ij=−w_j b_ji`. Matrix and form mutation are `B̃'=E_ε B̃ F_ε`, `Λ'=E_εᵀΛE_ε`. Prove independence from ε, preservation of alternation and column compatibility with the same w, and involutivity." The only locator in §1.5 is BZ Definition 4.3, which covers toric frames.
2. §1.6, lines 803–807, defines `A_{R,u,S}`, `T_t` and `U_{R,u}` and states their re-rooting laws. It has no locator.
3. §2.5, line 1358: "See BZ, §§3–6, for the ordinary quantum case."
4. §3.4, lines 1718–1724 and 1750, states the principal extension, its fiber over 1 and `T_k`. The only source note is "(GHKK's `max` convention)".
5. §6.1, lines 2217–2218 and 2230: "prove it smooth, irreducible, of dimension `rank(G)+ℓ(u)+ℓ(v)`", and "(its Definition 1.5) as a biregular isomorphism with inverse".
6. §6.2, lines 2261–2265: "Prove `B̃(i)` skew-symmetrizable of full column rank, and that the frozen minors are units … `x'_k` is regular, and that the cluster of `μ_k` gives a chart". The only locators are Definition 2.3, Remark 2.4 and (2.9)–(2.11).

**Claim.** Every theorem should carry its locator in parentheses at the claim. These sampled statements have none, or only a pointer to whole sections. In item 3 the pointer is also wrong in part: BZ does not prove the H-grading or the frozen localization of Q4.

**Witness.** Each source below was read at the line given.
1. BZ: Definition 3.1 (l.202, p. 5), Proposition 3.3 (l.258, p. 6), (3.1)–(3.4) with Proposition 3.4 (l.264–293, pp. 6–7) and Proposition 3.6 (l.326, p. 7). All are stated for `w=d>0`. The roadmap's arbitrary-`w` version still holds: the key identity `w_i[−εb_ik]_+=w_k[εb_ki]_+` is true because `b_ik` and `b_ki` have opposite signs.
2. BZ Definition 4.12 (l.560, p. 13) and (5.2)–(5.3) (l.589–600, p. 13). BZ inverts every frozen variable, so a proper subset `S⊊J` is this roadmap's extension.
3. The bar involution is BZ Proposition 6.2 (l.823, p. 19). The gradings of BZ §6 (l.863–879) are "not an algebra grading". Frozen localization does not occur in BZ.
4. GHKK Appendix B (l.4488–4494, p. 113) gives the principal form `{(n₁,m₁),(n₂,m₂)}={n₁,n₂}+⟨n₁,m₂⟩−⟨n₂,m₁⟩` and `Ñ°=N°⊕M`. The fiber over 1 is Proposition B.2 (l.4513). `T_k` is (1.23) (l.1076, p. 29) with Proposition 2.4 (l.1323, p. 36).
5. FZ, *Double Bruhat cells*: Theorem 1.1 (l.168, p. 4) for the dimension. Theorem 1.6 (l.290, p. 6) for biregularity of the twist and its inverse.
6. BFZ III: Proposition 2.6 (l.537, p. 12) for full rank and skew-symmetrizability. Lemma 2.12, parts 1, 3 and 4 (l.714–732, p. 16), for the frozen units, regularity of `x'_k` and the adjacent charts.

**Repair.** Add these locators at the claims.
1. §1.5: "(BZ, Definition 3.1 and Propositions 3.3, 3.4 and 3.6, stated there for `w=d`)".
2. §1.6: "(BZ, Definition 4.12 and (5.2)–(5.3); BZ inverts all frozen variables)".
3. §2.5: replace line 1358 with "(BZ, Proposition 6.2, for the bar involution; the H-grading and the frozen localization are proved here)".
4. §3.4: "(GHKK, Appendix B and Proposition B.2)" at the principal extension, and "(GHKK, (1.23) and Proposition 2.4)" at `T_k`.
5. §6.1: "(FZ, *Double Bruhat cells*, Theorem 1.1)" at the dimension claim, and "(Definition 1.5 and Theorem 1.6)" at the twist.
6. §6.2: "(BFZ III, Proposition 2.6)" at the rank claim, and "(BFZ III, Lemma 2.12)" at the unit, regularity and chart claims.

## R02 (P3) — section comments in `Suggested.lean`, and a Downstream consumers section that names no consumer

**Location.**
- `TauCetiRoadmap/ClusterAlgebras/Suggested.lean`, lines 35, 52, 74 and 93: "/-! ## Classical Laurent charts: §0.2 -/" … "/-! ## Headline statements: Layers 2, 4 and 5 -/".
- `README.md`, lines 2324–2333: "## Downstream consumers / - The cluster scattering comparison in §5.1 supplies the chamber and mutation identifications used for theta transport to cluster charts in §5.2."

**Claim.**
- The Lean form calls for one `/-! ## Layer k: <title> -/` comment per layer, in README order. The file states targets of Layers 0, 1, 2, 4 and 5, but three of those layers share a single heading. Also, `principalExtension` is defined in README §2.2 (line 1082) yet sits among the Layer 5 theorems.
- The four "Downstream consumers" bullets describe flows inside this roadmap; they repeat the layers' Dependencies and name no consumer.

**Witness.**
- `roadmaps grep ClusterAlgebras` finds no citing roadmap, on main or at any of the 470 open heads.
- On main, RootSystems, ReductiveGroups and SchemeAndStackFoundations list other roadmaps under this heading. ScatteringDiagrams writes "None."

**Repair.**
- `Suggested.lean`: use five comments:
  - `/-! ## Layer 0: coefficient and ambient algebra -/` before `LaurentRing`;
  - `/-! ## Layer 1: classical and quantum seeds and mutation -/` before `ExchangeMatrix`, and delete line 74;
  - `/-! ## Layer 2: upper bounds and the Laurent phenomenon -/` before `laurentSubalgebra`, with `principalExtension` moved to just after this heading;
  - `/-! ## Layer 4: finite type and almost-positive roots -/` before `cartanCompanion`;
  - `/-! ## Layer 5: scattering, positivity and sign-coherence -/` before `exists_nonneg_laurentExpansion`.
- Tested: a scratch copy with exactly these edits elaborates with the 8 `sorry` warnings and nothing else.
- README: write "None." under Downstream consumers. Move the §2.6 bullet into Layer 2's Dependencies; the other bullets are already covered by the Dependencies of Layers 5 and 6.

## Verified sound

**Repairs of the previous review (at dbaa5d0).**
- **R01 (P2, two owners of the based quantum torus): repaired.**
  - §0.4 lines 303–304 now read "let `T(R,u,Λ)` be the full `QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 with `q=u` and `β=Λ`".
  - Its target list keeps only `UniqueSums`, the domain property, Ore conditions, mixed subalgebras and charts.
  - ScatteringDiagrams §4.3 is now named in the supplier contract (lines 116–119), in §0.4's *Needs* (lines 346–347) and in the build table (line 161).
  - The InductionRestriction supplier entry, the instruction to the supplier and the Downstream bullet are gone. `grep` for "twistedMonoidAlgebra", "InductionRestriction" and "existing twisted" finds nothing.
  - ScatteringDiagrams has since merged to main as c40c3b45. Its §4.3 (README line 1391) defines *QuantumMonoidAlgebra* for any commutative `R` and unit `q`. It supplies basis theorems, coefficient maps along `φ(q)=q'`, lattice maps that preserve the form, and the `β=0` comparison. The trivial datum `(L,{0},0)` satisfies its §0.1 *PositiveDegrees* (line 144: δ is positive on `P∖{0}` and has finite cutoffs).
  - Outside the folder, the pull-request description still says "The twisted algebra uses Tau Ceti's existing carrier". That sentence is out of date, but it is not a finding against the roadmap.
- **R02 (P3, `finite_clusterVariables_iff` too narrow): repaired.** `Suggested.lean` lines 152–157 now state the geometric-type form exactly as the witness gave it, and README line 1858 says "geometric-type signature".
- **R03 (P3, locators): repaired.**
  - §2.7 cites FWZ Proposition 6.4.1 and Remark 6.4.4 (lines 1517–1518) and Stacks 0E9I (line 1492).
  - §2.4 cites the Laurent-phenomenon paper's Theorem 1.8 and Example 3.3 (lines 1312–1313), and the paper is in References (line 2344).
  - §0.5 cites BFZ III Lemmas 4.1–4.2 and BZ Lemmas 5.5–5.6 (lines 361–362); §0.6 cites BZ Proposition 11.2 (line 426); §0.7 cites BFZ III Lemma 4.6 and BZ Lemma 5.8 (line 472).
  - "Corollary 2.17" is deleted from §6.3, and SchubertGeometry is gone from the contracts, §6.1's *Needs* and the Layer 6 Dependencies.
- **R04 (P3, Checks form): repaired.**
  - §§1.4, 2.1, 2.3, 2.5 and 2.6 each now have a single `**Checks.**` bullet list.
  - The §2.1 non-integrality remark is now prose (lines 1017–1021). Its claim is correct: `BᵀΛ=3λ·Id`.
  - The §2.4 proof-route sentence and the §2.6 "must" sentences are deleted.

**Gate, build, dependency check and overlaps.**
- Worker's gate at bb25a68: every counter is 0, `build=0`, OK.
- Nothing outside the folder changed. `metadata.toml` has `topic = "math.RA"`.
- `lake env lean TauCetiRoadmap/ClusterAlgebras/Suggested.lean` gives 8 `sorry` warnings (lines 107, 118, 127, 134, 152, 160, 171, 186) and nothing else.
- `gate --depcheck … --movable` output: `depcheck: 237 roadmaps, 2422 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- ClusterAlgebras is at line 397 of the merge order. All of its suppliers are on main: ScatteringDiagrams, RootSystems, ReductiveGroups, SchemeAndStackFoundations and Completed/AnalyticToricGeometry. QuantumGroups appears only as a boundary.
- The overlaps report (`roadmaps overlaps ClusterAlgebras`) lists no other pull request changing this roadmap, no dropped ids, no revision-only ids and no close roadmaps.

**Signatures and padding.**
- I ran `#check @` on all 21 declarations in one scratch file. The elaborated types match the worker's elaborated signatures and the README statements, and no declaration uses section variables, so none can lose a binder. Nothing changed.
- One-tactic probe (`first | rfl | simp | infer_instance | decide | aesop`) on all 8 theorems: none closes.
- All 13 definitions are used by a headline.
- Headlines stated: Laurent phenomenon, upper-bound invariance, Somos-4, Starfish, finite type 1⇔2 and 2⇔3, Laurent positivity and `c`-vector sign-coherence.
- Headlines named in the docstring as not statable at the pins: quantum Laurent, §5.1 and §6.3.

**Pinned declarations opened.**
- Tau Ceti 2fd255d9:
  - `TauCeti.IsFiniteType` (`LinearAlgebra/RootSystem/FiniteType/Basic.lean:129`: `Finite B`, diagonal 2, off-diagonal ≤ 0, symmetric zero pattern, `∃ d>0` with `(d_iA_ij)` positive definite);
  - `Module.SatisfiesSerreS` (`RingTheory/SerreCondition/Basic.lean:85`);
  - `DynkinType.cartanMatrix` (`LinearAlgebra/RootSystem/DynkinType.lean:219`). Its `.G2` value is `CartanMatrix.G₂ᵀ`, so its entries are `⟨αᵢ,αⱼ^∨⟩` in Bourbaki numbering for every type, which confirms §4.2's convention claim.
  - The `twistedMonoidAlgebra` API (`Algebra/MonoidAlgebra/Twisted/Basic.lean:288–509`) has no domain, Ore or center results, so §0.4's remaining targets are not duplicated.
  - `MonoidAlgebra.isLocalization_away_mapDomainRingHom` (`Algebra/MonoidAlgebra/Localization.lean:53`);
  - `laurentEval`, `laurentEvalEquiv` (`Algebra/Polynomial/Laurent/Basic.lean:124, 152`).
- Mathlib 1b1ccf4b:
  - `RootPairing.Base.cartanMatrixIn` (`LinearAlgebra/RootSystem/CartanMatrix.lean:53`, entry `pairingIn i j`);
  - `CartanMatrix.F₄`, `.G₂`, `.B`, `.C` (`LinearAlgebra/Matrix/Cartan/Basic.lean:110, 118, 132, 141`);
  - `IsMulTorsionFree` (`Algebra/Group/Monoid.lean:552`);
  - `OreLocalization.oreDiv_eq_iff` (`GroupTheory/OreLocalization/Basic.lean:131`), `universalHom` and `numeratorHom_inj` (`RingTheory/OreLocalization/Ring.lean:133, 194`);
  - `MonoidAlgebra.scalarTensorEquiv` (`RingTheory/TensorProduct/MonoidAlgebra.lean:108`).
- A case-insensitive grep of both pins for "cluster algebra", "exchange matrix", "skew-symmetrizable", "Somos", "Laurent phenomenon", "double Bruhat", "generalized minor", "sign-coheren" and "upper cluster" finds nothing.

**Cross-roadmap citations resolved (on main a9069820).**
- ScatteringDiagrams: §0.1 (line 142); §0.8 "Finite component expansion" and "Finite recursion" (lines 526, 533); §1.4 sweep (line 731); §3.3 *exists_outgoingCompletion* (1167); §3.4 *outgoingCompletion_unique* (1229); §4.2 *SkewLatticeDatum*, *AdaptedBasis*, *principalGradingDictionary* and *principalProjectionComparison* (1323–1361); §4.3 (1391); §4.4 *SlabAlgebra* (1461); §5.1 (1503); §5.6 *cylinderBrokenLineLift*, *principalTheta_eq_projectedMonomialSum* and *theta_presentationInvariant* (1886–1900); §7.2 (2187); §7.7 *theta_coefficients_nonnegative* (2438). Its scope (lines 23–29) excludes seeds, mutation and the theta/cluster comparison, which this roadmap owns.
- RootSystems Layers 1–3 (lines 248, 432, 504).
- ReductiveGroups Layers 7, 7C, 8 and 10 (lines 627, 652, 1023, 1731).
- SchemeAndStackFoundations §0.6 `coherent_hartogs` (line 707, with Stacks 0E9I).
- Completed/AnalyticToricGeometry Layer 0.
- QuantumGroups σ-derivation extension (line 609).
- Ownership: `roadmaps grep` over main and the 470 open heads for cluster algebra, cluster variable, Laurent phenomenon, double Bruhat, Somos, sign-coherence, exchange matrix, upper cluster, quantum torus and generalized minor.
  - The only cluster-theoretic hits are this roadmap and ScatteringDiagrams' references.
  - The "double Bruhat" hit in CrystallineLocalGlobalCompatibilityCM concerns parabolic double cosets.
  - The "quantum torus" hits (TemperleyLiebOperatorAlgebras, CompactQuantumMetricSpaces, HeisenbergImprimitivity, GeometricQuantization, OperatorAlgebraDynamics) are C*-algebraic.

**Sources at their locators** (line numbers of the cached extractions; all sampled targets plus the newly added locators).
- §0.5 and §0.7: BFZ III Lemma 4.1 (l.1178, p. 25; its proof gives (4.2), the commutative `C[x^{±1}]∩C[(E/x)^{±1}]=C[x,E/x]`), Lemma 4.2 (l.1210) and Lemma 4.6 (l.1295, p. 28). BZ Lemmas 5.5–5.6 (l.669–703, pp. 15–16), Lemma 5.8 (l.733, p. 17) and Proposition 11.2 (l.1749, p. 40).
- §1.5: BZ Definition 4.3 (l.423, p. 9) and (4.19) (l.453), matching §0.4's `u^{−Σ_{i<j}a_ia_jΛ_ij}` normalization with `u=v`.
- §2.3: FZ IV Theorem 3.5 (l.624, p. 11), Theorem 3.7 (l.650, p. 12), Proposition 3.9 (l.666), Proposition 6.1 (l.1043, p. 20) and Corollary 6.3 (l.1081).
- §2.4: the Laurent-phenomenon paper, Theorem 1.8 (l.85, p. 3; the `n=4, p=1, q=2` case is Somos-4) and Example 3.3 (l.538, p. 10).
- §2.6: BCDX Definition 2.3 (l.174, the fixed `h` with `h'=h`), Theorem 3.1 (l.222), Lemma 4.1 (l.781), Propositions 4.2, 4.6 and 4.7 (l.812, 938, 945) and Theorem 4.9 (l.1143). NR §3 and Definition 3.1 (l.238, 247, reversed `Z`). Rupel Theorem 5.1 (l.1641, PDF p. 29, which is journal p. 1266, with the proof continuing onto p. 1267).
- §2.7: FWZ Proposition 6.4.1 (l.431, for a normal Noetherian ℂ-algebra) and Remark 6.4.4 (l.495). Stacks Lemma 31.5.11 (0E9I) (divisors l.335).
- §3.3 and §3.5: GHK (2.3), (2.5)–(2.8) (l.545–593). These match §3.3's `μ_k* z^n=z^n(1+z^{e_k})^{−d_k{n,e_k}}` and §3.1's signed mutation. GHKK Remark B.8 (l.4644, p. 116) permits dependent and nonspanning families. FG §§1.2.5–1.2.6 (l.449, 459).
- §5.1–§5.3: GHKK Theorem 1.24 (l.1102, which assumes Injectivity, as §5.1 uses it only on the principal lift), Theorem 1.28 (l.1150), Construction 1.30 (l.1230), Lemma 2.10 (l.1390), Theorem 2.13 (l.1438), Proposition 3.6 (l.1549), Proposition 4.3 (l.1733), Theorem 4.4 (l.1784), Theorems 4.9 and 4.10 (l.1873, 1893), Construction 5.1 (l.1944), Lemma 5.2 (l.1976), Corollary 5.3 (l.1990), Corollary 5.5 (l.2036), Proposition 5.7 (l.2125), Corollary 5.9 (l.2152), Theorem 5.11 (l.2197), Construction B.9 (l.4671), Remark B.10 (l.4695) and Proposition B.11 (l.4716). The References page ranges for §§1.3, 4, 5 and Appendices A–B are right.
- §6.1: FZ, *Double Bruhat cells*, Definition 1.4 (l.269), Definition 1.5 (l.288), Theorem 1.16 with its transposed companions (l.465, p. 9) and Theorem 1.17 (l.481, p. 10). FZ cite Berenstein–Zelevinsky's Corollary 6.6 and (4.8)–(4.11) for the A₂/B₂ and G₂ identities (l.461–463, with [4] at l.2657).
- §6.2 and §6.3: BFZ III exchangeable indices (l.458–460), Definition 2.3 (l.479), Remark 2.4 (l.490), (2.9)–(2.11) (l.629–638), Theorem 2.10 (l.668, p. 15; base-changed upper bound), Lemmas 2.12–2.13 (l.714, 759) and Corollary 1.9 (l.232).
- FZ II: Theorem 1.4 (l.239), Theorem 1.8 (l.274; (ii)⇔(iii) is condition 1⇔3) and the convention `s_i(α_j)=α_j−a_ijα_i` (l.289).

**Adversarial table** (values computed: rational-arithmetic script on random points and words, or by hand where marked).

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `upperBound_seedMutationWord` | `B=0`, rank 2, `x=3, y=5` (`hrank` fails) | `2/(xy)=2/15` lies in `L(x,y)`, `L(x',y)` (`=x'/y`) and `L(x,y')` | in `L(x',y')`: `x'y'/2`, coefficient ½ | not invariant without `hrank`: hypothesis needed |
| same | `K` empty, `w=[]` | `laurentSubalgebra ℤ c.coordinate ⊓ ⊤` | same | equal |
| `exists_laurentExpansion` | `B̃=(0,1)ᵀ`; `A₂` word `[1,2]` | `(1+z)/x`; `(1+x₁+x₂)/(x₁x₂)` | `X^{−e₁}+X^{−e₁+e_z}` (frozen exponents 0, 1); three monomials | exponents ≥ 0 |
| `somos4_exists_pos_nat`, §2.4 | `clusterMutation` on the §2.4 matrix, 12 steps | `1,1,1,1,2,3,7,23,59,314,1529,8209,83313,620297,7869898,126742987` | recurrence values | agree; cyclic shift 12/12; column `(0,1,−2,1)` 12/12 |
| `upperBound_le_of_starfish` | `R=𝕜[x,y]`, `z=xy−1`, `x'=y` | no height-one prime contains both `x` and `y` | `UB ⊆ 𝕜[x,y]` | holds |
| same | `R=𝕜[x]`, `x'=x²` (`hcover` fails) | `(x)` contains both | `UB=𝕜[x^{±2}]∋x⁻²∉R` | hypothesis needed |
| same | `K` empty; `R` a field | `UB` = image of `C`; no height-one primes | `≤` range; range `=⊤` | holds |
| `finite_clusterVariables_iff` | BFS on generic rational points: `A₁×A₁, A₂, B₂, G₂, A₃` | 4, 5, 6, 8, 9 variables | `n+|Φ₊|`: `2+2, 2+3, 2+4, 2+6, 3+6` | agree |
| same | `((0,2),(−2,0))` | 26 values after 12 levels, +2 per level | companion `((2,−2),(−2,2))`, det 0 | both sides false |
| same | `K` empty | `∅` finite | `IsFiniteType` of 0×0: `Finite`, PosDef vacuous | both true |
| `exists_isFiniteType_iff_forall_le_three` | `((0,1),(−3,0))` | `|b₁₂b₂₁|=3` | `d=(3,1)`: `((6,−3),(−3,2))`, det 3 > 0 | agree (`G₂`) |
| `exists_nonneg_laurentExpansion` | `A₂` `[1,2]`; principal rank one | coefficients 1, 1, 1; `x⁻¹+u x⁻¹` | ≥ 0 | holds |
| `cVector_signCoherent`, §5.3 | 11,467 steps on random words over `B₂ (2,1)`, `G₂ (3,1)`, Kronecker, `0`, 3-cycle, a rank-3 matrix with `s=(2,1,1)` and `((0,3),(−3,0))` | columns of `C_t`; `G_tᵀD_sC_t`; `G_tB_t` | sign-coherent; `D_s`; `B₀C_t` | 0 failures |
| §5.3 Check | `B=((0,1),(−2,0))`, `μ₁` | `C'=((−1,1),(0,1))`, `G'=((−1,0),(2,1))` | `G'ᵀdiag(2,1)C'=diag(2,1)` | agree (by hand) |
| §0.4 Check | `Λ(e₁,e₂)=1`, `a=−e₁+2e₂` | `X₁⁻¹X₂²=u^{Λ(−e₁,2e₂)}X^a=u⁻²X^a` | `u^{−a₁a₂Λ₁₂}=u²` | `X^a=u²X₁⁻¹X₂²` |
| §0.5 | `y=Ex⁻¹`, `r=2` | `y²=Eσ⁻¹(E)x⁻²` | `P₂=P₁σ⁻¹(E)` | agree (by hand) |
| §0.7 | 200 random rational `(x,z)` | `(1+x*)/z`, `(1+x*+x*²)/z` | `x*z*−1`, `x*²z*−x*−z−2` | 0 failures; values 3 and 7 at `x=z=1` |
| §1.5 | principal rank one, `Λ=((0,−1),(1,0))`; arbitrary `w` | `Σ_i b_{i1}Λ_{i1}=1`; `w_i[−εb_ik]_+` | `w₁=1`; `w_k[εb_ki]_+` | agree (BZ (3.6) needs only opposite signs) |
| §1.6 Check | `Y₁=t` versus `Y₁=1` in `Z_v[t]` | `{t^a}` independent | `{1}` repeated | faithful versus not |
| §2.1 Q1 | `Λ=((0,−1),(1,0))`, `B̃=(0,1)ᵀ`, `H=1+T` | `ν₁=Λ(e₂,e₁)=1`; `(X'₁)²` | `(1+vX₂)(1+v³X₂)X₁⁻²`; `r₁ν₁=w₁=1` | agree (by hand) |
| §2.3 Check | `P=Multiplicative ℚ`, `y=(w^{1/2},w^{−1/3})` | `y₂⊕1=w^{−1/3}` | `x'₂=(1+w^{1/3})/x₂` | agree |
| §2.5 Check | `𝔽₇`, `u=2` | `(1+2T)(1+T)(1+4T)=1+7T+7T²+T³` | `1+T³` | agree; `deg'(e₁)=−1` |
| §2.6 Check | generic torus, `μ₁`, `ε=+` | `Λ'=EᵀΛE=((0,−1),(1,0))`; `M'(2,−1)=v⁻²x*²y⁻¹`, `M'(1,−1)=v⁻¹x*y⁻¹` | `y**=(1+v⁻¹x*+v⁻²x*²)y⁻¹` | agree (by hand) |
| §2.6 Checks at `u=1` | 100 random points | reversal `1+2T²+T³`; fixed `H`; word `[1,2,1]` with `H₂=1+2T` | `x''=x`; `x(y³+2y+1)/(y³+2y²+1)`; `1/y+x(y+2)/(y(y+1))` | 0 failures |
| §3.4 Check | `B=((0,1),(−2,0))`, `d=(1,2)` | `p₁*(e₁)=−2f₂`; `T₁(f₁)=−f'₁`, `T₁(−f₁)=f'₁−2f'₂` | coordinate formula `m'=(−1,0)` and `(1,−2)` | agree (by hand) |
| §3.4 `λ` | `r(n)=(p₁*(n),n)` | `⟨n,m⟩−{n,a}−{a,n}` | `⟨n,m⟩`; `λ(r(n),r(n'))={n',n}=β(n,n')` | agree (by hand) |
| §3.5 Check | `(0,1)ᵀ` | GHK (2.8) `A₁A'₁=z+1` | `x↦(1+z)/x` | agree |
| §5 Examples | `B=((0,1),(−1,0))`, principal, word `1,2,1,2`, 3 random points | cluster; `g`-columns | `((1+u₂x₁)/x₂, x₁)`; `(0,−1)=−f₂`, `(1,0)=f₁` | agree |
| §5.2 Check | `A₂`, `μ₁` then `μ₂` | `(1+(1+x₂)/x₁)/x₂` | `(1+x₁+x₂)/(x₁x₂)` | agree |
| §6.1 | `SL₂`, `G^{s,s}`; big-cell Gauss decomposition | `dim = 1+1+1`; `[x]₀=diag(a,1/a)` | FZ Theorem 1.1: `r+ℓ(u)+ℓ(v)=3`; `Δ_{ω,ω}=a` | agree (by hand) |
| §6.2 Check | `i=(−1,1)` in `SL₂` | rows `{−1,1,2}`, exchangeable `{1}`; `Δ(−1)=b, Δ(1)=d, Δ(2)=c` | `n=2−1=1`; `d·a=1+bc` | agree (by hand) |
| §6.3 Check | `SL₂`, `(s,s)` | complement of `D(a)∪D(d)`: `a=d=0`, `bc=−1`, dimension 1 | cell dimension 3 | codimension 2 |

## Not verifiable

- Berenstein–Zelevinsky, *Total positivity in Schubert varieties* (Comment. Math. Helv. 1997), cited in §6.1 for (4.8)–(4.11) and Corollary 6.6. The sources service resolves it only to a paywalled DOI, and the README's `ems.press` link is on a host outside the service's licence classes. I checked the locators only indirectly: FZ, *Double Bruhat cells*, l.461–463, cites "[4, Corollary 6.6]" and "[4, (4.8)–(4.11)]" for exactly these identities.
- NZ, GLS and FZ I support targets outside this round's sample. I did not re-read them; the previous review read NZ.

## Source issues

- none
