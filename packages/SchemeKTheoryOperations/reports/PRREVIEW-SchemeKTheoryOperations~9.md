# Review of SchemeKTheoryOperations (pull request #1229 at d7628f2)

**Verdict:** needs changes

🤖 Independent AI incremental re-review of the 24 lines changed since 46fa384 (§7.3a, its Scope paragraph and its two new Checks). Two findings, one of them blocking. The gate passes.

## R01 (P2) — The new closure clause for 𝒱 does not supply trivialising opens on a member that is not quasi-separated

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:2981: "among them every open subscheme of a member with quasi-compact inclusion, for instance … the schemes of finite type, over a fixed quasi-compact base. The targets below use only such opens".

**Claim.** T1 obtains the projective bundle formula for `P(E)` "by Zariski-local triviality and descent", so it needs a cover of each term by members of 𝒱 that trivialise E. On a member that is not quasi-separated, affine opens need not have quasi-compact inclusion, and no such cover need exist; the README's third example contains such a member.

**Witness.** `Y=Spec k[x₁,x₂,…]/(x_ix_j)_{i≠j}`, `U=Y∖{0}=⊔_i G_m`, `X=Y∪_U Y`, of finite type over Y. An open with quasi-compact inclusion contains both origins or neither. L glued by `(x_i)_i∈O(U)^×` has order 1 on every line, so is trivial on no such open; `E=L⊕O`.

**Repair.** At :2981 write: "Fix an essentially small full subcategory 𝒱 of quasi-separated schemes containing every scheme smooth and quasi-projective over one of its members, among them every open subscheme of a member with quasi-compact inclusion, in particular every affine open of a member, for instance the smooth quasi-projective schemes, or the smooth quasi-separated schemes of finite type, over a fixed quasi-compact and quasi-separated base, or the schemes of finite type over a fixed Noetherian base." Tested: the witness X is not quasi-separated and is excluded; on a quasi-separated member every affine open has quasi-compact inclusion, so trivialising affine opens are members; a scheme quasi-projective over a quasi-separated scheme is quasi-separated, so the closure clause stays inside the class. KTheoryFiniteLocalFields §1.8 takes 𝒱 to be the schemes of finite type over X and then carries the same qualifier.

## R02 (P3) — The description names axioms, and a pending revision that the sibling heads have made

**Location.** Pull request description: "satisfies a projective bundle axiom and a divisor axiom"; "MotivicEtaleKTheory §7.1 and PadicHodgeRegulators §4.1 still construct their own universal classes and need the matching revision."

**Claim.** The head renames the two axioms to conditions throughout (the summary block also says "a divisor axiom"), and both named sections now take their classes from §7.3a.

**Witness.** README.md:2985–2986 "*Projective bundle condition.*", "*Divisor condition.*"; no "axiom" remains in §7.3a outside the Jannsen locator. MotivicEtaleKTheory/README.md:652 (head 8d34493) "as the instance of SchemeKTheoryOperations §7.3a"; PadicHodgeRegulators/README.md:932 (head a63b5f6) "the syntomic instance of SchemeKTheoryOperations §7.3a (T1–T3)".

**Repair.** In the summary block and the prose write "a projective bundle condition and a divisor condition" and "The divisor condition is stated on simplicial schemes"; replace the last sentence of the paragraph by "KTheoryFiniteLocalFields §§1.8 and 6.10, MotivicEtaleKTheory §§2.0b and 7.1 and PadicHodgeRegulators §4.1 cite §7.3a at their heads."

## Deferred findings

- D01 — resolved: at their open heads KTheoryFiniteLocalFields §§1.8, 6.10, MotivicEtaleKTheory §§2.0b, 7.1 and PadicHodgeRegulators §4.1 state their classes as instances of §7.3a.

## Previous findings

