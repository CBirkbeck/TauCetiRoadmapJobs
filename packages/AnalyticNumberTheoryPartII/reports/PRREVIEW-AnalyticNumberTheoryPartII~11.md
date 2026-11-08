# Review of AnalyticNumberTheoryPartII (pull request #1167 at 0717d3f)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 42 lines changed in `TauCetiRoadmap/AnalyticNumberTheoryPartII/` since 26d0e1f.

- This head repairs R03 and R04 and introduces no new defect.
- R01 and R02 are not repaired. Their repairs lie in #856, #851 and #1409, and in this pull request's description, not in this folder.

## R01 (P2) — §§5.3g, 5.3h and 5.3j still have two other owners, and the consumer bullets describe citations that do not exist

**Location.**
- `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:7`: "so a later roadmap that uses any of these objects cites these sections rather than constructing them again".
- `README.md:3107–3108`: "GeometryOfNumbersAndQuadraticArithmetic §3.3 … takes from §§5.3g–5.3h …" and "ArithmeticGaloisRepresentations §2.7 (global inputs) takes … the self-duality of `𝔸_F` and `F^⊥=F` (`adeleRing_selfDual`) …".

**Claim.** This carries r10 R01, which r9 first raised. It is not repaired.
- #856 and #851 have moved to new heads. Both still construct these objects themselves, and neither cites this roadmap.
- This round's rewritten ArithmeticGaloisRepresentations bullet (`:3108`) now names `adeleRing_selfDual`. ArithmeticGaloisRepresentations §2.7 proves that statement independently, at README `:2291–2303`.
- The pull-request description is unchanged:
  - "Dependencies" still lists 31 pull requests. These include the consumers #856, #851, #792, #924 and #925, which come later in the merge order (ORDER.txt lines 57, 52, 51, 93, 95; this roadmap is at line 50).
  - The merge-order paragraph names only #1126.
