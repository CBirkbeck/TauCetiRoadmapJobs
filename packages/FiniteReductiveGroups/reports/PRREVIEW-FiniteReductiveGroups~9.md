# Review of FiniteReductiveGroups (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2151 changed lines since `aecb53a`. I read every changed section against the merge base, checked the sampled locators that have a legal copy, resolved the new supplier sections at this head, and re-ran the dependency check and the elaboration. Changes are needed for four findings:
- the revision drops from this README items that main has: the definition of the characteristic map of 5.4, a clause of 1.1 and ten Checks (R01);
- 3.2 states the Künneth formula under hypotheses it does not name (R02);
- the new "Corollaries of general theorems" convention plans throw-away proofs of special cases, and with it 4.8, 5.4 and 5.7 are cut down to `p ≥ 5` although their own routes prove every `q` (R03);
- the scope section claims statements that CharacterTheory Layer 9a and SmoothRepresentationsOfLocalGroups SR.7.2 now state at the same generality (R04).

There are five small corrections and one format note. Three points are left for the human reviewers: the formal proof the family cites, the unread source Green 1955, and the family-wide reach of R03.

## R01 (P1) — The revision removes from this README items that main has: the definition of `ch_m` in 5.4 with clauses of its (a) and (d), a clause of 1.1, and ten Checks

The README on main is the record that the status pages read. After this change, a reader of 5.4 meets `ch_m` by name but never its definition, and the Checks that fixed its sign and several Layer 4 values are gone.

On main, 5.4 defined `Λ_m` and `ch_m(⊗_O p_{ρ_O}) = (−1)^{n+Σ_O m(O)} R_{T_{m,ρ}}^G(θ_{m,ρ})`. It also stated two clauses that are now missing:
- in (a), that the `V_m` are pairwise orthogonal and span all class functions;
- in (d), that the `χ_λ` are pairwise distinct and `⟨χ_λ, R_{L_m}^G σ_m⟩ = ∏_O f^{λ(O)}`.

The head's paragraph at line 1876 keeps the isometry, the multiplicativity, (c) and the Harish-Chandra series. It drops the defining formula and the two clauses above, which now appear only in RepresentationTheory/CharacterTheory §9a.6.

1.1 on main also said that a linear character is trivial on `U₀^F` iff it is trivial on all unipotent elements iff its order is prime to `p`. The general-statement paragraph of 1.1 (line 431) no longer has this clause. The Check "The condition on `χ` cannot be dropped" (line 449) still tests it.

Of the 123 Checks on main, 113 remain. The ten removed are:
- now only in other roadmaps: 4.5 (a) on `𝔾_m` over `𝔽₃` and 4.5 (b) for `GL₂` (ReductiveGroups Layer 9F), and the three Checks of 5.4 (CharacterTheory §9a.6);
- found nowhere at this head:
  - 4.1 (b), the count of `K`-points of `Y_U → X_B` for `SL₂` over `𝔽₂`, `𝔽₃` and `GL₃` over `𝔽₂`;
  - 4.4, the `SL₂(𝔽₂)` computation in the model `det(v, Fv) = 1`;
  - 4.6 (c), three copies of `SL₂` cycled by `F`;
  - 4.7 (a), at a torus in a rational Borel subgroup;
  - 4.7, the Check of a second route at `n = 2`.

The repair is to restore each item under its section:
- the definition of `ch_m` and the dropped clauses in 5.4's paragraph at line 1876, cited to §9a.6 like the rest of that paragraph;
- the clause of 1.1 in its general-statement paragraph;
- the Checks under 4.1, 4.4–4.7 and 5.4. A Check whose route now lives in ReductiveGroups Layer 9F stays as a Check of the value it computes; the Check of the deleted second route of 4.7 can go with that route.

## R02 (P2) — 3.2 states the Künneth isomorphism "under the étale inputs that [FormalProof] names as hypotheses" without naming them, so the target's hypotheses are undetermined

An implementer of 3.2 (line 1160) cannot tell what to assume. If those inputs include a Künneth statement, the target asks for nothing.

