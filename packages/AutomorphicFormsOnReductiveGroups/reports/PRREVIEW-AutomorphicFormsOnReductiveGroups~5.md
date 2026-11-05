# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 5dc72cb)

**Verdict:** needs changes

Incremental re-review of the 24 lines changed since d9d4660 (README only: the new §2.3a on minimal parabolic subgroups and the Langlands decomposition, one sentence on symmetric powers in §2.5, one sentence in the Layer 2 dependencies, two new references; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). The gate passes every check, the dependency check prints no UPWARD or CYCLE line, and the one Lean theorem elaborates with `sorry` as the only warning. One P2 and three P3 findings: a Check in §2.3a states a false characterization of `P=G` that the Check before it refutes; the conjugacy of Cartan involutions is cited to the wrong ALS section; the algebraic comparison's Lie-theoretic bridge is cited to Borel–Tits §§4–5, which do not contain it (their §14.7 does); and the pull request's merge-order block still names three roadmaps the README consumes nothing from.

## R01 (P2) — "P is normal only when P=G, which happens exactly when 𝔭₀=0" is false, and the Check before it says so

Location: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` line 386: "the subgroup `P` is normal in `G` only when `P=G`, which happens exactly when `𝔭₀=0`, that is, for compact `G`."

Claim: `P=G` if and only if `𝔭₀=0`.

Witness: line 385, the Check immediately before: "For `G=ℝ^×` with `K={±1}` and `𝔞=ℝ`: `M={±1}`, `A=ℝ_{>0}`, `N=1` and `P=G`." Here `𝔭₀=ℝ≠0` and `P=G`. Computed: `ad(𝔞)=0` on `𝔤₀=ℝ`, so `Σ=∅`, `𝔫=0`, `N=1`, `P=MA=G`. The same holds for `GL₁(ℝ)` and for every `G` in the supplied class whose `𝔭₀` is central, for example `G=ℝ^××SO(3)` with `𝔭₀=ℝ`. The "only if" direction (`P=G ⇒ 𝔭₀=0`) fails; the "if" direction (`𝔭₀=0 ⇒ P=G`) is the first bullet of line 385 and holds.

Repair: replace the clause by "which happens exactly when the restricted root system `Σ` is empty, that is, when `𝔞` is central in `𝔤₀` (equivalently `𝔭₀` lies in the centre of `𝔤₀`); this covers compact `G` and `G=ℝ^×`, and fails for `SL₂(ℝ)`, where `Σ={±λ}`." Tested: `ℝ^×` has `Σ=∅` and `P=G`; `SL₂(ℝ)` has `Σ={±λ}` and `P` the upper triangular subgroup `≠G`; compact `G` has `𝔞=0`, `Σ=∅`, `P=G`. (`Σ=∅` gives `𝔫=0`, `N=1`, so `P=MA=Z_G(𝔞)`, and `𝔞` central gives `Z_G(𝔞)=G`; conversely `P=G` forces `𝔫=0`, so `Σ⁺=∅`, so `Σ=∅` as `Σ=Σ⁺⊔(−Σ⁺)`, and then `ad(H)` is nilpotent and semisimple for `H∈𝔞`, hence zero, so `𝔞` is central.)

## R02 (P3) — Conjugacy of Cartan involutions is ALS.0.1, not ALS.0.3

Location: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` line 372: "any two Cartan involutions are conjugate under `G` (ALS.0.3)".

Claim: ArithmeticLocallySymmetricSpaces ALS.0.3 states that any two Cartan involutions are conjugate.

Witness: at the open head of ArithmeticLocallySymmetricSpaces, ALS.0.1 ("Cartan involutions of real reductive groups") lists `IsCartanInvolution.conj`: any two Cartan involutions `θ,θ′` of `G` differ by `ad(g)` for some `g∈G(ℝ)`. ALS.0.3 ("Maximal compact subgroups from Cartan involutions") states that `K_∞=G(F_∞)^θ` is maximal compact, meets every component, that every compact subgroup is conjugate into `K_∞`, and the Cartan diffeomorphism; it says nothing about conjugating involutions.

