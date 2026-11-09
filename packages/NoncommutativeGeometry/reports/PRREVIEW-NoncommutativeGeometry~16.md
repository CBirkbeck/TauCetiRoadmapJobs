# Review of NoncommutativeGeometry (pull request #1143 at f1b5581)

**Verdict:** needs changes

This is an incremental re-review of the 20 README lines that changed since f0b4904: the Scope paragraph on `A_θ` (lines 55–61) and the OperatorKTheory bullet under Downstream consumers (1494–1500). `Suggested.lean` and every file outside the folder are unchanged.

The repair settles the twisted-group part of r15 R01. N6 now builds no twisted group C*-algebra. It hands the identification `A_θ ≅ C*(ℤ²,c)` to OperatorKTheory 7.5, which claims it at its head, and HeisenbergImprimitivity and OperatorAlgebraDynamics attribute it the same way. The mathematics of the new passage is correct (see the table).

Three findings remain, all from r15:
- R01: OperatorKTheory 7.4 still defines `A_θ` and its trace itself, so the object has two owners at the open heads.
- R02: SmoothBanachRepresentations still builds the real tensor.
- R03: the description is unchanged.

None of them asks for another README edit; all three are repaired in the description and in the two counterpart pull requests.

## R01 (P2) — `A_θ`, its presentation and its trace still have two owners: N6 and OperatorKTheory 7.4

**Location.** `TauCetiRoadmap/NoncommutativeGeometry/README.md`:
- 50–55: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … its universal presentation … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes."
- 1494–1496: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** OperatorKTheory 7.4 takes `A_θ`, its universal presentation, the injectivity of the coordinate copy of C(𝕋) and τ from N6.

**Witness.** OperatorKTheory #866 at 1377338a, which has not moved since r15:
- 1783–1784: "Define the canonical trace `τ=HaarIntegral∘E`".
- 1796: "A_θ has the universal unitary presentation … including injectivity of the coordinate copy".
- 2326: NoncommutativeGeometry consumes "K7's rotation algebras".

So each roadmap says the other one consumes its `A_θ`.

**What the repair settled.** The 7.5 identification now has one owner:
- OperatorKTheory 1868–1872: "This roadmap exports this identification".
- HeisenbergImprimitivity #1149, line 827.
- OperatorAlgebraDynamics #1137 at a08e7b27, 3630–3640.

**Repair.** The README needs no further edit. In the description:
- State that #1143 merges before #866. This roadmap is on main, and OperatorKTheory is position 9 of the merge order, so only #866 can cite the other.
- State that #866 then:
  - replaces 1782–1784 (the definitions of `A_θ` and τ) and the bullet at 1796–1798 by a citation of NoncommutativeGeometry N6;
  - has 7.5 use N6's universal presentation for the identification;
  - rewrites Downstream 2324–2326, since this roadmap takes no C*-algebraic K-theory from OperatorKTheory (README 41).