The *Corollary of:* line (1158) names EtaleCohomologyFoundations §F.2.7. At this head, §F.2.7 proves Künneth for `RΓ_c` of separated finite-type schemes over a separably closed field with finite torsion coefficients, with no other hypothesis. With rational realisation (§F.4.5) and `H_c = H` for proper schemes, it gives the stated isomorphism unconditionally. For example, for `X = Y = ℙ¹`, `H²(ℙ¹ × ℙ¹)` has dimension 2, which is the dimension of `H⁰ ⊗ H² ⊕ H² ⊗ H⁰`.

The repair is to drop the clause "Under the étale inputs that [FormalProof] names as hypotheses" and state the isomorphism for proper smooth `X` and proper `Y`. The Method label can record that the formal proof has the statement conditionally, and name the inputs there. If the conditional form is what is meant, name the inputs in the statement instead.

## R03 (P2) — The convention "Corollaries of general theorems" plans an interim proof of each special case by the formal proof's route, to be deleted later, and with it cuts 4.8, 5.4 and 5.7 down to `p ≥ 5`

The binding principles ask for no route-specific shortcut and no "good primes only". The repository README asks authors to "decide the generality up front … rather than recommending intermediate implementations that will be replaced". Lines 172–176 do the opposite: "As long as that general theorem is not in the library, what the line covers is proved as [FormalProof] proves it … the lemmas that only the first proof uses are removed."

The narrowing it brings serves only that interim proof. The routes written beside each section prove every `q`:
- **4.8** (line 1543) asserts uniqueness of the label only for `p ≥ 5`. Its route specialises ReductiveGroups §7h.2 to `GL_n` and uses CharacterTheory §§9a.4, 9a.7, with no hypothesis on `p`.
- **5.4** (line 1869) is stated for squarefree labels over `𝔽_p` with `p ≥ 5`. Its route is CharacterTheory §9a.6 (b)–(d), which covers every label over every finite field.
- **5.7** (line 2030) restricts to `p ≥ 5`. Its route specialises §9a.9 to `q = p`.

At the excluded prime `p = 2` the clauses hold, computed in `GL₂(𝔽₂) ≅ S₃`:
- the trivial character and `St` have the label `(X+1)²`, and `sgn` has `X²+X+1`: each character has exactly one label;
- for the squarefree label `X²+X+1`, `R(σ) = sgn` is irreducible and generic, of degree `ψ₂(2)/(2²−1) = 1`.

The smallest repair:
- replace the two sentences of lines 172–176 by one saying that the section is a case of the named theorem and is deduced from it, the Method label recording how the formal proof argues and which form it has;
- state the label clause of 4.8, 5.4 and the `p ≥ 5` clauses of 5.7 for every finite field, as their routes give, and record `p ≥ 5` as the formal proof's form, as 6.5 already does for `q = p`.

The family index carries the same two sentences (its lines 66–70).

## R04 (P2) — Scope and ownership claims statements that CharacterTheory Layer 9a and SR.7.2 now state at the same generality, and in the next paragraph gives them to those sections

With two owners, an implementer cannot tell where Green's parametrisation, the Shintani lift or the depth-zero supercuspidals of `GL_n(F)` are to be built.

The Layer 2, 5 and 6 bullets of "The roadmap owns" (lines 2710–2736) claim for this roadmap:
- the cuspidal characters and their values, Green's parametrisation and degree formula, uniformity, and Green's virtual characters with the expansion of eigenvalue sums;
- Shintani's norm classes, the Shintani lift in every degree and its compatibility with Harish-Chandra induction;
- the depth-zero supercuspidal representations of `GL_n(F)` as compact inductions.

At this head, these sections state what other roadmaps state at the same generality:
- 2.4 (a)–(d) is CharacterTheory §9a.2;
- 5.2 is §9a.4 (only its separation clause differs; both give the same degree, orbit criterion, central character, twist, dual and values);
- 5.5 is §9a.7;
- 5.6 is §9a.8;
- 5.11 (a)–(c) is §9a.12;
- 6.1 is SmoothRepresentationsOfLocalGroups SR.7.2 (both give `π(σ, c)`, the isomorphism criterion, exhaustion, the `K₁`-invariants and the contragredient for every nonarchimedean `F`).