- R01 — repaired: "*Divisor condition.* Let `Y_•→X_•` be a morphism of simplicial schemes … If `a∈H^k(Y_•,Γ(i))` has `ι*a=0`, then `a∪c₁(O(D_•))=0`"; Gysin maps required on simplicial divisors; K-cohomology instance by sheaf-level purity.
- R02 — repaired: "containing every scheme smooth and quasi-projective over one of its members"; "On smooth quasi-projective schemes over a field, which form a category 𝒱 as above". The clause on opens added with it is R01 of this report.
- R03 — repaired: "of locally constant rank r … `c_i(E)=0` on the part of `X_•` where `i>r`"; target `H⁰(X_•,ℤ)×(1+∏_{i≥1}H^{2i}(X_•,Γ(i))tⁱ)`; the two-point Check added.
- R04 — not repaired: deferred (D01)
- R05 — repaired: the description has "Section 7.3a constructs Chern classes `c_{i,j}:K_j(X)→H^{2i−j}(X,Γ(i))` …" and the summary block names them. Its wording against this head is R02 of this report.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Closure of 𝒱, :2981 | Hironaka threefold; quasi-compact open immersion; `GL_N^k×X`, `P(E)`, flag bundles; composition over a quasi-compact base | Threefold no longer required. Quasi-compact open immersion is quasi-affine of finite type, so quasi-projective. The three families are smooth quasi-projective over X. | R02 of r8 repaired |
| Opens of a member, :2981 | `X=Y∪_U Y`, Y infinitely many lines through a point, `L` glued by `(x_i)` | `X` of finite type over affine Y; opens with quasi-compact inclusion contain both origins or neither; order of `a₁/a₂` on line i is 0, of the gluing unit 1 | R01 |
| Divisor condition, :2986 | Constant simplicial scheme; `P(E″)_•⊂P(E)_•`; empty divisor | Constant: the scheme-level condition. `P(E″)_p` is the inverse image of `P(E″)_q`. `D=∅`: `c₁(O)=0`, conclusion `a∪0=0` | Correct |
| Gysin implies the condition, :2988 | `ι*a=0` | `a∪c₁(O(D_•))=a∪ι_*1=ι_*(ι*a∪1)=ι_*0=0`; degrees `H^{k−2}(D_•,Γ(i−1))→H^k(Y_•,Γ(i))` | Correct |
| K-cohomology purity, :3042 | `Γ(i)=𝒦_i[−i]`, codimension 1, against Weibel V.11.14 (v) | `Γ_D(i−1)≅Rι^!Γ(i)[2]` gives `𝒦_{i−1}[−(i−1)]≅Rι^!𝒦_i[2−i]`, that is `Rι^!𝒦_i≅𝒦_{i−1}[−1]` | Correct; matches the README |
| Check, :3052 | `B_•(ℤ/2)_k`, k separably closed, char ≠ 2 | Term p is `2^p` copies of `Spec k`, étale `H²=0`; total `H²(ℤ/2;ℤ/2)=ℤ/2` (`H*(ℤ/2;𝔽₂)=𝔽₂[x]`) | Correct |
| T1 rank and target, :2990, Check :3053 | `Spec k⊔Spec k`, ranks (1,2) | `rank E=(1,2)∈H⁰(X,ℤ)=ℤ²`; `c₂(E)` zero on the first point, relation with r=1 and r=2 separately | Correct; R03 of r8 repaired |
| Scope paragraph, :17 | The five sections it names, at the open heads | KTheoryFiniteLocalFields §1.8 (étale, ℓ-adic continuous), §6.10 (integral motivic); MotivicEtaleKTheory §2.0b, §7.1; PadicHodgeRegulators §4.1: each exists and cites §7.3a | Correct |

Statements the diff does not change stand as in the previous review, of `46fa384`. `Suggested.lean` is unchanged.

- Source locators: the one new locator, Weibel Definition V.11.14 (v), opened at Weibel line 27867–27886 (PDF pp. 468–469): Gysin isomorphism as a map in the derived category and the projection formula as a commutative diagram there. The qualifier "the latter stated there for schemes" on Schneider (IV), p.20 agrees with the r8 reading.
- Seeded sample: of the fifteen sampled sections none contains a changed passage (§7.2 is cited by the changed :3042, and its Chow-valued classes are what that sentence says). The README flags no locator as unverified.
- Cross-roadmap citations resolved: 5 (the sections of the Scope paragraph, above), all consumers later in the merge order (lines 90, 138, 329 against 37); no supplier added.
- Gate, rerun at this head: `gate SchemeKTheoryOperations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate.md also has build=0. Dependency check: `depcheck: 223 roadmaps, 1978 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. `lake env lean` on Suggested.lean: only `declaration uses sorry` at 57:8. No file outside the folder changed.
- Overlap check: read KTheoryFiniteLocalFields, MotivicEtaleKTheory, PadicHodgeRegulators (the roadmaps the change names); shared object: Chern classes out of higher K-theory, owner SchemeKTheoryOperations §7.3a, cited by all three at their heads. The other closest roadmaps stand as read in r8; the overlaps tool lists no dropped id and no other pull request changing this roadmap.
- Source independence: changed passages only; 6 passages compared with 3 sources (Weibel, Schneider as read in r8, Jannsen.1988), none shared; largest share of the §7.3a locators Weibel, 12 of 32; no layer added, removed or reordered, so the contents were not compared again.
- Remark (untouched text): README.md:3182 also names AnabelianGeometryAndNonabelianChabauty as an instance, while its head (README.md:21) leaves the étale classes to KTheoryFiniteLocalFields §1.8; the new Scope paragraph names three roadmaps.

## Not verifiable

- The Schneider text is not in the sources cache; its locators are unchanged apart from the qualifier above and stand as verified in r8.
- Gillet.1980 and Gillet.1981 are cited as whole works without locators (:2979); no statement rests on them alone.
- Lean coverage of §7.3a is README-only: K-groups of schemes are absent at the pins.

## Source issues

- **Gap** in Schneider at §4, Proposition on p.21: the source says the Chern classes give a λ-homomorphism on simplicial schemes, citing Grothendieck, with the weak Gysin property (IV) of p.20 assumed for schemes only; it should be property (IV) for simplicial schemes, or Gysin maps and projection formula in the derived category; affects the proof.

## For the human reviewers

- Licence: the Schneider text (README.md:3239) is a chapter of an Academic Press 1988 volume, read from a seminar page on math.stanford.edu that is not the author's; the README calls it an "institutional seminar copy".
- Licence: packages/SchemeKTheoryOperations/sources.toml records only Kal80; the seven works §7.3a cites (Gillet.1980, Gillet.1981, Schneider, Soulé.1979, WeibelChern, HuberWildeshaus, Jannsen.1988) have no manifest entry. This review edits no manifest.