**Test.** After the repair, these return nothing:
- `roadmaps grep --fixed 'τ=HaarIntegral∘E'` (today #866:1784);
- `roadmaps grep --fixed "K7's rotation algebras"` (today #866:2326).

`roadmaps grep -i 'universal unitary presentation'` should then find only N6 (today it finds #866:1796).

## R02 (P2) — The real completed locally convex projective tensor still has two owners

**Location.** `TauCetiRoadmap/NoncommutativeGeometry/README.md`:
- 351–353: "Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`); every statement of this section is made for both fields."
- 1476–1478: "SmoothBanachRepresentations §7.3 consumes N1.Tensor's completed locally convex projective tensor at both fields …, its §7.2a owns only the two scalar-comparison maps".

**Claim.** N1.Tensor is the only place where the real case is built, and SmoothBanachRepresentations consumes it.

**Witness.** SmoothBanachRepresentations #1145 at 7cde28a0, which has not moved since r15:
- 9: "§7.2a owns the same construction for real spaces … assumes nothing of N1 beyond its complex construction".
- 76: "N1 is consumed for complex factors only".
- 460: "Build the same object here for real Hausdorff locally convex spaces".

**Repair.** The README needs no edit. In the description, state that #1145 rebases after this pull request. At its head:
- lines 9 and 74–76 then cite N1.Tensor for both fields;
- §7.2a (458–468) keeps only the two scalar-comparison maps and the balancing quotient;
- lines 481–483 and 507 consume N1.Tensor at 𝕜=ℝ.

**Test.** `roadmaps grep 'Build the same object here for real'` then returns nothing. Today it returns #1145:460.

## R03 (P3) — The description describes an earlier head and states no order

**Location.** The pull-request description, which is unchanged.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- that N2 "retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- that "[Smooth Banach #1145] consumes N1.Tensor in SB7";
- "which merge first: #864".

**Witness.**
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 145 +-`.
- README 922–923 write `x⊠_u y` and `x⊠_s y`.
- N2's *Needs:* (748) names no AlgebraicKTheory.
- #1145:76 consumes N1 for complex factors only.
- #864 is not in the open index.

**Repair.** Rewrite the description to match this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6 and §2.1.
- `Suggested.lean` states only `bijective_matrixExtension`.
- The two Clifford reductions are `x⊠_u y` and `x⊠_s y`.
- N6 owns `A_θ`, and OperatorKTheory 7.5 owns its identification with `C*(ℤ²,c)`.
- Add the ordering paragraphs of R01 (#866 after) and R02 (#1145 after).
- State that #1187's copy of this `Suggested.lean` (`overlaps.md`) is superseded and that #1187 rebases after this pull request.
- Drop the #864 line and the build report for 84190a1e.

## Previous findings

- R01 — partly repaired: Scope 55–61 now reads "N6 builds no twisted group C*-algebra: the identification … is OperatorKTheory 7.5's", which settles the twisted-group part. OperatorKTheory 7.4 (#866:1783–1796) still defines `A_θ` and τ itself. Carried as R01.
- R02 — not repaired: README 351–353 and 1476–1478 are unchanged. #1145 is still at 7cde28a0, and lines 9, 76 and 460 still build the real tensor. Carried as R02.
- R03 — not repaired: the description still says "Only the NCG README changes; Suggested.lean … unchanged" and "which merge first: #864". Carried as R03.

There is no repair report for r15, so no finding is re-raised against a "not actionable" reason.

## Verified sound

**Gate, dependency check and elaboration at f1b5581.**
- `gate … --base origin/main`: every scanner reports 0, then `OK`.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0. Its only warning is `declaration uses sorry` at 62:8, and the file is byte-identical to r15's head.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- No gaps are declared.

**Changed passages.**
- **The library name.** `TauCeti.SmoothNoncommutativeTorus.twist` is at the pinned Tau Ceti 2fd255d9, in `NoncommutativeGeometry/SmoothTorus/Basic.lean`:
  - `def twist` (180) is circle-valued, and `twist_apply` (185) gives `twist θ y z = 𝐞(θ·y₂z₁)`. At y=(m,n), z=(m′,n′) this is the README's `exp(2πiθnm′)`.
  - `twist_zero_left` and `twist_zero_right` (189, 193) give normalisation, and `twist_mul_twist_add` (197) the cocycle law.
- **OperatorKTheory 7.5 at #866 1377338a** (heading 1828):
  - It identifies `A_θ` with `C*(ℤ²,c)` using `W_(m,n)=v^m u^n` and the same c (1868–1872), with "U₁, U₂ in the roles of v, u". This is N6's `U₁=v`, `U₂=u` (1204).
  - 7.4 (heading 1773) owns PV, the Powers–Rieffel generator and the trace range `ℤ+θℤ` (1799–1814), as the Downstream bullet says.
- **OperatorAlgebraDynamics #1137**, moved from 8daff1a8 to a08e7b27:
  - Scope 75–81 is unchanged in substance.
  - Downstream 3630–3640 has K7.5 consume `C*(L,c)` from D1/D2.CentralTwists.
  - 3660 lists NoncommutativeGeometry as citing D1–D2 for crossed products, which matches N6's *Needs:* (1337).
  - It claims nothing of the crossed-product `A_θ`.
- **HeisenbergImprimitivity #1149**, line 827, gives the identification of `C(𝕋)⋊ℤ` with `C*(ℤ²,c)`, for `c=e(θnm′)`, to OperatorKTheory.
- **CompactQuantumMetricSpaces #1155** (`Suggested.lean` 27) names "the rotation C*-algebra `A_θ`" with no owner conflict.
- **Ownership by object.** `roadmaps grep -i 'A_θ *= *C\(𝕋\)⋊|rotation C\*-algebra|C\*\(ℤ², *c\)'` finds only #866, #1143, #1149, #1155 and main's copy of this roadmap. The only conflict is R01.

**Remark on untouched text.** The Tau Ceti contract for the smooth torus (303–308) does not list `twist`. Scope now names it only to describe a phase owned elsewhere, so this is a note, not a finding.

**Sources.** The diff adds no locator and touches no reference, so none of the seeded sample falls in the changed passages. r15 verified 15 of the 39 locators (seed 1143015), and those lines are byte-identical at this head; its connes94 IV.1 Definition 3 erratum stands.

**Adversarial table.** The rows for the changed passages were computed this round in pure Python (seed 1143016). The other rows are carried from r15, and their line numbers are shifted by +6 (by +8 after 1492).

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Scope 57–58: `c((m,n),(m′,n′))=exp(2πiθnm′)` is a normalised circle-valued 2-cocycle (new) | 2000 random θ∈[−3,3] and x, y, z∈[−5,5]²; x=0 or y=0 | `c(x,y)c(x+y,z)` against `c(x,y+z)c(y,z)`: max error 1.7·10⁻¹³; the exponent `x₂y₁+(x₂+y₂)z₁=x₂(y₁+z₁)+y₂z₁`; `c(0,y)=c(x,0)=e(0)=1`; `|c|=1` | true | none |
| Scope 56–60: the factor set gives N6's relation and order (new) | θ=0.3, ½, 0, 1; reversed factor set `exp(2πiθmn′)` | θ=0.3: `c((0,1),(1,0))=−0.309017+0.951057i=e(0.3)`, `c((1,0),(0,1))=1`, so `W_(0,1)W_(1,0)=e(θ)W_(1,0)W_(0,1)`, which is `U₂U₁=e(θ)U₁U₂`. The reversed set gives `−0.309017−0.951057i=e(−0.3)`, which is the parameter −θ and is excluded. θ=½ gives −1 for both sets, so it does not separate them; θ=0 and θ=1 give c≡1, so `C*(ℤ²)=C(𝕋²)=A_0=A_1` | true | none |
| Scope 60: `U₁^mU₂^n↦W_(m,n)` is a *-map (new) | product; star at θ=0.37, (m,n)=(2,−3) | product: both sides carry `e(θnm′)` (N6 Check 1273–1276, `W_xW_y=c(x,y)W_(x+y)`). Star: `(U₁^mU₂^n)*=U₂^(−n)U₁^(−m)=e(θnm)U₁^(−m)U₂^(−n)`; `W_x*=conj(c(−x,x))W_(−x)`; both 0.187381−0.982287i. `c(x,−x)=c(−x,x)`: both 0.187381+0.982287i | true | none |
| Scope 55–61 and Downstream 1494–1500: owners (new) | #866 1377338a, #1137 a08e7b27, #1149 | 7.5 owner: #866 1868–1872, #1149 827 and #1137 3630–3640 all agree. `A_θ` and τ: N6 1201–1212 and also #866 1783–1784, 1796 | two owners | R01 |
| `bijective_matrixExtension` (Lean 62; README 528–553) | r15 | ι=∅ gives HC⁰=0≠ℚ, so `[Nonempty ι]` is needed. M₂(ℚ): HC=1,0,1,0, as for ℚ. The probe fails | true, not padding | none |
| Ground ring (239–242) | r15 | `HC^(2k)=M⧸M[2]`, `HC^odd=0`, `HC⁰=M` | true | none |
| N1.Tensor cross property (369–375) | r15, ℓ¹ | representation cost 3 against value 1; `p(x)q(y)≤Σp(x_i)q(y_i)` | true | none |
| N1.Tensor field check (404–411) | r15 | −i and i on equal complex tensors; real dimension of ℂ⊗_ℝℂ is 4 | true | none |
| N1.Tensor over ℝ (351–353) | #1145:460 | both build it | two owners | R02 |
| Exterior product (553–556) | r15 | coefficient on dx∧dy is `+(2πi)⁻²`, and `−(2πi)⁻²` after the flip | true | none |
| S normalisation (566–575) | r15 | `S^mτ(1,…,1)`=1,2,6,24,120; unsigned gives 3 | true | none |
| Coboundary and cyclic signs (576–588) | r15 | `(bTr)(e₁₂,e₂₁)=0`; `a↦a₁₁` gives 1 | true | none |
| Dual-bimodule currying (474–476) | r15 | `(a·(φ·b))(x)=φ(bxa)` | true | none |
| N2 circle (657–662) | r15 | `(1/((1+i)√π))²=1/(2πi)=−0.159155i` | true | none |
| N2 Bott (663–668, 724–735) | r15 | `Tr(p dp∧dp)`: 0.5i, 0.12626i, 2i; integral 0.500004 | true | none |
| N2 Chern-chain constants (684–706) | r15 | `2^(−(2k+1))Γ(k+3/2)⁻¹`; `1/m!` | true | none |
| N2 smooth paths (670–679) | r15 | `ee′e=0`, `[[e′,e],e]=e′` | true | none |
| N3 Hardy (883–888) | r15 | `τ₁=2`, pairing −1 = ind(PuP) | true | none |
| N3 Clifford (920–947) | r15 | `Tr₂(σ₃[D,a][D,b])=0.94+0.93i=2i(A₁B₂−A₂B₁)` | true | none |
| N3/N7 sign of `⟨q*β,[D]⟩` | r15 | `c₁=−1`; index +1 | true | none |
| N3 doubling (766–773) | r15 | `{Γ,F′}=0`, `F′²=1` | true | none |
| N3 quasi-ideals (789–795) | r15 | 9>5; 3=1+2 | true | none |
| N3 Checks (828–855) | r15 | μ(ST)=(2.9208,0.6847); `‖ST‖₁=4≤5`; ζ(11/10)=10.5844 | true | none |
| N3 dual cyclicity (815–818) | r15 | the S and T series converge and diverge as stated | true | none |
| N3 Tr′ (865–866) | r15 | `S*S−SS*=e₀e₀*`, trace 1 | true | none |
| N4 partial sums (996–1001) | r15 | 2.9581, 1.9967, 1.4997 against 3, 2, 1.5 | true | none |
| N4 block operator (1042–1048) | r15 | max `σ_N/log(1+N)`=2.4853 | true | none |
| N4 ω-dependence (1051–1063) | r15 | 0.743683 and 0.756317 | true | none |
| N4 non-normality (1022–1030) | r15 | ρ=0 against `Tr_ω=1` | true | none |
| N5 Checks (1124–1148) | r15 | moduli squared (1,½,½); 1/√2 | true | none |
| N5 Hochschild class (1164–1173) | r15 | `S_(1,∞)⊂L^(1,∞)`, n≥2 | true | none |
| N6 multiplier, trace and non-trace (1273–1283) | r15 | −1 = −1 at θ=½; `ab=−U₂`, `ba=U₂` | true | none |
| N6 projection replacement (1237–1245, 1296–1302) | r15 | `ses⁻¹=p`, `ss′=1` | true | none |
| N6 seminorms and cohomology (1226–1233, 1304–1324) | r15 | dimensions 1, 2, 1; HP≅ℂ² | true | none |
| N7 (1341–1460) | r15 | multiplicities 2, 8, 8, 16, 24; curvature `2πi/θ`; index +1 | true | none |

## Not verifiable

- Elaboration at #1187's Tau Ceti pin (ab00ba392): that pin is not checked out in this worktree. Only the order is asked for, in R03.

## Source issues

- none