In addition, 4.4 newly defines Green's class functions `J_n(θ̃)` by the recursion that §9a.8 (b) also uses to define them. The paragraph after the bullets (line 2741), and the list "It does not own", give all of these to CharacterTheory Layer 9a and SR.7.2.

The repair is to:
- move these items to the sentence listing the statements this roadmap restates and the sections they cite own, where 0.2 and 4.1–4.3 already are;
- keep in the bullets only what those sections do not state (the separation clause of 5.2, the degree bound of 2.4 and its consequence for 1.4, 5.11 (d), (e));
- have 4.4 cite §9a.8 (b) for the definition of `J_n(θ̃)`.

## C01 — In 4.5 (b) "degree" means the rank of a cuspidal character, against the README's own usage

Lines 1419–1421 say "cuspidal characters `σ_1, …, σ_r` of total degree `a + b`" and "`Σ_{i∈I} deg σ_i = a`". Elsewhere (2.4, 4.7) the degree of a character is `σ(1)`. Under that reading a cuspidal character of `GL₂(𝔽_p)` has degree `p − 1`, and the index set is wrong. Writing "`σ_i` of `GL_{d_i}(𝔽_p)` with `Σ_i d_i = a + b` … `Σ_{i∈I} d_i = a`", as 4.7 (c) does, would fix it.

## C02 — 6.1's Origin credits Carayol (1984), Theorem 4.2, with the `K₁`-invariants

Carayol's Theorem 4.2 (p. 205, with the complement to Definition 4.1, p. 204) gives irreducibility, cuspidality, the minimal conductor and inequivalence. It does not give `π^{K₁} ≅ σ` or the contragredient. SR.7.2 itself says no cited source states these two. The Origin (line 2438) should put "with `K₁`-invariants `σ`" with the derived clauses.

## C03 — Layers 4 and 5 now depend on each other at the layer level

On main, Layer 4 needed nothing from Layer 5. Now 4.4, 4.5, 4.7 and 4.9 need 5.1, and 4.8 needs 5.7 (Layer 4 Dependencies, line 1682), while Layer 5 needs Layer 4. Item by item the dependencies are acyclic. The facts used, the Coxeter torus normaliser and the definition of a label, are stated in CharacterTheory Layer 9a and could be cited from there; otherwise a sentence saying so would help.

## C04 — The description does not say that this roadmap's suppliers change

After this change, OrbitMeasuresOnAdelicGroups §4.1, InverseGaloisAndArithmeticFundamentalGroups and SchemeAndStackFoundations are no longer cited. EtaleDualityAndPerverseSheaves §7.6, CharacterSumsOverFiniteFields §3.1a, ReductiveGroups Layers 7h, 7i and 9F, CharacterTheory Layer 9a and SR.7 now are. One sentence under part 2 of the description would cover this.

## C05 — #3036 also edits this README, and no order between the two is stated for this folder

#3036 rewrites the *Needs:* line of 0.5, which this pull request also rewrites. The generated merge-order block lists no order for `FiniteReductiveGroups`. Name one there.

## N01 — The Summary carries the citation key [FormalProof] and section lists ("Layers 7a, 7h, 7i and 9F", "Layer 9a"); the overview needs neither.

## Questions for the author