Repair: cite "(ALS.0.1, `IsCartanInvolution.conj`)" at line 372, keeping ALS.0.3 for `K=G^θ` being maximal compact. The `*Needs:*` line at line 376 already names ALS.0.1–ALS.0.3 together and needs no change.

## R03 (P3) — The algebraic comparison's Lie-theoretic bridge is not in Borel–Tits §§4–5; it is their §14.7

Location: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` line 375: "`P=G∩𝐏(ℝ)` … `N=R_u(𝐏)(ℝ)`, `A=𝐒(ℝ)°` and `MA=G∩Z_𝐆(𝐒)(ℝ)`. (Borel–Tits, *Groupes réductifs*, §§4–5.)"; the reference at line 1339 says the same.

Claim: Borel–Tits §§4–5 support the comparison, in particular that a maximal `ℝ`-split torus `𝐒` with Lie algebra `𝔞` exists, that `Σ(𝔤₀,𝔞)` is the relative root system `Φ(𝐆,𝐒)`, that `A=𝐒(ℝ)°` and that `Z_𝐆(𝐒)(ℝ)=M·A`.

Witness: §§4–5 are purely algebraic over a field `k`: Theorem 4.15 (`borel-tits` lines 1488–1497) gives `G_{Φ⁺}` as the parabolic with Levi `Z(S)` for an ordering of `Φ(S,G)`, Corollary 5.9 (lines 1802–1805) says the minimal `k`-parabolics containing `S` are exactly the `G_{Φ⁺}`, permuted simply transitively by the relative Weyl group, and Corollary 5.19 (lines 1935–1936) says a `k`-parabolic is the normalizer of the `k`-points of its unipotent radical. None of them mentions a Cartan involution, `𝔭₀`, `𝔞⊆𝔭₀` or the Iwasawa `N`. The bridge is §14.7, printed pp.147–148 (`borel-tits` lines 3775–3821): for `G` semisimple over `ℝ`, with `K`, `𝔭`, `𝔞` and `A=exp 𝔞`, `N=exp 𝔫` as in the Iwasawa decomposition, the Zariski closure `S` of `A` is a maximal `ℝ`-split torus with `A=(S_ℝ)°`, `Z(S)_ℝ=(K∩Z(S)_ℝ)·A` by the argument `[𝔭,𝔭]⊆𝔨 ⇒ 𝔪=𝔞` (lines 3807–3811), `𝔞` is the real part of `Lie S`, the restricted roots are the differentials of the `ℝ`-roots, and `W(𝔞)` is the relative Weyl group (lines 3814–3820). §14.7 assumes `G` semisimple (line 3777); the target's reductive case adds the split centre.

Repair: cite the comparison as "(Borel–Tits, *Groupes réductifs*, Theorem 4.15, Corollaries 5.9 and 5.19 for the algebraic side, and §14.7, pp.147–148, for the identification of `A`, `𝔞`, `Σ` and `W(𝔞)` with `𝐒(ℝ)°`, `Lie 𝐒(ℝ)`, `Φ(𝐆,𝐒)` and the relative Weyl group, stated there for semisimple `𝐆`; the reductive case adds the central split torus)" and extend the reference at line 1339 with "§14.7, pp.147–148". A one-clause route for the reductive extension belongs in the target: `𝔞` contains the `𝔭₀`-part `𝔞_G` of the centre, and the Zariski closure of `exp 𝔞` is still a split torus of symmetric matrices, so its Lie algebra is an abelian subspace of `𝔭₀` containing `𝔞`, hence `𝔞`.

## R04 (P3) — The pull request's merge-order block still names the three dropped suppliers as prerequisites

Location: the pull request description, `<!-- merge-order -->` block: "It also depends on other authors' pull requests that add roadmaps it cites, which must merge first: #934 (QuaternionicModularForms, WilliamCoram), #1015 (NoncompactQuantumSymmetry, kim-em), #1145 (SmoothBanachRepresentations, kim-em)".

Claim: this roadmap depends on those three pull requests.

Witness: the README at this head cites all three only as consumers (SmoothBanachRepresentations "is a consumer, not a supplier", QuaternionicModularForms consumes §§7.4–7.6, NoncompactQuantumSymmetry is at merge-order line 138 and is cited only as a consumer), and the dependency check at this head loads no edge to any of them (`205 roadmaps, 1674 edges, 0 problem(s)`). The block is unchanged since the previous two reviews (their R03 and R01), which found the same; this is a description edit, not a folder edit, and does not block the folder on its own.

Repair: drop #934, #1015 and #1145 from the merge-order block and say in the description that the Lie test functions (§0.1a), the Banach smooth vectors (§2.7) and the abstract level-form carrier (§7.4) are targets here, with SmoothBanachRepresentations and QuaternionicModularForms as consumers.

## Previous findings

- R01 — not repaired: the merge-order block of the description still names #934, #1015 and #1145 as prerequisites ("It also depends on other authors' pull requests that add roadmaps it cites, which must merge first: #934 …, #1015 …, #1145 …"); R04 above, P3, outside the folder.

## Verified sound

**Gate, build and edits outside the folder.** The worker's gate at 5dc72cb passes every check (`depcheck=0`, `residue=0`, `readme-ids-missing=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `stray-files=0`, `outside-folder=0`, `build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty, and the change since d9d4660 touches only `README.md` (22 insertions, 2 deletions). `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` at this head takes 22.6 s and prints only `declaration uses sorry` (line 47). The file is byte-identical to the head of the previous three reviews, so the elaborated type of `compactFinite_dense_locallyConvex` (the worker's `signatures.md`: `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]`, the joint-continuity hypothesis, conclusion `Dense` of the set of vectors whose `K`-orbit spans a finite-dimensional space) still matches §2.1's statement, no binder is dropped, the one-tactic probes and the headline audit of the earlier reports stand, and the docstring's list of unstatable headlines still matches the README. §2.3a adds no headline: minimal parabolic subgroups of a real reductive Lie group need LieGroups Layer 9's `IwasawaData`, which is not at the pins, so nothing new is statable and nothing new is absent.

**Dependency check.** Output at this head:

```
depcheck: 205 roadmaps, 1674 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 63, after ArithmeticLocallySymmetricSpaces (62); the new `*Needs:*` line of §2.3a cites LieGroups (on main, `RepresentationTheory/LieGroups`), ArithmeticLocallySymmetricSpaces (line 62) and ReductiveGroups (on main), all suppliers.