- The duplication spreads further. AutomorphicFormsOnReductiveGroups §4.3 (#1037, ORDER.txt line 59, README `:661–663`) takes the self-annihilator and the restricted-product duality from ArithmeticGaloisRepresentations §2.7.

**Witness.**
- #856 at 27e9e34, `ArithmeticGaloisRepresentations/README.md:2298`: "Prove the diagonal self-annihilator formula". `:2310`: "Construct the Schwartz–Bruhat space on the adeles".
- #851 at 5180edf, `GeometryOfNumbersAndQuadraticArithmetic/README.md:1093`: "Construct `adelicSchwartzBruhat V`".
- `grep -c AnalyticNumberTheoryPartII` returns 0 on both.

**Repair.** This is r10's repair, updated to the new heads.
1. In ArithmeticGaloisRepresentations §2.7, "Global inputs" (#856, `README.md:2282–2317`), replace these constructions by citations of §§5.3g, 5.3h (including `adeleRing_selfDual`) and 5.3j:
   - the trace character (`:2284–2289`);
   - the local and restricted-product dualities (`:2289–2296`);
   - `F⊥=F` (`:2298–2303`);
   - the adelic Schwartz–Bruhat space, the transform and Poisson summation (`:2310–2312`);
   - Tate's measures (`:2315–2317`).

   Keep its standard-test-function evaluations and root-number product formula.
2. In GeometryOfNumbersAndQuadraticArithmetic §3.3 (#851, `README.md:1093`), cite §§5.3g–5.3h for `adelicSchwartzBruhat V`, the character, the self-dual measures and the transform. Keep the Weil operators.
3. In this pull request's description:
   - reduce "Dependencies" to #1126;
   - name #851 and #856 in the merge-order paragraph as pull requests that merge after this one.

Tested on the consumers that already made this change:
- AutomorphicLFunctionsAndLocalFactors (#924 at 330bb72). `README.md:11` says §§5.3g and 5.3h own the trace character, and `:19` cites §5.3g for AL.0.2.
- AdelicAlgebraicGroups (#792 at 734ad39) cites §5.3f at `README.md:844`, `:877`, `:903`, `:928` and `:943`.

After step 1, #1037 §4.3 reaches §5.3h through ArithmeticGaloisRepresentations with no edit of its own. Its `addChar_equiv` (characters of `F\𝔸_F` correspond to `F`) is §5.3h's second bullet (`:676`), so it may also cite §5.3h directly.

## R02 (P2) — ClassicalArithmeticCompletion's open revision still builds §5.3g, including the character classification

**Location.**
- `README.md:658`: "every nontrivial character of `F_v` is `x↦ψ_v(ax)` for exactly one `a∈F_v^×`".
- `README.md:7`: the single-owner sentence.

**Claim.** This carries r10 R02. It is not repaired.
- #1409 is still at d8a53de, the head r10 read.
- Its §7.12a constructs all of the following, which is §5.3g:
  - the standard trace character and its conductor;
  - the local self-dual measures;
  - the local Schwartz–Bruhat spaces;
  - Fourier inversion;
  - the classification of the characters of a local field as `ψ(b·)`.
- §7.12a does not cite this roadmap.
- Main's ClassicalArithmeticCompletion takes these objects from AutomorphicLFunctionsAndLocalFactors AL.0–AL.1. AL.0.2 in turn cites §5.3g (#924 at 330bb72, `README.md:19`). The revision drops that routing, so the object has two owners at #1409's head.

**Witness.**
- #1409 at d8a53de, `ClassicalArithmeticCompletion/README.md:14067`: "Identify every continuous additive character of a local field as x↦ψ(bx), for a unique b".
- Main, `README.md:19`: "AutomorphicLFunctionsAndLocalFactors AL.0–AL.1 supplies the standard trace characters, self-dual measures".
- `grep -c AnalyticNumberTheoryPartII` returns 0.

**Repair.**
1. In #1409's §7.12a (`README.md:14067`), replace the first paragraph's constructions by a citation. Cite either §5.3g directly, or main's AL.0–AL.1 routing, which leads to §5.3g. Keep the ε-factors and the local functional equation.
2. If it cites §5.3g directly, add a ClassicalArithmeticCompletion §7.12a bullet under this README's Downstream consumers. That roadmap is on main, so also reword "each later in the merge order" (`:3103`).

Tested: no conversion factor is needed.
- §7.12a's `vol(O_v)=q_v^(−d_v/2)` is §5.3g's `N(𝔇_v)^(−1/2)`.
- Its `ψ(2x)` Check gives `ℤ₂` the volume `2^(−1/2)`, as in §5.3h's Check 3 (`:688`).

## Previous findings

- R01 — not repaired: `README.md:3108` now names `adeleRing_selfDual`. But #856 (27e9e34) and #851 (5180edf) still construct these objects and cite nothing here, and the description still lists 31 dependencies. This is R01 again.
- R02 — not repaired: #1409 is still at d8a53de. Its §7.12a still constructs §5.3g's character, measures and classification without citing this roadmap. This is R02 again.
- R03 — repaired: `Suggested.lean:290` adds `adeleRing_selfDual` with existence of a nontrivial character trivial on `K`. `README.md:677` names it as the case `V=F`. The docstring (`:30–37`) now says only the adelic Schwartz–Bruhat carrier is missing.
- R04 — repaired: `README.md:682` now reads "it contains `F` because `ψ` is trivial on `F`". The preceding sentence derives this from `ψ=ψ_ℚ∘Tr` and `x−Σ_p{x}_p∈ℤ` for `x∈ℚ`.

## Verified sound

**Gate, dependency check and build.**
- My gate rerun on 0717d3f prints `gate AnalyticNumberTheoryPartII: set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 … source-material=0 OK`.
- The worker's gate adds `build=0` for `lake build TauCetiRoadmap.AnalyticNumberTheoryPartII.Suggested`.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- This roadmap is at ORDER.txt line 50.
- `changes.md` lists no file changed outside the folder.

**Elaboration.**
- I ran a scratch copy of `Suggested.lean`, with `#check @name` for all 31 declarations, through `lake env lean`. It exits 0 in 6.1 s and prints 14 `declaration uses sorry` warnings, one more than r10, and the 31 types. It prints nothing else.
- `adeleRing_selfDual` sits in a section with no `variable` block, so it can lose no binder. Its elaborated type matches `README.md:677`:
  - existence of `ψ ≠ 1` trivial on `K`;
  - for every such `ψ`, a homeomorphism `e` with `e y (ofAdd x) = ψ(ofAdd (x*y))`;
  - the annihilator `{y : ∀ξ∈K, ψ(ξy)=1}` equal to `Set.range (algebraMap K 𝔸_K)`.
- No other type changed. The rest of the Lean diff is the module docstring.
- One-tactic probe on `adeleRing_selfDual`, in a scratch file: `simp`, `rfl`, `infer_instance`, `aesop`, `decide`, `norm_num` and `trivial` all fail (7 of 7). It is not padding.

**Library at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).
- Mathlib:
  - `NumberField.AdeleRing` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:56`, deriving `TopologicalSpace`) is `InfiniteAdeleRing K × FiniteAdeleRing R K`.
  - `FiniteAdeleRing` carries the restricted-product topology (`Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:101`).
  - `InfiniteAdeleRing` is the product of the completions (`Mathlib/NumberTheory/NumberField/InfiniteAdeleRing.lean:54`).
  - `PontryaginDual A := A →ₜ* Circle` carries the compact-open topology (`Mathlib/Topology/Algebra/PontryaginDual.lean:40`).

  So the Lean statement asserts the self-duality for the correct topologies.
- Tau Ceti:
  - `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean:67`);
  - `TauCeti.GlobalNumberFields.compactSpace_quotient_principalSubgroup` (`…/Adeles/CompactQuotient.lean:129`);
  - `AdeleRing.instLocallyCompactSpace` (`…/Adeles/LocallyCompact.lean:41`).

  The first two are exactly the facts that the new Needs line (`:692`) takes from GlobalNumberFields Layer 5.
- A grep of both pins finds no Schwartz–Bruhat space, no standard adelic character and no adelic self-duality. The docstring's "absent at the pins" (`:34–37`) is correct.

**Cross-roadmap citations resolved.**
- GlobalNumberFields Layer 4 and Layer 5 (`Completed/GlobalNumberFields/README.md:418–437` on main). Layer 5 says that `K` is discrete in the full adeles and that `𝔸_K/K` is compact. The open revision (#1339) has the same Layer 5 text at `:662–670`, so the citation survives that revision.
- At #856 (27e9e34), ArithmeticGaloisRepresentations §2.7 spans README `:2227–2516`, with "Global inputs" at `:2282`. Its conventions match the `:3108` bullet:
  - `ψ_∞=e(x)` and `ψ_p=e(−{x}_p)`;
  - `vol(O_v)=q_v^(−ν_v/2)=N(𝔇_v)^(−1/2)`;
  - `d^×x=(1−q_v⁻¹)⁻¹dx_ψ/|x|_v`.
- At #851 (5180edf), GeometryOfNumbersAndQuadraticArithmetic §3.3 spans `:1031–1222`, and its Weil-operator paragraph is at `:1093`.
- The other consumers still cite this roadmap: #924 (`:11`, `:19`), #792 (§5.3f, five places) and #925 (§5.3n, `:50`).
- `roadmaps resolve` finds no missing citation or Lean name.

**Ownership.** I ran `roadmaps grep` over the 466 open heads and main, for `PontryaginDual` over the adeles, for adelic "self-dual" and for `F⊥=F`. The hits are #856 (R01), #1037 (through #856; see R01) and this pull request. No `TauCetiRoadmap` Lean file declares an adelic self-duality.
- `overlaps.md` lists no open pull request that changes this folder or drops an id it cites.
- This diff drops no id.

**Sample.** None of the 15 seeded targets lies in the changed lines. Their headings are at `:142`, `:164`, `:219`, `:360`, `:393`, `:1110`, `:1133`, `:1467`, `:1860`, `:2000`, `:2080`, `:2358`, `:2524`, `:2641` and `:2727`. The changed README lines are `:656`, `:677`, `:682`, `:690`, `:692` and `:3108`. None was rechecked this round. No README locator is flagged as unverified.

**Adversarial table.** 16 rows are computed this round for the changed statements, and 65 are carried from r10 for untouched statements.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.3h `:682`: `ψ(ξ)=ψ_ℚ(Tr ξ)`, and `x−Σ_p{x}_p∈ℤ` for `x∈ℚ` | `x=1/6`, `5/12`, `−7/30`, `3/4` | `{5/12}_2=3/4`, `{5/12}_3=2/3`; `x−Σ{x}_p=−1`, `−1`, `−2`, `0`; `ψ=1.0000` each | Holds | None |
| §5.3h `:682`: trace over the places above `w` | `ℚ(i)` with `ξ=1/3`; `ℚ(√2)` with `ξ=√2/4` | `Tr=2/3`: `e(2/3)` at `∞`, `ψ_3(2/3)=e(−2/3)` at the inert 3, product `1`; `Tr=0`: `e(0.3536)e(−0.3536)=1` | Holds | None |
| §5.3h Check 1, reversed sign (negative control) | `x=1/6` | `x+Σ{x}_p=4/3`, `e(4/3)=−0.5+0.866i≠1` | Discriminates | None |
| §5.3h `:682`: `F⊆F^⊥` from triviality | `F=ℚ`, `ξ,y∈ℚ` | `ψ(ξy)=1` by row 1; the product formula is not used | Holds | None (R04 repaired) |
| §5.3h `:682`: transfer to `ψ′=ψ(a·)`, `a∈F^×` | `a=2` over `ℚ` | `e_ψ′=e_ψ∘(2·)`, with inverse `(½·)`; `F^⊥` for `ψ′` is `{y:2y∈ℚ}=ℚ` | Holds | None |
| §5.3h `:682`: `a` lies in `F` and is nonzero | `ψ′` trivial on `ℚ` | `ψ(aξ)=1` for all `ξ∈ℚ` gives `a∈ℚ^⊥=ℚ`; `a=0` gives `ψ′=1` | Holds | None |
| §5.3h `:677`: a basis reduces general `V` to `V=F` | `V=ℚ²`, `B=xᵀMy`, `M=diag(1,2)` and alternating `M=[[0,1],[−1,0]]` | annihilator `M⁻¹ℚ²=ℚ²` in both cases (`M⁻¹=diag(1,½)`, `−M`) | Holds | None |
| §5.3h Check 5 (`:690`) | `ψ′(x)=e(x_∞)=ψ(ax)`, `a=(1;0,0,…)` | `ψ(ax)=e(x_∞)·∏_pψ_p(0)`; `ψ′(1/2)=−1.0000`; `y=(0,y_f)` maps to the trivial character | Holds; discriminates | None |
| `adeleRing_selfDual`: hypothesis "trivial on `K`" | `ψ′` of row 8 | `ψ′≠1`, and `e(0,y_f)=1` for `y_f≠0`, so `e` is not injective | Needed | None |
| `adeleRing_selfDual`: hypothesis `ψ≠1` | `ψ=1` | `e(y)=1` for all `y`, so not injective | Needed | None |
| `adeleRing_selfDual`: existence clause | standard `ψ` over `ℚ` | at `x=(1/2;0,0,…)`, `ψ(x)=e(1/2)=−1`, so `ψ≠1`; trivial on `ℚ` by row 1 | Holds | None |
| `adeleRing_selfDual` against README `:677` | elaborated type | homeomorphism, the formula `e y x=ψ(xy)` and annihilator `range(algebraMap)` on both sides; same generality (`V=F`, every nontrivial `ψ` trivial on `F`) | Match | None |
| `adeleRing_selfDual`: one-tactic probe | 7 tactics | 7 failures (unsolved goals, no instance, free variables) | Not padding | None |
| Docstring `:30–37` | grep of both pins | 0 hits for a Schwartz–Bruhat space or a standard adelic character; `adeleRing_selfDual` needs neither | Holds | None |
| Needs line `:692` | GlobalNumberFields on main and at #1339; Tau Ceti | Layer 5 text at `:429–437` / `:662–670`; `discreteTopology_principalSubgroup`, `compactSpace_quotient_principalSubgroup` | Resolves | None |
| Scope `:7` and consumer bullets `:3106–3108` | #856 27e9e34, #851 5180edf, #1409 d8a53de; #924 330bb72, #792 734ad39, #925 5efd146 | lines citing this roadmap: 0, 0, 0; 40, 57, 10 | **Fails** for three | R01, R02 |
| §5.3g: every nontrivial character of `F_v` is `ψ_v(a·)` | `ℝ`; `ℂ`; `ℚ_p` | `ℂ`: `exp(2πi(αRe z+βIm z))=ψ_v(az)`, `α=2Re a`, `β=−2Im a`; `a=0` gives the trivial character | Holds | Carried (r10) |
| §5.3g: `aB` has the same `τ` | definition | `(aB)(τx,y)=aB(y,x)` | Holds | Carried (r10) |
| §5.3g: `ψ_v(a·)` is the pairing `aB` | `F_v^n`, `A=aI` | `|det A|^(1/2)=|a|^(n/2)` | Holds | Carried (r10) |
| §5.3h: restricted-product duality | `𝔸_(ℚ,f)`, `H_p=ℤ_p` | `H_p^⊥=ℤ_p`; dual `Πʳ[ℚ_p,ℤ_p]` | Holds | Carried (r10) |
| §5.3h: trivial on almost all `H_i` | neighbourhood with no nontrivial subgroup | its preimage contains `∏_(i∉S)H_i`, whose image is 1 | Holds | Carried (r10) |
| §5.3h Check 4 (`a_p=1/p`) | `x=(1,1,…)` | `Σ_(p≤N)1/p` mod 1 is `0.0333`, `0.8028`, `0.1981`, `0.4831` | Holds | Carried (r10) |
| §5.3h: characters of `V_𝔸/V` | `V=F` | annihilator `K`; `y≠0` exactly for nontrivial characters | Holds | Carried (r10) |
| §5.3h: `ψ(a·)` keeps the self-dual measure | `a=2` | `√2·2^(−1/2)=1.0000` | Holds | Carried (r10) |
| §5.3h Check 3 | `ψ(2·)`; idele `(2,1,…)` | `c=√2`; `ℤ_2` mass `2^(−1/2)`; `e(1)·e(−1/2)=−1` | Holds | Carried (r10) |
| §5.3h Check 2 | `t=2` | `1.0000069747` on both sides; `0.5000035` (with `g^†`); `2.0000139` (without the factor) | Holds | Carried (r10) |
| §5.3h proof: `F^⊥/F=0` | `A=F^⊥` discrete | closed and discrete in a compact quotient, so finite; a finite `F`-space is 0 | Holds | Carried (r10) |
| GeometryOfNumbersAndQuadraticArithmetic bullet: polar pairing | `B_Q(x,y)=Q(x+y)−Q(x)−Q(y)` | symmetric, `τ=1`, `f̂̂(x)=f(−x)` | Holds | Carried (r10) |
| Summary | B2 chain `:98` | lists §5.3n and §5.21w | Holds | Carried (r10) |
| §4.12 (sample) | `c=1`, `1/2` | `H(0,1)=−1/2`; `H(0,1/2)=0`; `ζ_H(2,1/2)=4.934802=3ζ(2)` | Holds | Carried (r10) |
| §4.15 (sample) | `χ₄`, `s=2` | `0.9159656`, Catalan's constant | Holds | Carried (r10) |
| §5.7a (sample) | `ℚ(√−3)` | `κ=0.60460`; Stark's Lemma 8 threshold `4n!` | Holds | Carried (r10) |
| §5.10 (sample) | `q=2` | `0.375=6/16` | Holds | Carried (r10) |
| §5.19 (sample) | `s=1/4`, `1/2`, `1` | `det=−0.125`; `(3/2)(3/4)=9/8` | Holds | Carried (r10) |
| §5.21 (sample) | `k=ℚ` | `A=0.41123`; residues `0.54831`, `0.82247`; `B=−0.74460` | Matches LOWW | Carried (r10) |
| §6.4 (sample) | `{λ}` | `λ^(−s)`; convergence for `Re s>1` | Holds | Carried (r10) |
| §6.11 (sample) | one class of length `ℓ` | `Σ_kℓe^(−(s+k)ℓ)/(1−e^(−(s+k)ℓ))=Σ_mℓe^(−msℓ)/(1−e^(−mℓ))` | Holds | Carried (r10) |
| §6.20 (sample) | `λ=1/4`, `0.2`, `1` | `1/2`; `0.7236`, `0.2764`; `½±0.8660i` | Holds | Carried (r10) |
| §6.32 (sample) | `β=1` | `ε₂↦ε₂/2` | Holds | Carried (r10) |
| §6.41 (sample) | `β=1` | `δ_(γ,0)/n` | Holds | Carried (r10) |
| §6.49 (sample) | `β=2`, `4` | `0.7841`, `0.1521` | Holds | Carried (r10) |
| §5.3f: Fubini with `S⊇S₀` | `μ_2=2·Haar` | `μ_2(ℤ_2)=2` | Holds | Carried (r10) |
| §5.3f Checks 1 and 3 | `Ẑ`; `C_p=p^(−1)ℤ_p` | 1; 210 for `T={2,3,5,7}` | Holds | Carried (r10) |
| §5.3g: `f̂̂=f∘(−τ)` | `(ℤ/5)²` | error `7·10⁻¹⁶`; wrong laws give `0.84`, `1.22` | Holds | Carried (r10) |
| §5.3g: first-variable annihilator | `ℤ₃⁴` | double annihilator `ℤ₃⁴` | Holds | Carried (r10) |
| §5.3g Checks 1–3 | `ℝ²`; `p=3` | `1` against `3.487·10⁻⁶`; `c=3` | Holds | Carried (r10) |
| §5.3h: `g^*=(g^†)^(−1)` | `g=[[2,1],[1,1]]` | `g^*=[[2,4],[4,1]]` | Holds | Carried (r10) |
| §5.3h: restriction along `W`; scalar Poisson | `W=⟨e₄⟩`; `g=a` | `(f|_W)^`; `|a|^(−dim V)` | Holds | Carried (r10) |
| §5.3j | finite `v` | `d^×x(O_v^×)=N(𝔇_v)^(−1/2)` | Holds | Carried (r10) |
| §5.3m, `gl2_classNumber` | `ℚ`; `ℚ(√−5)` | 1; 2 | Holds | Carried (r10) |
| §5.21q | `FFΦ=Φ` | `Σ1/6` | Holds | Carried (r10) |
| `exists_unique_restrictedAddHaar` | elaborated type | `MeasurableSpace` and `BorelSpace` binders present | Holds | Carried (r10) |
| `exists_unique_quotientMeasure` | `ℤ≤ℝ` | Lebesgue measure, mass 1 | Holds | Carried (r10) |
| `quadratic_large_sieve` | `M=N=1` | `C≥1/2` | Consistent | Carried (r10) |
| `quadratic_fourth_moment` | `σ=1`, `1/2` | `(Q(1+|t|))^(1+ε)` | Consistent | Carried (r10) |
| `firstEisenstein_generate` | `a=1/2`, `1/4` | 0; `1+8u²` | Holds | Carried (r10) |
| `critical_scaling_measure_unique` | `δ₀` | `δ₀≠√2δ₀` | Holds | Carried (r10) |
| `supercritical_scaling_measures` | `ν=δ₁`, `β=2` | mass `0.6079` | Holds | Carried (r10) |
| §4.8 | `a=1/2`, `s=2` | `−0.8225` on both sides | Holds | Carried (r10) |
| §5.24 | LOWW 3.7(3) | `2√3=3.4641` | Holds | Carried (r10) |
| §6.6 / §6.12 | `{1/4}`; `g=2` | `(s−1/2)²`; `ζ(0)=−4/3` | Holds | Carried (r10) |
| §6.23 (sample) | `μ₂` | `φ(μ_nμ_n*)=n^(−β)` | Holds | Carried (r10) |
| §6.27 / §6.30 | `σ_(−i/2)`; `r=2` | `1/m`; `1/2` | Holds | Carried (r10) |
| §6.33 (sample) | `μ₂μ₂*` | `2^(−β)=1/2` iff `β=1` | Holds | Carried (r10) |
| §6.35 | doubling | `2≠1+e(1/2)` | Holds | Carried (r10) |
| §6.42b | swap | `(q/p)^β`; `(p/q)^β` | Holds | Carried (r10) |
| §6.29/§6.45, §6.43, §6.50, §6.31 | `x′₂`; Gibbs; `b=2`; `e_(2,1/3)` | `2^(1−β)=1` iff `β=1`; `→−1`; equal; `(e(1/3)+e(2/3)−11)/36` | Holds | Carried (r10) |
| §6.10 | `δ₀`; Haar | `2_*δ₀≠2^(0.5)δ₀`; `1/2` | Holds | Carried (r10) |
| §6.17g | `u→∞` | `C(4ζ′(−1)−log2π−1/2)` | Holds | Carried (r10) |
| §4.13 / §4.14 | `k=1,2,3` | `6/π²`; `1/8640`; `1/(2π²)` | Holds | Carried (r10) |
| §4.2 / §4.3 | Hurwitz difference; `G(5)` | `−i/2`; `12` | Holds | Carried (r10) |
| `barnesG_asymptotic` | `z log Γ(z+1)` | `B₂/2−1/12=0` | Holds | Carried (r10) |
| `complexHurwitzContinuation_exists` | `m=0,1` | `−1/2`, `−1/12`, `1/2−c` | Holds | Carried (r10) |
| `lerch_completed_functional_equations` / `lerchContinuation_solvable` | applied twice; basepoint | reproduces `Λ_k`; well defined | Consistent | Carried (r10) |
| §5.1/§5.17, §5.15, §5.26, §5.23 | `ψ1`, `ψ2`; `A`; `B(0)`; `ψ−2` | `0`, `−1`; `A²=I`; `4/(3π)`; `√8/π` | Holds | Carried (r10) |
| `quadraticReflectionFactors`, §5.18 | `ψ−1`, `s=0`; `(10,10)` | `4/(3π)`; `1083/4` | Holds | Carried (r10) |
| `quadraticDoubleSeries_continuation` | `P∘α` | `P(w,s)=P(s,w)` | Consistent | Carried (r10) |
| §5.3d / §5.3e | `u=0.7`, `1.3` | `C_R(u)C_R(2−u)=I`; `7.6029247` | Holds | Carried (r10) |
| §5.10a | binary-cubic pairing | `det A=1/9`; `|3|^(−1)` | Holds | Carried (r10) |
| §5.3l / §5.3m / §5.3n | `n(x)t`; intertwiner | `|s₁/s₂|^(−1)`; `ζ_v(z−1)/ζ_v(z)` | Holds | Carried (r10) |
| §5.21j / §5.21w | principal `χ` | `κf̂(0)`, `−κf(0)`; `K_ℝ(2,1)=πe^(−2π)` | Holds | Carried (r10) |

## Not verifiable

- **Tate [129].**
  - The new docstring of `adeleRing_selfDual` cites §4.1, and `README.md:692` cites §§4.1–4.2.
  - The chapter appears in Cassels–Fröhlich, *Algebraic Number Theory*, a book that is not open access. It is not in the manifest, and I consulted no legal open copy.
  - The mathematics was checked by computation instead (table rows 1–13).
- **Wright [103], §1, pp.509–511** (`:692`, unchanged). The GDZ copy is not in the manifest, and this review edits no manifest.
- **Datskovsky–Wright [105].** The scan is image-only and this worker has no OCR. No changed passage cites it.
- **The seeded sample** lies wholly outside the changed lines and was not rechecked this round. r10 checked LOWW and Stark74 at their locators.

## Source issues

- none