- On main, 4.10 and 4.11 held for every Steinberg endomorphism, through the Conventions. Their new Remarks say the case that is not a `q`-Frobenius is covered by no section and given no route. Was it dropped because Deligne–Lusztig 1976, Theorem 9.16, treats Frobenius maps only? Digne–Michel (2020), which the README cites for 4.3 and 4.6 in that generality, may state it; I could not read it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.3 (Steinberg 1965 locators) | 2.7 (a), 2.8, 2.11, p. 53–54 | `C_G(s)°` reductive of rank `r`, generated by `T` and `X_α`, `α(s)=1`; contains every torus through `s` | agrees, for semisimple `G` | none |
| 0.4 count | `q=2`, `n=2` | monic, nonzero constant: `X²+X+1`, `X²+1`: 2 = `4−2` | holds | none |
| 0.5 (Steinberg) | 3.1, Lemma 3.2, Thm 3.3, pp. 54–55 | existence; `x` in finitely many Borels iff in one iff simple components nontrivial | agrees | none |
| 1.1 sample | `GL₂(𝔽₂)≅S₃` | `sgn(t)=−1` on `U=⟨t⟩`: no fixed vector, cuspidal; trivial not; count `½q(q−1)=1` | holds | R01 (clause) |
| 1.2 `GL_n(𝔽_p)` | `p=2,n=2` | supports: `sgn` → (`sgn`); 1, St → (1,1); lists distinct ⇒ orthogonal | holds; `p` unused | R03 context |
| 2.2 sample | `GL₂(𝔽₃)`; `SL₂(𝔽₃)` | `6+4+6=16=(q−1)(q²−1)`; `3+2+2+1=8=q²−1` | holds | none |
| 2.4 sample (Gelfand 1970) | Prop 1.3, Thm 2.3+Cor 1, Thm 3.3; (c) `GL₂`, `GL₃` | (c): `−1` at regular unipotent of `GL₂`; `−(q−1)` at class (2,1) | holds | none |
| 2.6 new `GL_n(𝔽_p)` | `a=0`; `a=b=1` | adjunction: `⟨Rρ,Γ₂⟩=⟨ρ,Γ₁⊠Γ₁⟩`; `a=0` trivial | holds | none |
| 3.1 sample | `𝔾_m`, `x↦x⁻¹` | `L=−(−1)+1=2`; fixed points 2 (`p≠2`), 1 (`p=2`) | holds; DL not read | none |
| 3.2 Künneth | `X=Y=ℙ¹` | `dim H²=2=1·1+1·1` unconditionally | hypotheses unnamed | R02 |
| 3.3 sample | `𝔾_m`, `g=−1`, `p` odd | `X^s=∅`, `L(u,∅)=0`; `L(g)=−1+1=0` | holds | none |
| 4.1 sample | `𝔾_a`, `𝔾_m` | kernels `𝔽_q`, `μ_{q−1}` of orders `q`, `q−1` = `|G^F|` | holds | R01 (Check) |
| 4.2 sample | `B` rational, `GL₂`, `θ=1` | `R=Ind_B1=1+St`, degree `q+1=[G:B]` | holds | none |
| 4.3 sample | `GL₂`, elliptic `s` | `R_{T_s}(θ)(s)=θ(z)+θ(z^q)=−σ_θ(s)`; split regular: 0 | holds | none |
| 4.4 recursion | `n=2` all classes; `n=3` at 1 | `J₂`: `(1−q)θ(a)`, `θ(a)`, 0, `θ(z)+θ(z^q)` `=−σ_θ`; `J₃(1)=(q−1)(q²−1)` | holds | R04 (definition) |
| 4.5 (b) | `GL₂`, two `GL₁` characters | `*R(σ₁×σ₂)=σ₁⊠σ₂+σ₂⊠σ₁` with deg = rank | holds only reading deg as rank | C01 |
| 4.5 (d) | `θ̃′=1` | `⟨n·1,J_n⟩=n[θ=1]` ⇒ `⟨J_n,1⟩=[θ=1]` | holds | none |
| 4.7 sample | (a) `n=2,3`; (c) two `GL₁` | `1−q`; `(q−1)(q²−1)`; `ψ₂(p)/ψ₁(p)²=p+1` | holds | R01 (Check) |
| 4.8 `p≥5` clause | `p=2`, `GL₂` | trivial, St: `(X+1)²`; sgn: `X²+X+1`; one label each | holds at excluded `p` | R03 |
| 4.10 values | `GL₃` at 1; `GL₂` all classes | `t=3`: `(1−q)(1−q²)` = 4.7 (a); `GL₂` = `J₂` values | holds | Question |
| 4.11 (a), (c) | `p=2,n=2`; `d=1` | `Ind_U sgn=sgn+St`, norm `2=4−2`; `⟨σ,Γ^{(1)}⟩=1` | holds | none |
| 5.1 sample | (a) `q=2,d=4`; (b) `n=2` | `12≤16`; non-regular nontrivial `q−2=Σ_{r∣2}(q^{2/r}−2)`; BKK Prop 8.1 read | holds | none |
| 5.2 | `n=1`; `n=2` centre | `σ_θ=θ`; `(q−1)θ(a)`; same clauses as CT §9a.4 | holds | R04 |
| 5.4 sample | `p=2`, `X²+X+1`; `p=5`, `(X−a)(X−b)` | `sgn`, degree `3/3=1`; `Ind_B`, degree `4·24/16=6=q+1` | holds, also excluded `p` | R01, R03 |
| 5.7 `p≥5` | `GL₂(𝔽₃)` | `k₂(3)=8` characters; generic `6=9−3`; one label each | holds at `p=3` | R03 |
| 5.9 | `n=1`; `n=3` | `N*=q−1`; `k₃=q³−q`, `q³−q²≤k₃≤q³` | holds | none |
| 6.0 sample | Dat Props 3.1, 6.2 (i); MP Prop 6.7; `GL₂` unramified PS | invariants `dim 2 = |W| = dim(π_N)^{T(𝒪)}` | holds (Dat read in HAL v1) | none |
| 6.1 | Carayol Thm 4.2; MP Props 6.6, 6.8; `n=1` | `π(c,c)=c`; Carayol: irreducible, cuspidal, inequivalent; no `K₁` clause | statement holds | C02, R04 |
| 6.2 sample | `n=2`, `q=3` | `c` square: `(4−2)/2=1`; non-square: `4/2=2`; total `3=½q(q−1)` | holds; BH not read | none |
| 6.3 | MP Thm 5.2 (1), p. 110; Dat 6.3 (ii) | depth of subquotient = depth of inducing; parabolic functors keep level 0 | locators agree | none |
| 6.4 sample | `n=1` | class = all characters; tame `χ` ⇒ depth zero | holds | none |
| 6.5 sample | `a=b=1`, `f={α}` vs `{β}` | `χ∘det⊗St` reducible induction (negative control); distinct reductions ⇒ irreducible | holds | none |
| `bessel_pairing_eq` | `n=2,k=1,i=0`; χ = 1, St, regular | LHS `1`, `q`, `|G|`; RHS `1+0`, `1+(q−1)`, `q·|G|/q` | holds | none |
| `exists_cuspidal_of_regular` | `n=1`; `n=2,q=3` | dim `1`, `2`; central value `(q−1)θ(a)` | holds | none |
| `exists_regular_of_isCuspidal` | `GL₂(𝔽₂)` | `sgn=σ_θ`, `θ` of order 3, `θ²≠θ` | holds | none |
| `IsCuspidal`, `HasCuspidalValues` | `n=2`, `K=𝔽₂`; centre | sgn kills `[[1,1],[0,1]]`-fixed vectors; `−θ(a)(1−q)` | holds | none |