**Supplier citations of §2.3a resolved.** LieGroups on main: `CartanInvolution` (`Suggested.lean` line 660, with the reductivity fields), `IwasawaData` (line 684: `cartan`, `K`, `𝔞` maximal abelian in the `−1`-eigenspace, `A=lieExp 𝔞`, closed connected `N=lieExp 𝔫` normalized by `𝔞`, `𝔤=𝔨⊕𝔞⊕𝔫`, the chamber cone), `iwasawaDecomposition` (line 740, `G=KAN` as existence and uniqueness of the factorization), `restrictedRootSystem` and `W(𝔞)=N_K(𝔞)/Z_K(𝔞)` (README line 459), `lieExp` (Layer 0, README line 245), `Ad` (Layer 1, line 261), the closed-subgroup theorem (Layer 2, line 275). ArithmeticLocallySymmetricSpaces at its open head: ALS.0.1 (Cartan involutions, existence, `IsCartanInvolution.conj`, the transpose-inverse involution on transpose-stable `G⊆GL_n`), ALS.0.2 (`G(F_∞)=𝐆(ℝ)` is a real reductive group in LieGroups Layer 9's sense with `𝔤=𝔨⊕𝔭`, the split centre inside `exp 𝔭`), ALS.0.3 (`K_∞=G(F_∞)^θ` maximal compact, meets every component, every compact subgroup conjugate into it), ALS.F.1 (real points as Lie groups with finitely many components). ReductiveGroups on main, Layer 7 (README lines 627–647): parabolic `k`-subgroups and Levi complements over every field, the descent of the geometric unipotent radical to a `k`-split `U` with `P=L⋉U`, the cocharacter description `P=P_G(λ)`, `U=U_G(λ)`, `L=Z_G(λ)`, and the relative root system for non-split groups, which is what the comparison consumes (maximal split tori sit inside its relative root datum). Tau Ceti at the pin: `TauCeti.upperUnitriangularGroup m R : Subgroup (GL m R)` for `[Ring R]` (`LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean` line 107) and `TauCeti.upperTriangularGroup m R : Subgroup (GL m R)` for `[CommRing R]` (`UpperTriangular/Basic.lean` line 55); at `m=Fin n`, `R=ℝ` they are the `N` and `P` of the `GL_n(ℝ)` Check.

**Ownership.** `roadmaps grep` for "Langlands decomposition" and "minimal parabolic subgroup" over the open heads and main finds no other roadmap building the Langlands decomposition `P=MAN` of a real reductive Lie group (AutomorphicSpectralTheoryPartII line 1597 uses the phrase for the spectral decomposition of discrete data, a different object; ReductiveGroups Layer 7C mentions "minimal-parabolic two-cell" inside its Bruhat argument for algebraic groups). LieGroups Layer 9 stops at `G=KAN` and the restricted root system, and ArithmeticLocallySymmetricSpaces ALS.0 builds the symmetric space and never a parabolic; so this roadmap is the owner of `M=Z_K(𝔞)`, `P=MAN` and their properties, and the algebraic side stays with ReductiveGroups. Ownership against open pull requests whose files the brief did not give me was not checked beyond the grep.

**Adversarial table** (a row with computed values for every changed statement; the previous report's rows for the untouched statements carried forward by citation).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `M=Z_K(𝔞)` compact with Lie algebra `𝔪₀`; `M∩A=1` (line 372) | `SL₂(ℝ)`; `a∈A∩K` general | `Z_{SO(2)}(diag(1,−1))`: `r_φ` commutes iff `sin φ=0`, so `M={±1}`, `𝔪₀=0=Z_{𝔰𝔬(2)}(𝔞)`; `a=lieExp H∈K` gives `θ(a)=lieExp(−H)=a`, so `lieExp(2H)=1`, `H=0` by injectivity on `𝔞` (`A_exp_injOn`) | holds | none |
| `MA=Z_G(𝔞)` and `P∩θ(P)=MA` (line 372) | `SL₂(ℝ)`, `GL_n(ℝ)` | `Z_{SL₂}(diag(1,−1))` = diagonal = `{±1}·A`; upper ∩ lower triangular = diagonal = `MA`; `GL_n`: `Z_G(diag)` = all invertible diagonal = signs × positive = `MA` | holds | none |
| `P=N_G(𝔫)=N_G(P)` (line 372) | Bruhat cell argument; `SL₂` | `g=p₁wp₂` with `w∈N_K(𝔞)` normalizes `𝔫` iff `w(Σ⁺)=Σ⁺` iff `w∈M`; `SL₂`: `r_{π/2}` sends `E_{12}` to `−E_{21}∉𝔫`, so `N_G(𝔫)=P` | holds (Borel–Tits 5.19 on the algebraic side, lines 1935–1936) | none |
| `G=KP`, `K∩P=M`, `G/P≃K/M` compact (line 372) | `SO₀(n,1)`, `SL₂` | `K∩MAN=M` by uniqueness of `KAN`; `SO(n)/SO(n−1)=S^{n−1}`; `SO(2)/{±1}=ℙ¹(ℝ)` | holds | none |
| Recovery `𝔞=Lie(P∩θ(P))∩𝔭₀` (line 372) | general | `Lie(MA)=𝔪₀⊕𝔞` with `𝔪₀⊆𝔨₀`, `𝔞⊆𝔭₀`, so the intersection with `𝔭₀` is `𝔞` | holds | none |
| Conjugacy: `(𝔞,Σ⁺)` under `K`, `θ` under `G` (line 372) | `SL₂`: the two chambers | `r_{π/2}` swaps `λ` and `−λ`, conjugating `P` to `θ(P)`; Cartan involutions conjugate by `IsCartanInvolution.conj`, which ALS.0.1 states, not ALS.0.3 | holds; locator wrong | R02 |
| Rank one: `Σ⊆{±λ,±2λ}`, minimal parabolics containing `MA` are `P`, `θ(P)` (line 374) | `SO₀(n,1)`, `SU(2,1)` | `SO₀(n,1)`: `Σ={±λ}`, `m(λ)=n−1`, no `2λ`; `SU(2,1)`: `Σ={±λ,±2λ}`, `m(λ)=2`, `m(2λ)=1`, `dim 𝔫=3`; two chambers in a line, Borel–Tits 5.9 (lines 1802–1805): minimal parabolics containing `𝐒` ↔ positive systems, simply transitive `W` | holds | none |
| Algebraic comparison `P=G∩𝐏(ℝ)`, `N=R_u(𝐏)(ℝ)`, `A=𝐒(ℝ)°`, `MA=G∩Z_𝐆(𝐒)(ℝ)` (line 375) | `GL_n`, regular `ν`; `G°` | `ν(t)=diag(t^{n−1},…,t,1)` has `(e_i−e_j)(dν(1))=j−i>0` for `i<j`, `𝐏(ν)` = upper triangular Borel, `R_u=` unitriangular `=N`, `Z(𝐒)`= diagonal, `Z(𝐒)(ℝ)=M·A`; `G°∩M=Z_{K°}(𝔞)` since `K∩G°=K°` by the Cartan decomposition; the identification `A=(𝐒_ℝ)°`, `𝔞=`real part of `Lie 𝐒`, `Σ=Φ(𝐆,𝐒)` is Borel–Tits 14.7 lines 3803–3820 (semisimple `𝐆`), not §§4–5 | holds; locator incomplete | R03 |
| `SO₀(n,1)` Check (line 382) | `n=2,3`; `H=E_{n,n+1}+E_{n+1,n}` | `K∩O(n+1)=diag(SO(n),1)`; `k=diag(k',1)` fixes `H` iff `k'e_n=e_n` iff `k'=diag(m,1)`, `m∈SO(n−1)` (`n=2`: `M=1`, matching `PSL₂(ℝ)`); `exp(tH)` on `⟨e_n,e_{n+1}⟩` = `((cosh t,sinh t),(sinh t,cosh t))`; `H(e_n+e_{n+1})=e_n+e_{n+1}`, eigenvalue `1`, `a_t` acts by `e^t`; `𝔰𝔬(n,1)` rank one, `Σ={±λ}`, `m(λ)=n−1`, `𝔫` abelian; `G/P=S^{n−1}` | as stated | none |
| `SL₂(ℝ)` Check (line 383) | `a=diag(t,t⁻¹)`, `r_{π/2}` | `Ad(a)E_{12}=t²E_{12}`, `δ_P(a)=t²`, matching §2.3's "positive determinant of `Ad(a)` on the real nilradical"; `Ad(r_{π/2})diag(1,−1)=diag(−1,1)`, `N_K(𝔞)={±1,±r_{π/2}}`, `W=` order two | as stated | none |
| `GL_n(ℝ)` Check (line 384) | `n=2`; `p=((−2,1),(0,3))` | `Z_{O(n)}(diag)` = diagonal sign matrices, `2^n` of them, `det=±1` meets both components; `p=diag(−1,1)·diag(2,3)·((1,−1/2),(0,1))`, signs × absolute values × unitriangular; `G=KP` with `K∩P=M` is `QR` up to signs; `Σ={e_i−e_j}` reduced, multiplicities one; `TauCeti.upperUnitriangularGroup`/`upperTriangularGroup` exist at the pin as `Subgroup (GL m R)` | as stated | none |
| Compact `G` and `ℝ^×` Check (line 385) | both | compact: `𝔭₀=0`, `𝔞=0`, `Σ=∅`, `P=K=G`; `ℝ^×`: `K={±1}`, `𝔭₀=ℝ=𝔞`, `ad(𝔞)=0`, `Σ=∅`, `N=1`, `P=MA=G` | as stated | none |
| `Z_K(𝔞)=Z_K(A)`; "`P=G` exactly when `𝔭₀=0`" (line 386) | `ℝ^×`, `SL₂`, compact | `k a k⁻¹=lieExp(Ad(k)H)` and injectivity on `𝔞` give the first; `ℝ^×`: `P=G` with `𝔭₀=ℝ≠0` refutes the second; `SL₂`: `P≠G`, `Σ≠∅`; correct criterion `Σ=∅` | first holds, second false | R01 |
| §2.5 `Sym^m` of a semisimple Weil representation (line 446) | `W_ℝ`, `r=Ind(z^p z̄^q)`, `p≠q`, `m=2`; `n=1`; `m=0` | `r|_{ℂ×}=χ⊕χ^c`, `Sym²r|_{ℂ×}=χ²⊕χχ^c⊕(χ^c)²`, three characters, semisimple, `dim 3=binom(3,2)`; index-two normal subgroup, char 0: `V` semisimple iff `V|_{ℂ×}` semisimple (average a `ℂ×`-complement over `W_ℝ/ℂ×`); `n=1`: `Sym^m χ=χ^m`, `binom(m,m)=1`; `m=0`: trivial character, `binom(n−1,0)=1` | holds | none |
| Layer 2 dependencies sentence (line 520) | the cited suppliers | LieGroups Layer 9 and ReductiveGroups Layer 7 exist on main with the named content (resolved above) | holds | none |
| `compactFinite_dense_locallyConvex` (Lean, unchanged) and §§0.1, 0.1a, 0.3, 0.4, 0.7, 2.2–2.7, 3.2, 3.5, 4.1, 4.3, 4.5, 5.1, 5.3–5.5, 6.1, 6.3, 6.6–6.8, 7.2/7.3 dictionary, §7.4 trace, slash operator, Hecke/native product, `inverseActionHeckeEquiv`, §7.5 stabilizer transport, §7.6 central trace | as in the previous report | carried forward from the previous report's table and the rows it carried from the reports before it; none of their text changed at this head | sound | none |

**Seeded sample.** Of the fifteen sampled targets, none falls in the 24 changed lines; the nearest are §2.3 (unchanged; its "`M=Z_K(A)` compact" at line 394 is the `M` of §2.3a, which agrees by the `Z_K(𝔞)=Z_K(A)` row above) and §2.5 (the symmetric-power sentence, in the table). The sampled targets were verified at their locators in the earlier full review and are unchanged.

**Principles.** The changed lines contain no route-specific shortcut (§2.3a is stated for the whole supplied class, with the explicit examples as Checks), no re-planned roadmap (LieGroups Layer 9's Iwasawa data and ReductiveGroups Layer 7's parabolics are consumed, not rebuilt), no copied passage, no algorithm, no `set_option`, no sorry'd data, no edit outside the folder, and no process word or pull-request number in the README. The §2.3a definition (`M`, `P`, the Langlands decomposition) has five Checks, each computing a value a wrong definition (for example `M=K`, or `P=MAθ(N)`) would get wrong.

**Declared gaps.** Unchanged: `gap:banach-gfinite-density` (CompactGroups Layer 5) and `gap:reductive-enveloping-centers` (LieHighestWeight Layer 9) are stated in the supplier subsections in the required form; there is still no readable `design/plan.json`, so the intake must record the two slugs in the plan's `gaps`, as the earlier reviews noted.

## Not verifiable

- Knapp, *Lie Groups Beyond an Introduction* (2002), Ch. VI §§4–5 and Ch. VII §§2 and 7, cited at line 372 and 1338: a Birkhäuser book with no legal open copy; the sources service found none (the request is recorded in the job's `needs-references.toml` as `knapp-beyond`). The statements it is cited for (Iwasawa decomposition, restricted Weyl group, `Z_G(𝔞)=MA`, the closedness and self-normalization of `MAN`) are standard and were checked by computation above and against Borel–Tits §14.7 for the semisimple case.
- The previous reports' items (Borel–Jacquet, Flath, Langlands's Corvallis article, Vogan 1984, Lapid, Clozel's Ann Arbor article, Kudla, Kostant) concern passages this head does not change and stand as listed there.

## Source issues

- none (the two getz misprints recorded in the earlier full review concern unchanged passages and are not repeated here).