- Source locators checked against the text: 22. Moy–Prasad 1996 Thm 5.2 (1) and Props 6.6–6.8; Dat 2009 Props 3.1, 6.2 (i) and 6.3 (ii) (HAL v1); Carayol 1984 Def. 4.1 complement and Thm 4.2; S. I. Gelfand 1970 Prop 1.3, Thms 2.3, 2.4, 3.3 and 6.1; Steinberg 1965 2.7–2.11, 3.1–3.3; Bary-Soroker–Koukoulopoulos–Kozma Prop 8.1; Grinberg–Reiner Lemma 3.2.4. All say what the README attributes to them, except C02.
- Library: the change adds no library name. All seven `Suggested.lean` declarations were checked with `#check` at the pin; they are unchanged from the merge base and none has lost a binder. One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`, `simp_all`): closes none of the three theorems.
- Cross-roadmap citations resolved at this head (none exist on main yet; this pull request adds them):
  - ReductiveGroups §§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 7h.1–7h.3, 7i.1–7i.3, Layer 9E, §§9F.1–9F.11;
  - CharacterTheory §§9a.1, 9a.2, 9a.4–9a.12;
  - EtaleDualityAndPerverseSheaves §7.6 with its four named statements;
  - EtaleCohomologyFoundations §§F.2.5a, F.2.7, F.10.4a;
  - CharacterSumsOverFiniteFields §3.1a;
  - SR.7.1, SR.7.2;
  - LocalFactorsOfTwistsAndTypes §2.1.
- Record comparison: no layer or section heading removed or renamed. 123 Checks on main against 113 at head; the 10 removed are listed in R01.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings only. No file outside the pull request's folders changed.
- Overlap check: read SmoothRepresentationsOfLocalGroups, LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, BesselPoincareSeriesAndGramBounds, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, EndoscopicTransferAndUnitaryTraceComparison and ExceptionalThetaCorrespondencesForG2 (#1736), plus CharacterTheory Layer 9a and ReductiveGroups Layers 7h, 7i and 9F. Shared objects and their owners:
  - depth-zero supercuspidals of `GL_n(F)`: SR.7.2 (R04);
  - the depth-zero Jacquet comparison: SR.7.1, which LocalFactorsOfTwistsAndTypes §2.1 and 6.0 record;
  - Green's theory of `GL_n(𝔽_q)`: CharacterTheory Layer 9a (R04).

  The G₂ depth-zero supercuspidals of #1736 are a different object. BaseChange and BesselPoincare consume this roadmap. #3036 touches this README (C05).
- Source independence: 9 locator passages and 6 further passages compared with 7 sources, changed passages only; none shares wording beyond formulas and standard names. Largest share: Green 1955, 17 of about 121 author–year citations, not readable. Arrangement not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4–5 are Deligne–Lusztig's and Green's character theory of finite reductive groups and of `GL_n(𝔽_q)` (Deligne–Lusztig 1976, Green 1955). Layer 6 is the depth-zero theory of Moy–Prasad 1996 used for local types. The README ties them to Alpöge's 2026 formalisation of GRH for Dirichlet `L`-functions. Rests on the README and MoyPrasad1996.

## Not verifiable

- Green 1955 (Trans. AMS): the DOI landing page is on a host the sources service does not class; affects locators in 0.4, 2.4 (c), 4.4, 4.7, 4.10, 5.2, 5.5, 5.9.
- Deligne–Lusztig 1976 (Annals): JSTOR only; affects 3.1, 3.3, 4.1–4.3, 4.11.
- Dudas–Michel 2015: the sources service found no legal copy; affects 1.0–1.3, 3.1–3.4, 4.1, 4.2.
- Digne–Lehrer–Michel 1992 (Crelle) and Lang 1956 (Amer. J. Math.): publisher and JSTOR pages only; affect 2.2 and 4.1.
- Bushnell–Henniart 2005 (JAMS): the landing page is on a host the service does not class; affects 6.2.
- Zelevinsky 1981: recorded as uncertified; Harish-Chandra 1970, Springer 1970, Digne–Michel 2020, Macdonald 1995, Carter 1985, Shintani 1976 and Kawanaka 1987: books or paywalled, not fetched.
- Dat 2009 was read in its HAL version 1 (2006); numbering against the published version not checked.

## Source issues

- none

## For the human reviewers

- The family's Method labels and declaration names rest on [FormalProof]: Alpöge's Lean formalisation, announced 20 November 2026 (README, References, last two entries). I did not open that repository. Its status and licence are for the humans.
- Not tested: Green 1955, the source with the largest share of locators, could not be read; the changed wording was not compared with it.
- The convention R03 raises is stated in the family index (lines 66–70) and in 39 of the family's 41 roadmaps, so a decision on it applies to all of them.
